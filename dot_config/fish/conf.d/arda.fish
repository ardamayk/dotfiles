# conf.d/arda.fish
for file in (status dirname)/arda/*.fish
    echo "DEBUG: sourcing $file"
    source $file
end
