alias ll 'eza -l@gh --time-style long-iso'

if test (uname) = Darwin
    alias lt 'eza -la@ghT --time-style long-iso'
    alias ldd 'otool -L'
else
    alias lt 'eza -laghT --time-style long-iso'
end
