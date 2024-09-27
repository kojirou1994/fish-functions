function noproxy
    set -e http_proxy https_proxy all_proxy
    set -e HTTP_PROXY HTTPS_PROXY ALL_PROXY
    if status is-interactive
        echo "Proxy Off"
    end
end