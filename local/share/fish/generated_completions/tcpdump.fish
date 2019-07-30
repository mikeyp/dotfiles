# tcpdump
# Autogenerated from man page /usr/share/man/man1/tcpdump.1
complete -c tcpdump -s A --description 'Print each packet (minus its link level header) in ASCII.'
complete -c tcpdump -s b --description 'Print the AS number in BGP packets in ASDOT notation rather than ASPLAIN nota…'
complete -c tcpdump -l buffer-size --description 'PD Set the operating system capture buffer size to buffer_size, in units of K…'
complete -c tcpdump -s c --description 'PD Exit after receiving or displaying count packets.'
complete -c tcpdump -s C --description 'Before writing a raw packet to a savefile, check whether the file is currentl…'
complete -c tcpdump -s d --description 'Dump the compiled packet-matching code in a human readable form to standard o…'
complete -c tcpdump -o dd --description 'Dump packet-matching code as a  C program fragment.'
complete -c tcpdump -o ddd --description 'Dump packet-matching code as decimal numbers (preceded with a count).'
complete -c tcpdump -l list-interfaces --description 'PD Print the list of the network interfaces available on the system and on wh…'
complete -c tcpdump -s e --description 'Print the link-level header on each dump line.'
complete -c tcpdump -s E --description 'Use spi@ipaddr algo:secret for decrypting IPsec ESP packets that are addresse…'
complete -c tcpdump -s f --description 'Print `foreign\' IPv4 addresses numerically rather than symbolically (this opt…'
complete -c tcpdump -s F --description 'Use file as input for the filter expression.'
complete -c tcpdump -s g --description 'Do not insert line break after IP header in verbose mode for  easier parsing.'
complete -c tcpdump -s G --description 'If specified, rotates the dump file specified with the  -w option every rotat…'
complete -c tcpdump -l help --description 'PD Print the tcpdump and libpcap version strings, print a usage message, and …'
complete -c tcpdump -l version --description 'PD Print the tcpdump and libpcap version strings and exit.'
complete -c tcpdump -s H --description 'Attempt to detect 802. 11s draft mesh headers.'
complete -c tcpdump -l interface --description 'PD Listen on interface.'
complete -c tcpdump -l monitor-mode --description 'PD Put the interface in "monitor mode"; this is supported only on IEEE 802.'
complete -c tcpdump -l immediate-mode --description 'Capture in "immediate mode".'
complete -c tcpdump -l time-stamp-type --description 'PD Set the time stamp type for the capture to tstamp_type.'
complete -c tcpdump -l list-time-stamp-types --description 'PD List the supported time stamp types for the interface and exit.'
complete -c tcpdump -l time-stamp-precision --description 'When capturing, set the time stamp precision for the capture to tstamp_precis…'
complete -c tcpdump -s k --description 'Control the display of packet metadata via an optional   metadata_arg argumen…'
complete -c tcpdump -l dont-verify-checksums --description 'PD Don\'t attempt to verify IP, TCP, or UDP checksums.'
complete -c tcpdump -s l --description 'Make stdout line buffered.'
complete -c tcpdump -s U --description 'is similar to  -l in its behavior, but it will cause output to be ``packet-bu…'
complete -c tcpdump -l list-data-link-types --description 'PD List the known data link types for the interface, in the specified mode, a…'
complete -c tcpdump -s m --description 'Load SMI MIB module definitions from file module.'
complete -c tcpdump -s M --description 'Use secret as a shared secret for validating the digests found in TCP segment…'
complete -c tcpdump -s n --description 'Don\'t convert addresses (i. e. , host addresses, port numbers, etc.'
complete -c tcpdump -s N --description 'Don\'t print domain name qualification of host names.  E. g.'
complete -c tcpdump -l number --description 'PD Print an optional packet number at the beginning of the line.'
complete -c tcpdump -l no-optimize --description 'PD Do not run the packet-matching code optimizer.'
complete -c tcpdump -s P --description 'Use the pcap-ng file format when saving files.  Apple modification.'
complete -c tcpdump -l no-promiscuous-mode --description 'PD Don\'t put the interface into promiscuous mode.'
complete -c tcpdump -s Q --description 'To specify a filter expression based on packet metadata information like  int…'
complete -c tcpdump -l direction --description 'PD Choose send/receive direction direction for which packets should be captur…'
complete -c tcpdump -s q --description 'Quick (quiet?) output.'
complete -c tcpdump -s r --description 'Read packets from file (which was created with the  -w option or by other too…'
complete -c tcpdump -l absolute-tcp-sequence-numbers --description 'PD Print absolute, rather than relative, TCP sequence numbers.'
complete -c tcpdump -l snapshot-length --description 'PD Snarf snaplen bytes of data from each packet rather than the default of 26…'
complete -c tcpdump -s T --description 'Force packets selected by "expression" to be interpreted the specified type.'
complete -c tcpdump -s t --description 'Don\'t print a timestamp on each dump line.'
complete -c tcpdump -o tt --description 'Print the timestamp, as seconds since January 1, 1970, 00:00:00, UTC, and fra…'
complete -c tcpdump -o ttt --description 'Print a delta (micro-second resolution) between current and previous line on …'
complete -c tcpdump -o tttt --description 'Print a timestamp, as hours, minutes, seconds, and fractions of a second sinc…'
complete -c tcpdump -o ttttt --description 'Print a delta (micro-second resolution) between current and first line on eac…'
complete -c tcpdump -s u --description 'Print undecoded NFS handles.'
complete -c tcpdump -l packet-buffered --description 'PD If the  -w option is not specified, make the printed packet output ``packe…'
complete -c tcpdump -s v --description 'When parsing and printing, produce (slightly more) verbose output.'
complete -c tcpdump -o vv --description 'Even more verbose output.'
complete -c tcpdump -o vvv --description 'Even more verbose output.  For example, telnet SB .'
complete -c tcpdump -s V --description 'Read a list of filenames from file.  Standard input is used if file is ``-\'\'.'
complete -c tcpdump -s w --description 'Write the raw packets to file rather than parsing and printing them out.'
complete -c tcpdump -s W --description 'Used in conjunction with the  -C option, this will limit the number of files …'
complete -c tcpdump -s x --description 'When parsing and printing, in addition to printing the headers of each packet…'
complete -c tcpdump -o xx --description 'When parsing and printing, in addition to printing the headers of each packet…'
complete -c tcpdump -s X --description 'When parsing and printing, in addition to printing the headers of each packet…'
complete -c tcpdump -o XX --description 'When parsing and printing, in addition to printing the headers of each packet…'
complete -c tcpdump -l linktype --description 'PD Set the data link type to use while capturing packets to datalinktype.'
complete -c tcpdump -s z --description 'Used in conjunction with the  -C or  -G options, this will make  tcpdump run …'
complete -c tcpdump -l relinquish-privileges --description 'PD If  tcpdump is running as root, after opening the capture device or input …'
complete -c tcpdump -s B --description '.'
complete -c tcpdump -s D --description '.'
complete -c tcpdump -s i --description 'flag to specify an interface on which to capture.'
complete -c tcpdump -s h --description '.'
complete -c tcpdump -s I --description '.'
complete -c tcpdump -s L --description 'flag.   If.'
complete -c tcpdump -s j --description '.'
complete -c tcpdump -s J --description '.'
complete -c tcpdump -s K --description '.'
complete -c tcpdump -s '#' --description '.'
complete -c tcpdump -s O --description '.'
complete -c tcpdump -s p --description '.'
complete -c tcpdump -s S --description '.'
complete -c tcpdump -s s --description '.'
complete -c tcpdump -s y --description '.'
complete -c tcpdump -s Z --description '.'
complete -c tcpdump -l --------------------------------------------------------------- --description '|          source port          |       destination port        |.'
complete -c tcpdump -l -------------- -l ------------- -l ------------- -l -------------- --description '|  HL   | rsvd  |C|E|U|A|P|R|S|F|        window size            |.'
