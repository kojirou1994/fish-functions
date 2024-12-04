function choco-batch-prog
  choco-cli mux-file --recursive --endless --keep-track-name \
    --copy-normal-files --remove-source-files --sort-track-type \
    --prog-only -v encode --video-quality crf:20 --video-preset flyabc \
    -Xavcodec -maxrate -Xavcodec 5M -Xavcodec -bufsize -Xavcodec 20M \
    --fix-dts --audio-codec opus --reduce-bitrate \
    $argv
end

function choco-batch-filter
  choco-cli mux-file --recursive --keep-track-name \
    --sort-track-type \
    -v encode --video-quality crf:20 --video-preset flyabc \
    -Xavcodec -maxrate -Xavcodec 5M -Xavcodec -bufsize -Xavcodec 20M \
    --fix-dts --audio-codec opus --reduce-bitrate \
    $argv
end
