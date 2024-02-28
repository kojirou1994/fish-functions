alias ll 'eza -la -@ -g -h --time-style long-iso'
alias lt 'll -T'

if test (uname) = Darwin
    alias ldd 'otool -L'
end
