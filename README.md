## resize.vim
Resize a vertical or horizontal split screen

### Installation
If you don't already use a plugin manager, I recommend [vim-plug](https://github.com/junegunn/vim-plug)

- vim-plug
```
Plug 'ahonn/resize.vim'
```

- Vundle
```
Plugin 'ahonn/resize.vim'
```

- Pathogen
```
cd ~/.vim/bundle
git clone git://github.com/ahonn/resize.vim.git
```

### Configuration
**g:resize_size**

Set the resize step size, default value is 1.

**g:resize_disable_mappings**

Disable default key bindings, default value is 0.

By defalut, the key bindings:
- <S-Up> :ResizeUp
- <S-Down> :ResizeDown
- <S-Left> :ResizeLeft
- <S-Right> :ResizeRight

### License
Copyright (c) Richard Jiang. Distributed under the same terms as Vim itself. See :help license.
