function file_ext_summary
    fd -t f -H . $argv | awk -F'.' '{print $NF}' | sort| uniq -c | sort -g
end