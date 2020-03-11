let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/scripts/DMS_backend
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +126 data/models.py
badd +94 dms_backend/settings.py
badd +7 data/views.py
badd +1 dms_backend/__init__.py
badd +1 dms_backend/urls.py
badd +1 dms_backend/wsgi.py
badd +13 manage.py
badd +190 ~/.config/nvim/init.vim
argglobal
%argdel
$argadd dms_backend/asgi.py
$argadd dms_backend/__init__.py
$argadd dms_backend/settings.py
$argadd dms_backend/urls.py
$argadd dms_backend/wsgi.py
edit data/views.py
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
if bufexists("data/views.py") | buffer data/views.py | else | edit data/views.py | endif
if &buftype ==# 'terminal'
  silent file data/views.py
endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 27 - ((26 * winheight(0) + 29) / 58)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
27
normal! 029|
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOFc
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
