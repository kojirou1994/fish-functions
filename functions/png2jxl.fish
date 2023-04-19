function png2jxl
    fd -e png $argv -x img2jxl {} {.}.jxl --delete
end