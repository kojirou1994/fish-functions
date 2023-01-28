function pldec --description "Decode plist files to swift codes" --argument files
    plutil -convert swift -o - $files
end