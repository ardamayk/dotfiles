# ~/.bashrc ya da ~/.bash_functions içine ekle
wlcopy_file() {
  # wl-copy ve realpath kontrolü
  if ! command -v wl-copy >/dev/null 2>&1; then
    printf >&2 "Hata: wl-copy yüklü değil.\n"
    return 1
  fi
  if ! command -v realpath >/dev/null 2>&1; then
    printf >&2 "Hata: realpath yüklü değil.\n"
    return 1
  fi

  if [ $# -eq 0 ]; then
    printf "Kullanım: wlcopy_file <yol...>\n"
    printf "Örnek:  wlcopy_file ./resim.png dosyalar/*.pdf\n"
    return 2
  fi

  # URL encode için Python kullan (varsa). Yoksa basit bir fallback.
  _quote_path() {
    if command -v python3 >/dev/null 2>&1; then
      python3 - <<'PY' "$1"
import sys, urllib.parse
p = sys.argv[1]
# Slashları koru, diğerlerini encode et
print(urllib.parse.quote(p, safe="/-_.~"))
PY
    else
      # Basit fallback: boşluk -> %20 (tam güvenli değil ama iş görür)
      printf '%s' "$1" | sed 's/ /%20/g'
    fi
  }

  uris=()
  had_error=0

  # Shell globlarını kullanıcıya bırakıyoruz: wlcopy_file *.png gibi.
  for arg in "$@"; do
    # Argüman yoksa/boşsa atla
    [ -z "$arg" ] && continue

    # Absolute yola çevir (PWD ile birleştirir)
    abs_path=$(realpath -m -- "$arg" 2>/dev/null)
    if [ ! -e "$abs_path" ]; then
      printf >&2 "Uyarı: Bulunamadı: %s\n" "$arg"
      had_error=1
      continue
    fi

    # URI'yi üret (file:///absolute/yol)
    enc=$(_quote_path "$abs_path")
    uris+=("file://$enc")
  done

  # Hiç geçerli yol çıkmadıysa
  if [ ${#uris[@]} -eq 0 ]; then
    printf >&2 "Hata: Panoya eklenecek geçerli yol yok.\n"
    return 3
  fi

  # Spec'e uygun olarak CRLF ile ayır (birçok uygulama LF'yi de kabul eder)
  # text/uri-list MIME tipi ile wl-copy'a gönder
  {
    for u in "${uris[@]}"; do
      printf "%s\r\n" "$u"
    done
  } | wl-copy --type text/uri-list

  # Kısa geri bildirim
  if [ ${#uris[@]} -eq 1 ]; then
    printf "Panoya kopyalandı: %s\n" "${uris[0]}"
  else
    printf "Panoya %d öğe kopyalandı.\n" "${#uris[@]}"
  fi

  # En az bir argüman hatalıysa non-zero döndür
  [ $had_error -ne 0 ] && return 4 || return 0
}


# function kittysession() {
#   if [ -z "$1" ]; then
#     echo "Kullanım: kittysession <session_dosyası>"
#     return 1
#   fi
#
#   local input_path="$1"
#   local session_path=""
#
#   # Absolute path mi?
#   if [[ "$input_path" = /* ]]; then
#     session_path="$input_path"
#   else
#     # Relative path'i tam yola çevir
#     session_path="$(realpath "$input_path" 2>/dev/null)"
#   fi
#
#   # Dosya mevcut mu kontrol et
#   if [ ! -f "$session_path" ]; then
#     echo "Hata: '$session_path' bulunamadı."
#     return 1
#   fi
#
#   # Loglama (debug amaçlı, istersen silebilirsin)
#   echo "$session_path" >> ~/file.txt
#
#   # Session'ı başlat ve terminali kapat
#   nohup kitty --session "$session_path" >/dev/null 2>&1 & disown && exit
# }
