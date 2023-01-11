function noproxy
    set -e http_proxy https_proxy all_proxy
    if status is-interactive
        echo "Proxy Off"
    end
end