# redo_prebinding
# Autogenerated from man page /Library/Developer/CommandLineTools/usr/share/man/man1/redo_prebinding.1
complete -c redo_prebinding -s c --description 'only check if the file needs to have it\'s prebinding redone and return status.'
complete -c redo_prebinding -s p --description 'check only for prebound files and return status.'
complete -c redo_prebinding -s d --description 'check only for dynamic shared library files and return status.'
complete -c redo_prebinding -s i --description 'ignore non-prebound files (useful when running on all types of files).'
complete -c redo_prebinding -s z --description 'zero out the prebind check sum in the output if it has one.'
complete -c redo_prebinding -s u --description 'unprebind, rather than reprebind (-c, -p, -d, -e ignored).'
complete -c redo_prebinding -s e --description 'replace any dependent library\'s "@executable_path" prefix with the  executabl…'
complete -c redo_prebinding -o seg_addr_table --description 'The  -seg_addr_table option is used when the input a dynamic library and if s…'
complete -c redo_prebinding -o seg_addr_table_filename --description 'Use  pathname instead of the install name of the library for matching an entr…'
complete -c redo_prebinding -o seg1addr --description 'Move the input library to base address  address.'
complete -c redo_prebinding -s r --description 'prepend the  rootdir argument to all dependent libraries.'
complete -c redo_prebinding -s o --description 'write the updated file into  output_file rather than back into the input file.'
complete -c redo_prebinding -s s --description 'write the updated file to standard output DIAGNOSTICS With no -c, -p or -d an…'

