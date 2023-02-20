function proxy-on --argument server
    set -gx http_proxy http://$server
    set -gx https_proxy $http_proxy
    set -gx all_proxy socks5://$server
    if status is-interactive
        echo
        echo "Proxy Set To $http_proxy"
        echo
    end
end