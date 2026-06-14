function yc
    set tmp (mktemp -t "yazi-chooser.XXXXXX")
    yazi $argv --chooser-file="$tmp"
    if test -s "$tmp"
        echo (cat "$tmp")
        rm -f -- "$tmp"
    end
end
