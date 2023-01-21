function ytb-all
    for url in $argv
        yt-dlp -f '(bestvideo[vcodec^=avc]/bestvideo)+(bestaudio[acodec^=mp4a]/bestaudio)' --write-subs --sub-langs all --no-overwrites $url
        yt-dlp -f '(bestvideo[vcodec^=vp9]/bestvideo)+(bestaudio[acodec=opus]/bestaudio)' $url
    end
    ytb-av1 $argv
end

function ytb-av1
    for url in $argv
        yt-dlp -f '(bestvideo[vcodec^=av01])+(bestaudio[acodec=opus])' --merge-output-format mkv $url
    end
end
