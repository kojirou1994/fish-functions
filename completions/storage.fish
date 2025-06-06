# A function which filters options which starts with "-" from $argv.
function _swift_storage_preprocessor
    set -l results
    for i in (seq (count $argv))
        switch (echo $argv[$i] | string sub -l 1)
            case '-'
            case '*'
                echo $argv[$i]
        end
    end
end

function _swift_storage_using_command
    set -l currentCommands (_swift_storage_preprocessor (commandline -opc))
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

complete -c storage -n '_swift_storage_using_command "storage init"' -s h -l help -d 'Show help information.'
complete -c storage -n '_swift_storage_using_command "storage upload"' -l strict -d 'Check dest drive'
complete -c storage -n '_swift_storage_using_command "storage upload"' -l no-strict -d 'Check dest drive'
complete -c storage -n '_swift_storage_using_command "storage upload"' -s h -l help -d 'Show help information.'
complete -c storage -n '_swift_storage_using_command "storage upload-dav"' -l server -d 'webdav server host:port'
complete -c storage -n '_swift_storage_using_command "storage upload-dav"' -s h -l help -d 'Show help information.'
complete -c storage -n '_swift_storage_using_command "storage down"' -l reserve -d 'Reserved disk space beyond downloading.as percent if 0...1.0. as GB if >1'
complete -c storage -n '_swift_storage_using_command "storage down"' -l delete -s d -d 'Delete after download.'
complete -c storage -n '_swift_storage_using_command "storage down"' -l chin -d 'Is chin downloading.'
complete -c storage -n '_swift_storage_using_command "storage down"' -s h -l help -d 'Show help information.'
complete -c storage -n '_swift_storage_using_command "storage transfer"' -l drive -d 'Source drive ID'
complete -c storage -n '_swift_storage_using_command "storage transfer"' -d 'data name' -r -f -k -a 'UP2 UP4 OD_TEMP'
complete -c storage -n '_swift_storage_using_command "storage transfer"' -s h -l help -d 'Show help information.'
complete -c storage -n '_swift_storage_using_command "storage size-od"' -l clean
complete -c storage -n '_swift_storage_using_command "storage size-od"' -s h -l help -d 'Show help information.'
complete -c storage -n '_swift_storage_using_command "storage size-gd"' -l clean
complete -c storage -n '_swift_storage_using_command "storage size-gd"' -s h -l help -d 'Show help information.'
complete -c storage -n '_swift_storage_using_command "storage split"' -l join -d 'join all inputs to one archive.'
complete -c storage -n '_swift_storage_using_command "storage split"' -l format -s f
complete -c storage -n '_swift_storage_using_command "storage split"' -s h -l help -d 'Show help information.'
complete -c storage -n '_swift_storage_using_command "storage temp up"' -r -f -k -a 'od1 od2 od3 od4 od5 od6 od-pool'
complete -c storage -n '_swift_storage_using_command "storage temp up"' -s h -l help -d 'Show help information.'
complete -c storage -n '_swift_storage_using_command "storage temp" "up"' -s h -l help -d 'Show help information.'
complete -c storage -n '_swift_storage_using_command "storage temp" "up"' -f -a 'up' -d ''
complete -c storage -n '_swift_storage_using_command "storage prepare"' -l skip-small -d 'Skip small files.'
complete -c storage -n '_swift_storage_using_command "storage prepare"' -l pack-size -d 'Minimum pack size in GB.'
complete -c storage -n '_swift_storage_using_command "storage prepare"' -s j -d 'run N jobs in parallel'
complete -c storage -n '_swift_storage_using_command "storage prepare"' -s h -l help -d 'Show help information.'
complete -c storage -n '_swift_storage_using_command "storage" "init upload upload-dav down transfer size-od size-gd split temp prepare help"' -s h -l help -d 'Show help information.'
complete -c storage -n '_swift_storage_using_command "storage" "init upload upload-dav down transfer size-od size-gd split temp prepare help"' -f -a 'init' -d ''
complete -c storage -n '_swift_storage_using_command "storage" "init upload upload-dav down transfer size-od size-gd split temp prepare help"' -f -a 'upload' -d 'Upload files to OneDrives.'
complete -c storage -n '_swift_storage_using_command "storage" "init upload upload-dav down transfer size-od size-gd split temp prepare help"' -f -a 'upload-dav' -d 'Upload files to MY Webdav server.'
complete -c storage -n '_swift_storage_using_command "storage" "init upload upload-dav down transfer size-od size-gd split temp prepare help"' -f -a 'down' -d 'Download rclone remote files to LOCAL.'
complete -c storage -n '_swift_storage_using_command "storage" "init upload upload-dav down transfer size-od size-gd split temp prepare help"' -f -a 'transfer' -d 'Move files from OneDrive to GoogleDrive.'
complete -c storage -n '_swift_storage_using_command "storage" "init upload upload-dav down transfer size-od size-gd split temp prepare help"' -f -a 'size-od' -d 'Onedrive size summary.'
complete -c storage -n '_swift_storage_using_command "storage" "init upload upload-dav down transfer size-od size-gd split temp prepare help"' -f -a 'size-gd' -d 'Google drive size summary.'
complete -c storage -n '_swift_storage_using_command "storage" "init upload upload-dav down transfer size-od size-gd split temp prepare help"' -f -a 'split' -d ''
complete -c storage -n '_swift_storage_using_command "storage" "init upload upload-dav down transfer size-od size-gd split temp prepare help"' -f -a 'temp' -d 'Manage odrive tempdirs'
complete -c storage -n '_swift_storage_using_command "storage" "init upload upload-dav down transfer size-od size-gd split temp prepare help"' -f -a 'prepare' -d ''
complete -c storage -n '_swift_storage_using_command "storage" "init upload upload-dav down transfer size-od size-gd split temp prepare help"' -f -a 'help' -d 'Show subcommand help information.'
