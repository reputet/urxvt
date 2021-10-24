if has("win32")
    map! <S-Insert> <C-R>+
endif

GuiFont! DejaVu\ Sans\ Mono:h14
GuiPopupmenu 0

" Windows neovim-qt specific
if exists('g:GuiLoaded') && has("win32")
    map! <S-Insert> <C-R>+
endif
