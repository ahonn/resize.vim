" resize.vim - Resize the window screen
" Author:      Richard Jiang <ahonn95@outlook.com>
" Version:     1.0

if !exists("g:resize_size")
  let g:resize_size = 1
endif

let s:pos_size = "+".g:resize_size
let s:neg_size = "-".g:resize_size

let s:switch_window_cmd = {
  \ "right": "\<C-w>l",
  \ "left": "\<C-w>h",
  \ "top": "\<C-w>k",
  \ "bottom": "\<C-w>j",
  \ }

function! s:get_direction(position)
  let this = winnr()
  let cmd = s:switch_window_cmd[a:position]
  silent! execute "normal! ".cmd
  let next = winnr()
  silent! execute this."wincmd w"
  return this == next
endfunction

function! s:is_bottom_window()
  let is_top = s:get_direction("top")
  let is_bottom = s:get_direction("bottom")

  return is_bottom && !is_top
endfunction

function! s:is_right_window()
  let is_left = s:get_direction("left")
  let is_right = s:get_direction("right")

  return is_right && !is_left
endfunction

function! s:resize_vertical(size)
  silent! execute "vertical resize ".a:size
endfunction

function! s:resize_horizontal(size)
  silent! execute "resize ".a:size
endfunction

function! resize#resize_up()
  if (s:is_bottom_window())
    return s:resize_horizontal(s:pos_size)
  endif
  return s:resize_horizontal(s:neg_size)
endfunction

function! resize#resize_down()
  if (s:is_bottom_window())
    return s:resize_horizontal(s:neg_size)
  endif
  return s:resize_horizontal(s:pos_size)
endfunction

function! resize#resize_left()
  if (s:is_right_window())
    return s:resize_vertical(s:pos_size)
  endif
  return s:resize_vertical(s:neg_size)
endfunction

function! resize#resize_right()
  if (s:is_right_window())
    return s:resize_vertical(s:neg_size)
  endif
  return s:resize_vertical(s:pos_size)
endfunction

command! ResizeUp call resize#resize_up()
command! ResizeDown call resize#resize_down()
command! ResizeLeft call resize#resize_left()
command! ResizeRight call resize#resize_right()

if get(g:, 'resize_disable_mappings') == 0
  nnoremap <silent> <S-Up> :ResizeUp<Cr>
  nnoremap <silent> <S-Down> :ResizeDown<Cr>
  nnoremap <silent> <S-Left> :ResizeLeft<Cr>
  nnoremap <silent> <S-Right> :ResizeRight<Cr>
endif
