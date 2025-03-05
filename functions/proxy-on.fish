function proxy-on --argument server
    set -gx http_proxy $server
    set -gx https_proxy $server
    set -gx all_proxy $server
    set -gx HTTP_PROXY $server
    set -gx HTTPS_PROXY $server
    set -gx ALL_PROXY $server

    if status is-interactive
        echo
        echo "Proxy Set To $server"
        echo
    end
end