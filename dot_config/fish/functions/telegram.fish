function telegram --wraps='flatpak run org.telegram.desktop' --description 'alias telegram=flatpak run org.telegram.desktop'
    flatpak run org.telegram.desktop $argv
end
