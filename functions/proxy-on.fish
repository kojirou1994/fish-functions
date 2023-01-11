function proxy-on --argument server
echo 
    set -gx http_proxy http://$server
    set -gx https_proxy $http_proxy
    set -gx all_proxy $http_proxy
    if status is-interactive
        echo "Proxy Set To $http_proxy"
    end
end