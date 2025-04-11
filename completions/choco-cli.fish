# A function which filters options which starts with "-" from $argv.
function _swift_choco-cli_preprocessor
    set -l results
    for i in (seq (count $argv))
        switch (echo $argv[$i] | string sub -l 1)
            case '-'
            case '*'
                echo $argv[$i]
        end
    end
end

function _swift_choco-cli_using_command
    set -l currentCommands (_swift_choco-cli_preprocessor (commandline -opc))
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

complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli track-info"' -s h -l help -d 'Show help information.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli track-hash"' -s j
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli track-hash"' -l tmp -d 'Set directory for temp files.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli track-hash"' -l tool -d 'Tool selection: ["ffmpeg", "mkvextract"].' -r -f -k -a 'ffmpeg mkvextract'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli track-hash"' -l hash -d 'ffmpeg hash algorithm'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli track-hash"' -l slow-video -d 'Decode every video frames.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli track-hash"' -l dedup -d 'Deduplicate same spec tracks with mkvpropedit, input must be mkv.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli track-hash"' -l remove-dup -d 'Remove duplicated files.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli track-hash"' -l ffmpeg-options -d 'Extra ffmpeg input options, seperated by comma.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli track-hash"' -l disable-video -l no-v
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli track-hash"' -l disable-audio -l no-a
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli track-hash"' -l disable-subtitles -l no-s
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli track-hash"' -s h -l help -d 'Show help information.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli dump-bdmv"' -l main-only -d 'Main title only in bluray.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli dump-bdmv"' -s h -l help -d 'Show help information.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli thin-bdmv"' -l output -s o -d 'Output root directory.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli thin-bdmv"' -l dry
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli thin-bdmv"' -l size -s s -d 'Maximum copy bytes.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli thin-bdmv"' -s h -l help -d 'Show help information.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli crop"' -l format -s f -d 'Available: [text, ffmpeg]' -r -f -k -a 'text ffmpeg'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli crop"' -l tool -s t -d 'Available: [ffmpeg, handbrake]' -r -f -k -a 'ffmpeg handbrake'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli crop"' -l filter -d 'Base filter for ffmpeg'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli crop"' -l hw -d 'Hardware accel for ffmpeg'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli crop"' -l previews -d 'How many preview images are generated, for handbrake.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli crop"' -l limit -d 'Set higher black value threshold, which can be optionally specified from nothing (0) to everything (255 for 8-bit based formats).'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli crop"' -l round
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli crop"' -l skip
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli crop"' -l frames
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli crop"' -l tmp -d 'Set directory for temp files.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli crop"' -s h -l help -d 'Show help information.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l endless -d 'Endless loop muxing if any success file'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l recursive -d 'Recursive into directories.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l copy-normal-files -d 'Copy normal files.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l copy-overwrite -d 'Overwrite when copy normal files.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l remove-source-files -d 'Delete the source files after remuxing.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l output -s o -d 'Root output directory'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l temp -s t -d 'Root temp directory, use cwd by default, env key: \'CHOCO_TMPDIR\''
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l split -d 'Split info'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l keep-temp -d 'Keep temp dir method, available: always, failed, never' -r -f -k -a 'always failed never'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l ignore-warning -d 'Ignore mkvmerge warning'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l keep-attachments
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l keep-global-tags
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l keep-track-name -d 'Keep original track name'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l keep-video-language -d 'Keep original video track\'s language'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l keep-title
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l keep-disabled
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l sort-track-type -d 'Sort track order by track type, priority: video > audio > subtitle.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l min-pgs-count -d 'Filter pgs subtitle by minimum count.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -s v -l video-process -d 'Video processing method, available: copy, encode, none.' -r -f -k -a 'copy encode none'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l video-filter -d 'FFmpeg video filter argument.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l video-codec -d 'Codec for video track, available: x265, x264, svtav1, h264_vt, hevc_vt, h264_vt_sw, hevc_vt_sw' -r -f -k -a 'x265 x264 svtav1 h264_vt hevc_vt h264_vt_sw hevc_vt_sw'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l video-color -d 'Color preset for video track, available: bt709, bt709RGB' -r -f -k -a 'bt709 bt709RGB'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l encode-script -d 'VS script template path.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l video-preset -d 'Codec preset for video track'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l video-sar -d 'SAR handling for video track, available: notset, source' -r -f -k -a 'notset source'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l video-quality -d 'Codec crf for video track, eg. crf:19 or bitrate:5000k'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l vbv-limit
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l video-tune -d 'Tune for video encoder.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l video-profile -d 'Profile for video encoder'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l video-params -d 'Parameters for video encoder'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -o Xavcodec -d 'Pass flag through to ffmpeg'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l auto-crop -d 'Auto crop video track'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l crop-filter -d 'FFmpeg base video filter for cropping, videoFilter is used by default.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l crop-limit -d 'Set higher black value threshold, which can be optionally specified from nothing (0) to everything (255 for 8-bit based formats).'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l crop-round
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l crop-skip
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l crop-frames
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l prog-only -d 'Only encode progressive video track.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l keep-pix-fmt -d 'Always keep input video\'s pixel format.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l use-intergrated-vapoursynth -d 'Use ffmpeg integrated Vapoursynth'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l keep-flac
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l keep-dtshd
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l keep-truehd
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l fix-dts
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l encode-audio -d 'Encode audio.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l no-encode-audio -d 'Encode audio.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l audio-codec -d 'Codec for lossless audio track, available: flac, alac, opus, aac' -r -f -k -a 'flac alac opus aac'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l audio-lossy-codec -d 'Codec for fixing lossy audio track, available: flac, alac, opus, aac' -r -f -k -a 'flac alac opus aac'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l audio-bitrate -d 'Audio bitrate(kbps) per channel'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l reduce-bitrate -d 'Reduce audio bitrate for multi-channels'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l downmix -d 'Downmix method, available: disable, auto, all' -r -f -k -a 'disable auto all'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l remove-extra-dts -d 'Remove dts when another same spec truehd exists'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l primary-lang -d 'Override input file\'s primary language' -r -f -k -a '6382187 6382437 6382440 6382689 6382713 6383201 6383208 6383218 6383982 6384481 6384491 6384738 6384741 6384743 6384756 6385000 6385255 6385264 6385761 6386273 6386275 6386279 6386285 6386286 6386288 6386292 6386295 6386541 6386548 6386792 6387059 6387297 6387301 6387553 6388077 6388325 6447460 6447465 6447467 6447468 6447469 6447470 6447473 6447475 6447476 6448490 6448492 6448493 6448494 6448498 6449263 6449512 6449515 6449518 6449523 6450273 6450804 6451059 6451809 6451813 6452331 6452577 6452583 6452588 6452594 6453614 6512996 6513001 6513010 6513012 6513013 6514018 6514028 6514785 6514786 6514789 6514791 6514793 6514795 6514797 6514798 6514799 6514800 6514802 6514805 6514806 6514809 6516067 6516338 6516592 6516594 6516595 6516837 6516838 6516848 6517349 6517352 6517360 6517602 6518131 6519397 6578539 6578542 6578546 6578553 6579564 6579566 6580082 6580590 6580598 6582121 6582881 6583138 6583649 6583661 6583668 6584693 6584943 6645353 6645625 6646625 6646904 6647399 6647405 6647919 6648692 6649701 6649711 6709614 6709615 6709620 6711658 6711660 6711662 6711669 6713198 6713957 6713965 6713967 6713970 6713971 6713977 6714732 6714738 6775137 6775161 6775393 6776173 6776175 6776178 6776186 6777196 6777953 6777957 6777959 6777974 6778216 6778728 6778734 6778738 6778740 6779490 6779491 6779493 6779502 6779767 6780266 6780777 6840681 6840692 6840693 6840695 6841698 6841714 6842732 6842733 6842734 6842740 6843758 6843759 6845046 6845282 6845806 6845808 6906465 6906479 6906725 6906991 6908265 6908527 6908789 6909029 6909039 6909537 6909539 6909540 6909541 6909544 6910059 6910561 6910575 6911073 6971766 6972015 6975598 6975602 6976098 7037281 7037282 7037283 7037292 7037293 7037294 7037298 7037299 7037301 7037303 7037306 7037540 7039073 7039081 7039085 7039087 7039339 7039342 7039346 7040354 7040875 7040877 7040878 7040882 7040883 7041125 7041635 7041644 7041647 7041653 7042401 7042413 7042418 7042420 7102820 7102824 7102829 7102831 7102836 7102838 7103866 7104877 7104878 7104884 7106412 7106426 7107706 7107937 7107938 7107943 7107945 7107950 7107951 7107955 7168355 7168356 7168359 7168360 7168361 7168363 7168364 7168366 7168367 7168368 7168370 7168371 7168377 7169126 7169138 7169390 7169889 7170403 7170414 7170419 7170920 7171175 7171188 7171683 7171689 7171695 7171944 7171950 7171955 7173484 7173486 7173491 7173996 7174002 7174510 7174518 7233896 7233897 7233904 7233909 7233910 7234156 7234661 7234671 7234675 7234928 7234935 7235937 7235939 7235957 7237231 7237474 7237479 7237486 7237490 7237999 7238511 7239010 7239523 7240033 7240045 7240046 7240047 7240297 7299945 7301737 7303785 7303789 7304033 7304051 7304289 7304303 7364961 7364967 7364972 7364973 7364974 7364976 7364981 7365999 7366002 7366761 7366766 7367785 7368556 7368558 7368562 7369313 7369327 7370099 7435621 7496042 7496048 7496050 7499617 7499624 7499629 7501165 7501166 7501168 7501171 7561572 7561575 7561576 7561577 7561580 7561581 7561582 7561587 7561588 7562094 7562095 7562604 7562605 7563105 7563118 7563374 7563620 7563630 7563631 7563636 7564385 7564399 7564406 7564641 7564645 7564649 7564650 7564654 7564655 7564659 7564897 7564900 7564907 7565159 7565165 7565166 7565172 7565409 7565924 7565934 7565936 7565938 7566177 7566199 7566699 7566702 7566707 7566712 7567201 7567205 7567715 7567730 7627112 7627113 7627117 7627124 7628140 7628141 7628146 7628148 7628651 7628652 7628897 7629154 7629159 7629170 7629174 7629676 7629928 7629929 7630184 7630695 7630702 7630953 7631721 7631726 7631727 7632235 7632237 7632240 7632242 7632244 7632492 7632745 7633270 7693421 7694177 7694695 7695218 7695714 7695972 7696996 7699042 7758185 7759214 7760229 7761772 7761780 7823723 7823724 7823730 7823731 7824748 7824750 7826542 7827308 7889260 7891055 7954799 7954800 7956836 7958386 7958635 8020336 8020588 8021358 8021864 8022113 8023652 8025452 8025454 8026232 8026721'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l prevent-no-audio
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l no-prevent-no-audio
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l langs -d 'Language filter for all tracks'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l audio-langs -d 'Language filter for audio tracks'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l sub-langs -d 'Language filter for subtitles tracks'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -l log-level -d 'Log level, available: trace, debug, info, notice, warning, error, critical' -r -f -k -a 'trace debug info notice warning error critical'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-file"' -s h -l help -d 'Show help information.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l split-playlist -d 'Split mpls playlist into segments'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l organize -d 'Organize the output files to sub folders, depending on duration'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l main-title -d 'Only handle bdmv\'s main title'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l direct -d 'Direct mode'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l output -s o -d 'Root output directory'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l temp -s t -d 'Root temp directory, use cwd by default, env key: \'CHOCO_TMPDIR\''
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l split -d 'Split info'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l keep-temp -d 'Keep temp dir method, available: always, failed, never' -r -f -k -a 'always failed never'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l ignore-warning -d 'Ignore mkvmerge warning'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l keep-attachments
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l keep-global-tags
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l keep-track-name -d 'Keep original track name'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l keep-video-language -d 'Keep original video track\'s language'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l keep-title
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l keep-disabled
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l sort-track-type -d 'Sort track order by track type, priority: video > audio > subtitle.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l min-pgs-count -d 'Filter pgs subtitle by minimum count.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -s v -l video-process -d 'Video processing method, available: copy, encode, none.' -r -f -k -a 'copy encode none'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l video-filter -d 'FFmpeg video filter argument.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l video-codec -d 'Codec for video track, available: x265, x264, svtav1, h264_vt, hevc_vt, h264_vt_sw, hevc_vt_sw' -r -f -k -a 'x265 x264 svtav1 h264_vt hevc_vt h264_vt_sw hevc_vt_sw'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l video-color -d 'Color preset for video track, available: bt709, bt709RGB' -r -f -k -a 'bt709 bt709RGB'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l encode-script -d 'VS script template path.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l video-preset -d 'Codec preset for video track'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l video-sar -d 'SAR handling for video track, available: notset, source' -r -f -k -a 'notset source'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l video-quality -d 'Codec crf for video track, eg. crf:19 or bitrate:5000k'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l vbv-limit
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l video-tune -d 'Tune for video encoder.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l video-profile -d 'Profile for video encoder'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l video-params -d 'Parameters for video encoder'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -o Xavcodec -d 'Pass flag through to ffmpeg'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l auto-crop -d 'Auto crop video track'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l crop-filter -d 'FFmpeg base video filter for cropping, videoFilter is used by default.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l crop-limit -d 'Set higher black value threshold, which can be optionally specified from nothing (0) to everything (255 for 8-bit based formats).'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l crop-round
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l crop-skip
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l crop-frames
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l prog-only -d 'Only encode progressive video track.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l keep-pix-fmt -d 'Always keep input video\'s pixel format.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l use-intergrated-vapoursynth -d 'Use ffmpeg integrated Vapoursynth'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l keep-flac
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l keep-dtshd
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l keep-truehd
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l fix-dts
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l encode-audio -d 'Encode audio.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l no-encode-audio -d 'Encode audio.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l audio-codec -d 'Codec for lossless audio track, available: flac, alac, opus, aac' -r -f -k -a 'flac alac opus aac'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l audio-lossy-codec -d 'Codec for fixing lossy audio track, available: flac, alac, opus, aac' -r -f -k -a 'flac alac opus aac'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l audio-bitrate -d 'Audio bitrate(kbps) per channel'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l reduce-bitrate -d 'Reduce audio bitrate for multi-channels'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l downmix -d 'Downmix method, available: disable, auto, all' -r -f -k -a 'disable auto all'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l remove-extra-dts -d 'Remove dts when another same spec truehd exists'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l primary-lang -d 'Override input file\'s primary language' -r -f -k -a '6382187 6382437 6382440 6382689 6382713 6383201 6383208 6383218 6383982 6384481 6384491 6384738 6384741 6384743 6384756 6385000 6385255 6385264 6385761 6386273 6386275 6386279 6386285 6386286 6386288 6386292 6386295 6386541 6386548 6386792 6387059 6387297 6387301 6387553 6388077 6388325 6447460 6447465 6447467 6447468 6447469 6447470 6447473 6447475 6447476 6448490 6448492 6448493 6448494 6448498 6449263 6449512 6449515 6449518 6449523 6450273 6450804 6451059 6451809 6451813 6452331 6452577 6452583 6452588 6452594 6453614 6512996 6513001 6513010 6513012 6513013 6514018 6514028 6514785 6514786 6514789 6514791 6514793 6514795 6514797 6514798 6514799 6514800 6514802 6514805 6514806 6514809 6516067 6516338 6516592 6516594 6516595 6516837 6516838 6516848 6517349 6517352 6517360 6517602 6518131 6519397 6578539 6578542 6578546 6578553 6579564 6579566 6580082 6580590 6580598 6582121 6582881 6583138 6583649 6583661 6583668 6584693 6584943 6645353 6645625 6646625 6646904 6647399 6647405 6647919 6648692 6649701 6649711 6709614 6709615 6709620 6711658 6711660 6711662 6711669 6713198 6713957 6713965 6713967 6713970 6713971 6713977 6714732 6714738 6775137 6775161 6775393 6776173 6776175 6776178 6776186 6777196 6777953 6777957 6777959 6777974 6778216 6778728 6778734 6778738 6778740 6779490 6779491 6779493 6779502 6779767 6780266 6780777 6840681 6840692 6840693 6840695 6841698 6841714 6842732 6842733 6842734 6842740 6843758 6843759 6845046 6845282 6845806 6845808 6906465 6906479 6906725 6906991 6908265 6908527 6908789 6909029 6909039 6909537 6909539 6909540 6909541 6909544 6910059 6910561 6910575 6911073 6971766 6972015 6975598 6975602 6976098 7037281 7037282 7037283 7037292 7037293 7037294 7037298 7037299 7037301 7037303 7037306 7037540 7039073 7039081 7039085 7039087 7039339 7039342 7039346 7040354 7040875 7040877 7040878 7040882 7040883 7041125 7041635 7041644 7041647 7041653 7042401 7042413 7042418 7042420 7102820 7102824 7102829 7102831 7102836 7102838 7103866 7104877 7104878 7104884 7106412 7106426 7107706 7107937 7107938 7107943 7107945 7107950 7107951 7107955 7168355 7168356 7168359 7168360 7168361 7168363 7168364 7168366 7168367 7168368 7168370 7168371 7168377 7169126 7169138 7169390 7169889 7170403 7170414 7170419 7170920 7171175 7171188 7171683 7171689 7171695 7171944 7171950 7171955 7173484 7173486 7173491 7173996 7174002 7174510 7174518 7233896 7233897 7233904 7233909 7233910 7234156 7234661 7234671 7234675 7234928 7234935 7235937 7235939 7235957 7237231 7237474 7237479 7237486 7237490 7237999 7238511 7239010 7239523 7240033 7240045 7240046 7240047 7240297 7299945 7301737 7303785 7303789 7304033 7304051 7304289 7304303 7364961 7364967 7364972 7364973 7364974 7364976 7364981 7365999 7366002 7366761 7366766 7367785 7368556 7368558 7368562 7369313 7369327 7370099 7435621 7496042 7496048 7496050 7499617 7499624 7499629 7501165 7501166 7501168 7501171 7561572 7561575 7561576 7561577 7561580 7561581 7561582 7561587 7561588 7562094 7562095 7562604 7562605 7563105 7563118 7563374 7563620 7563630 7563631 7563636 7564385 7564399 7564406 7564641 7564645 7564649 7564650 7564654 7564655 7564659 7564897 7564900 7564907 7565159 7565165 7565166 7565172 7565409 7565924 7565934 7565936 7565938 7566177 7566199 7566699 7566702 7566707 7566712 7567201 7567205 7567715 7567730 7627112 7627113 7627117 7627124 7628140 7628141 7628146 7628148 7628651 7628652 7628897 7629154 7629159 7629170 7629174 7629676 7629928 7629929 7630184 7630695 7630702 7630953 7631721 7631726 7631727 7632235 7632237 7632240 7632242 7632244 7632492 7632745 7633270 7693421 7694177 7694695 7695218 7695714 7695972 7696996 7699042 7758185 7759214 7760229 7761772 7761780 7823723 7823724 7823730 7823731 7824748 7824750 7826542 7827308 7889260 7891055 7954799 7954800 7956836 7958386 7958635 8020336 8020588 8021358 8021864 8022113 8023652 8025452 8025454 8026232 8026721'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l prevent-no-audio
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l no-prevent-no-audio
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l langs -d 'Language filter for all tracks'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l audio-langs -d 'Language filter for audio tracks'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l sub-langs -d 'Language filter for subtitles tracks'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -l log-level -d 'Log level, available: trace, debug, info, notice, warning, error, critical' -r -f -k -a 'trace debug info notice warning error critical'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mux-bdmv"' -s h -l help -d 'Show help information.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mkv-to-mp4 check"' -s h -l help -d 'Show help information.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mkv-to-mp4 mux"' -l overwrite
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mkv-to-mp4 mux"' -l verbose
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mkv-to-mp4 mux"' -l keep-track-name
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mkv-to-mp4 mux"' -l tmp
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mkv-to-mp4 mux"' -l mp4-tmp -d 'MP4Box tmp dir, if not set, tmp is used'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mkv-to-mp4 mux"' -l output
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mkv-to-mp4 mux"' -l und-audio-lang
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mkv-to-mp4 mux"' -s h -l help -d 'Show help information.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mkv-to-mp4" "check mux help"' -s h -l help -d 'Show help information.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mkv-to-mp4" "check mux help"' -f -a 'check' -d ''
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mkv-to-mp4" "check mux help"' -f -a 'mux' -d ''
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mkv-to-mp4" "check mux help"' -f -a 'help' -d 'Show subcommand help information.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mpls parse"' -l generate
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mpls parse"' -l absolute
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mpls parse"' -l dump-info
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mpls parse"' -l start-time
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mpls parse"' -s h -l help -d 'Show help information.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mpls split"' -l parts
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mpls split"' -l join-output
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mpls split"' -l skip-join-single
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mpls split"' -l drop-rest
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mpls split"' -s h -l help -d 'Show help information.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mpls" "parse split help"' -s h -l help -d 'Show help information.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mpls" "parse split help"' -f -a 'parse' -d ''
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mpls" "parse split help"' -f -a 'split' -d ''
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli mpls" "parse split help"' -f -a 'help' -d 'Show subcommand help information.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli test-filter"' -l start -d 'Start position.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli test-filter"' -l filter -d 'Specific filter to use.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli test-filter"' -l frames -d 'Frames output count limit.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli test-filter"' -l output -d 'Output root directory.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli test-filter"' -s h -l help -d 'Show help information.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli test-script"' -l preview-directory
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli test-script"' -l format -s f -d 'preview images output format'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli test-script"' -l start
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli test-script"' -l end
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli test-script"' -l depth -d 'vs output depth'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli test-script"' -l crop
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli test-script"' -s h -l help -d 'Show help information.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli verify"' -l video-only
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli verify"' -l hw -r -f -k -a 'videotoolbox cuvid'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli verify"' -l verbose -s v
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli verify"' -s h -l help -d 'Show help information.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli explain bitrate"' -l reduce
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli explain bitrate"' -s h -l help -d 'Show help information.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli explain" "bitrate help"' -s h -l help -d 'Show help information.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli explain" "bitrate help"' -f -a 'bitrate' -d ''
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli explain" "bitrate help"' -f -a 'help' -d 'Show subcommand help information.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli" "track-info track-hash dump-bdmv thin-bdmv crop mux-file mux-bdmv mkv-to-mp4 mpls test-filter test-script verify explain help"' -s h -l help -d 'Show help information.'
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli" "track-info track-hash dump-bdmv thin-bdmv crop mux-file mux-bdmv mkv-to-mp4 mpls test-filter test-script verify explain help"' -f -a 'track-info' -d ''
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli" "track-info track-hash dump-bdmv thin-bdmv crop mux-file mux-bdmv mkv-to-mp4 mpls test-filter test-script verify explain help"' -f -a 'track-hash' -d ''
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli" "track-info track-hash dump-bdmv thin-bdmv crop mux-file mux-bdmv mkv-to-mp4 mpls test-filter test-script verify explain help"' -f -a 'dump-bdmv' -d ''
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli" "track-info track-hash dump-bdmv thin-bdmv crop mux-file mux-bdmv mkv-to-mp4 mpls test-filter test-script verify explain help"' -f -a 'thin-bdmv' -d ''
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli" "track-info track-hash dump-bdmv thin-bdmv crop mux-file mux-bdmv mkv-to-mp4 mpls test-filter test-script verify explain help"' -f -a 'crop' -d ''
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli" "track-info track-hash dump-bdmv thin-bdmv crop mux-file mux-bdmv mkv-to-mp4 mpls test-filter test-script verify explain help"' -f -a 'mux-file' -d ''
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli" "track-info track-hash dump-bdmv thin-bdmv crop mux-file mux-bdmv mkv-to-mp4 mpls test-filter test-script verify explain help"' -f -a 'mux-bdmv' -d ''
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli" "track-info track-hash dump-bdmv thin-bdmv crop mux-file mux-bdmv mkv-to-mp4 mpls test-filter test-script verify explain help"' -f -a 'mkv-to-mp4' -d ''
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli" "track-info track-hash dump-bdmv thin-bdmv crop mux-file mux-bdmv mkv-to-mp4 mpls test-filter test-script verify explain help"' -f -a 'mpls' -d ''
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli" "track-info track-hash dump-bdmv thin-bdmv crop mux-file mux-bdmv mkv-to-mp4 mpls test-filter test-script verify explain help"' -f -a 'test-filter' -d ''
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli" "track-info track-hash dump-bdmv thin-bdmv crop mux-file mux-bdmv mkv-to-mp4 mpls test-filter test-script verify explain help"' -f -a 'test-script' -d ''
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli" "track-info track-hash dump-bdmv thin-bdmv crop mux-file mux-bdmv mkv-to-mp4 mpls test-filter test-script verify explain help"' -f -a 'verify' -d ''
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli" "track-info track-hash dump-bdmv thin-bdmv crop mux-file mux-bdmv mkv-to-mp4 mpls test-filter test-script verify explain help"' -f -a 'explain' -d ''
complete -c choco-cli -n '_swift_choco-cli_using_command "choco-cli" "track-info track-hash dump-bdmv thin-bdmv crop mux-file mux-bdmv mkv-to-mp4 mpls test-filter test-script verify explain help"' -f -a 'help' -d 'Show subcommand help information.'
