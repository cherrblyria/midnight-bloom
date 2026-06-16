function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        # @fish-lsp-disable-next-line 7001
        z -- "$cwd"
        rm -f -- "$tmp"
    end
end
