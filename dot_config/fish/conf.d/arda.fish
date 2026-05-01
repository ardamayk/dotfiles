# arda/ klasöründeki her bir .fish dosyasını bul ve yükle
for file in (status dirname)/arda/*.fish
    source $file
end
