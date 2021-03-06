# killall
# Autogenerated from man page /usr/share/man/man1/killall.1
complete -c killall -s v --description 'Be more verbose about what will be done.'
complete -c killall -s e --description 'Use the effective user ID instead of the (default) real user ID for matching …'
complete -c killall -o help --description 'Give a help on the command usage and exit.'
complete -c killall -s l --description 'List the names of the available signals and exit, like in kill 1.'
complete -c killall -s m --description 'Match the argument procname as a (case sensitive) regular expression against …'
complete -c killall -s s --description 'Show only what would be done, but do not send any signal.'
complete -c killall -s d --description 'Print detailed information about the processes matched, but do not send any s…'
complete -c killall -o SIGNAL --description 'Send a different signal instead of the default TERM.'
complete -c killall -s u --description 'Limit potentially matching processes to those belonging to the specified user.'
complete -c killall -s t --description 'Limit potentially matching processes to those running on the specified tty.'
complete -c killall -s c --description 'When used with the u or t flags, limit potentially matching processes to thos…'
complete -c killall -s z --description 'Do not skip zombies.'

