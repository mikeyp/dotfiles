require "extensions"
require "undo"
require "chain"
require "window_layouts"

-- Auto reload config on changes
hs.loadSpoon('ReloadConfiguration')
spoon.ReloadConfiguration:start()

-------------------------------------------------------------------------------
-- Configuration
-------------------------------------------------------------------------------

local hyper = {"cmd", "alt", "ctrl", "shift"}

-- No window animations
hs.window.animationDuration = 0

-- Allow spotlight searches for apps
hs.application.enableSpotlightForNameSearches(true)

-- Undo
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "U", function()
  undo:pop()
end)

-- Play/Pause spotify
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "space", function ()
  local application = hs.application.find("Spotify")
  if (application ~= nil) then
    if hs.spotify.getPlaybackState() == hs.spotify.state_paused then
      hs.spotify.play()
    elseif hs.spotify.getPlaybackState() == hs.spotify.state_playing then
      hs.spotify.pause()
    end
  end
end)

-- Spotify show track info
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "D", function()
  local application = hs.application.find("Spotify")

  if (application ~= nil) then
    local id = hs.spotify.getCurrentTrackId()
    local embed_url = f"https://embed.spotify.com/oembed?url={id}"

    hs.http.asyncGet(embed_url, {}, function(status, body, headers)
      if (status == 200) then
        local trackInfo = hs.json.decode(body)
        local image = hs.image.imageFromURL(trackInfo.thumbnail_url)
        local track = hs.spotify.getCurrentTrack()
        local artist = hs.spotify.getCurrentArtist()
        local album = hs.spotify.getCurrentAlbum()
        local icon = hs.image.imageFromAppBundle("com.spotify.client")

        local notification = hs.notify.new({title=track, subTitle=f"{artist} — {album}", withdrawAfter=3, contentImage=image, setIdImage=icon})
        notification:send()
      end
    end)
  end
end)

-- Spotify previous track
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "left", function()
  local application = hs.application.find("Spotify")
  if (application ~= nil) then
    hs.spotify.previous()
  end
end)

-- Spotify previous track
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "right", function()
  local application = hs.application.find("Spotify")
  if (application ~= nil) then
    hs.spotify.next()
  end
end)

-- Full screen
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "F", function()
  local window = hs.window.focusedWindow()
  fullScreen(window)
end)


-- Left toggler
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "R", chain({
  leftLeftHalf,
  leftRightHalf
}))

-- Right toggler
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "T", chain({
  rightLeftHalf,
  rightRightHalf
}))

-- PHPStorm hotkey
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "P", function()
  local window = hs.window.focusedWindow()
  rightLeftFourSevenths(window)
end)

-- Terminal hotkey
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "O", function()
  local window = hs.window.focusedWindow()
  rightRightThreeSevenths(window)
end)

-- Layout hotkey
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "L", function()
  hs.layout.apply(layout1)
end)

-- Layout watcher
local layoutWatcher = hs.screen.watcher.new(function()
  local screens = hs.screen.allScreens()

  if (#screens == 2) then
    hs.layout.apply(layout1)
  end
end)

layoutWatcher:start()

-- USB watcher
usbWatcher = nil

function usbDeviceCallback(data)
    if (data["productName"] == "ScanSnap S1300") then
        if (data["eventType"] == "added") then
            hs.application.launchOrFocus("ScanSnap Manager")
        elseif (data["eventType"] == "removed") then
            app = hs.appfinder.appFromName("ScanSnap Manager")
            app:kill()
        end
    end
end

usbWatcher = hs.usb.watcher.new(usbDeviceCallback)
usbWatcher:start()

-- Resucetime watcher
local rescueTimeApiTimer = hs.timer.doEvery(30, function()
  local url = 'https://us-central1-mikeyp-api.cloudfunctions.net/api?key=rescuetime-focus-mode'
  hs.http.asyncGet(url, {}, function(status, body, headers)
    local data = hs.json.decode(body)
    hs.settings.set('rescuetime-focus-mode', data.enabled)
  end)
end)

local focusApps = {
  "Mail",
  "Slack",
  "Tweetbot",
  "Messages"
}

local rescueTimeWatcher = hs.settings.watchKey('main', 'rescuetime-focus-mode', function()
  local status = hs.settings.get('rescuetime-focus-mode')
  local appSettings = {}
  if (status) then
    local notification = hs.notify.new({title="Closing applications for FocusTime", withdrawAfter=5})
    -- Focus mode is enabled (true)
    hs.fnutils.each(focusApps, function(app)
      local app = hs.application.find(app)
      if (app ~= nil) then
        -- app is running
        table.insert(appSettings, app:title())
        app:kill()
      end

    end)
    -- save the settings for next time.
    hs.settings.set('focus-mode-app-status', appSettings)
  else
    -- Focus mode is disabled
    appSettings = hs.settings.get('focus-mode-app-status')
    hs.fnutils.each(appSettings, function(appName)
      hs.application.launchOrFocus(appName)
      returnAppToLayout(appName)
    end)
    -- clear settings for next time
    hs.settings.set('focus-mode-app-status', {})
  end
end)

function returnAppToLayout(appName)
  hs.fnutils.each(layout1, function(layout)
    if (layout[1] == appName) then
      local app = hs.appfinder.appFromName(appName)
      local window = app:mainWindow()
      window:setFrame(layout[5])
    end
  end)
end
