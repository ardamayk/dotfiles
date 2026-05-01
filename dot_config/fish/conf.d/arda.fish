# conf.d/arda.fish
echo "DEBUG: arda.fish yukleniyor"
for file in (status dirname)/arda/*.fish
    echo "DEBUG: sourcing $file"
    source $file
end
