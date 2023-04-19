function batch2jxl
    fd -e png $argv -x img2jxl {} {.}.jxl --delete
    fd -e jpg $argv -x img2jxl {} {.}.jxl --delete
    fd -e jpeg $argv -x img2jxl {} {.}.jxl --delete
end

function png2jxl
    fd -e png $argv -x img2jxl {} {.}.jxl --delete
end