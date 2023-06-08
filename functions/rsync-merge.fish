function rsync-merge
    rsync -av --progress --ignore-existing --remove-source-files $argv
end