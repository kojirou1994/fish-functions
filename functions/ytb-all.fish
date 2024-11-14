function ytb-all
    for url in $argv
        yt-dlp --cookies-from-browser chromium -f '(bestvideo[vcodec^=avc]/bestvideo)+(bestaudio[acodec^=mp4a]/bestaudio)' --write-subs --sub-langs all --no-overwrites $url
        yt-dlp --cookies-from-browser chromium -f '(bestvideo[vcodec^=vp]/bestvideo)+(bestaudio[acodec=opus]/bestaudio)' $url
    end
    ytb-av1 $argv
end

function ytb-av1
    for url in $argv
        yt-dlp --cookies-from-browser chromium -f '(bestvideo[vcodec^=av01])+(bestaudio[acodec=opus])' --merge-output-format mkv $url
    end
end
