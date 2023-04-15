function vps-login --argument server
    ssh -o UserKnownHostsFile=/dev/null root@$server
end