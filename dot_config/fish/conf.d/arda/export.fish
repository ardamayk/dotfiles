set -gx UV_PYTHON_PREFERENCE system
set -gx EDITOR nvim
set -gx VISUAL nvim

# fzf'in veri kaynağını fd yap (gitignore'a uyar, hızlıdır)
set -gx FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'

# CTRL-T (Dosya arama) için fd kullan
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

# ALT-C (Klasöre gitme) için fd kullan (Sadece dizinleri listeler)
set -gx FZF_ALT_C_COMMAND 'fd --type d --hidden --strip-cwd-prefix --exclude .git'
