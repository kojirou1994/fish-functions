alias ls 'eza -1'

if test (uname) = Darwin
    alias lt 'eza -la@ghT --time-style long-iso'
    alias ll 'eza -la@gh --time-style long-iso'
    alias ldd 'otool -L'
else
    alias lt 'eza -laghT --time-style long-iso'
    alias ll 'eza -lagh --time-style long-iso'
    alias lll 'eza -la@gh --time-style long-iso'
end
