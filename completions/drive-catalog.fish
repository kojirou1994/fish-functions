# A function which filters options which starts with "-" from $argv.
function _swift_drive-catalog_preprocessor
    set -l results
    for i in (seq (count $argv))
        switch (echo $argv[$i] | string sub -l 1)
            case '-'
            case '*'
                echo $argv[$i]
        end
    end
end

function _swift_drive-catalog_using_command
    set -l currentCommands (_swift_drive-catalog_preprocessor (commandline -opc))
    set -l expectedCommands (string split " " $argv[1])
    set -l subcommands (string split " " $argv[2])
    if [ (count $currentCommands) -ge (count $expectedCommands) ]
        for i in (seq (count $expectedCommands))
            if [ $currentCommands[$i] != $expectedCommands[$i] ]
                return 1
            end
        end
        if [ (count $currentCommands) -eq (count $expectedCommands) ]
            return 0
        end
        if [ (count $subcommands) -gt 1 ]
            for i in (seq (count $subcommands))
                if [ $currentCommands[(math (count $expectedCommands) + 1)] = $subcommands[$i] ]
                    return 1
                end
            end
        end
        return 0
    end
    return 1
end

complete -c drive-catalog -n '_swift_drive-catalog_using_command "drive-catalog index"' -l level -d 'zstd level'
complete -c drive-catalog -n '_swift_drive-catalog_using_command "drive-catalog index"' -l remote -d 'Set listing remote rclone drive'
complete -c drive-catalog -n '_swift_drive-catalog_using_command "drive-catalog index"' -l index -s i -d 'Force set index file path.'
complete -c drive-catalog -n '_swift_drive-catalog_using_command "drive-catalog index"' -s h -l help -d 'Show help information.'
complete -c drive-catalog -n '_swift_drive-catalog_using_command "drive-catalog search"' -l drive -s d -d '\'all\' or filename(no extension) in FS_INDEX'
complete -c drive-catalog -n '_swift_drive-catalog_using_command "drive-catalog search"' -l or -d 'Use OR instead of AND for patterns'
complete -c drive-catalog -n '_swift_drive-catalog_using_command "drive-catalog search"' -l index -s i -d 'Force set index file path.'
complete -c drive-catalog -n '_swift_drive-catalog_using_command "drive-catalog search"' -s h -l help -d 'Show help information.'
complete -c drive-catalog -n '_swift_drive-catalog_using_command "drive-catalog" "index search help"' -s h -l help -d 'Show help information.'
complete -c drive-catalog -n '_swift_drive-catalog_using_command "drive-catalog" "index search help"' -f -a 'index' -d ''
complete -c drive-catalog -n '_swift_drive-catalog_using_command "drive-catalog" "index search help"' -f -a 'search' -d ''
complete -c drive-catalog -n '_swift_drive-catalog_using_command "drive-catalog" "index search help"' -f -a 'help' -d 'Show subcommand help information.'
