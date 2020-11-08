"------------------------------------------------------------------------------
" Plugin Name: vandomkeyhint.vim
" Description: Vim plugin to install and show user-defined hints.
"      Author: t16ing <t16ing@users.noreply.github.com>
"     License: MIT
"------------------------------------------------------------------------------

" Module: Begin of plugin. {{{1
"------------------------------------------------------------------------------

" load script once
"------------------------------------------------------------------------------
if exists('s:plugin_loaded')
    finish
endif
let s:plugin_loaded=1

"}}}

" Options: {{{1
"------------------------------------------------------------------------------

" g:vkh_mapkeys is default 1
" 'let g:vkh_mapkeys=0' to disable key mapping
if !exists('g:vkh_mapkeys')
    let g:vkh_mapkeys=1
endif

"}}}

" Global Variables: {{{1
"------------------------------------------------------------------------------
" Contain all globals in s:vkh

let s:vkh={'hints': [], 'index': 0, 'ticks': 0, 'ShowTicks': 10, 'HintPrefix': ''}

"}}}

" Function: Singleton 'Vkh' for plugin operations {{{1
"------------------------------------------------------------------------------
" Vkh, the plugin instance

function s:VkhAdd(hint)
    call add(s:vkh.hints, a:hint)
endfunction

function s:VkhShowHint()
    let l:vkh=s:vkh

    if len(l:vkh.hints) == 0
        echo '***** No any hints installed *****'
        return
    endif

    let l:prefix=l:vkh.HintPrefix
    let l:hints=l:vkh.hints

    if l:vkh.index >= len(l:vkh.hints)
        let l:vkh.index=0
    endif

    echo '***** '.l:prefix.l:hints[l:vkh.index].' *****'

    let l:vkh.index=l:vkh.index+1
endfunction

function s:VkhOnIdle()
    let l:vkh=s:vkh

    if l:vkh.ticks < l:vkh.ShowTicks
        let l:vkh.ticks=l:vkh.ticks+1
    else
        let l:vkh.ticks=0
        call s:VkhShowHint()
    endif
endfunction

"}}}

" Commands: {{{1
"------------------------------------------------------------------------------

function! vandomkeyhint#vhkadd(hint)
    call s:VkhAdd(a:hint)
endfunction

command! -nargs=1 VkhAdd call vandomkeyhint#vhkadd(<f-args>)

"}}}

" Keymaps: {{{1
"------------------------------------------------------------------------------

if g:vkh_mapkeys == 1
    map <silent> <leader><f1> <ESC>:call <sid>VkhShowHint()<CR><CR>
    VkhAdd '<leader><f1> show random hotkey hints.'
endif

" }}}

" Module: End of plugin.{{{1
"--------------------------------------------------------------------------

autocmd! CursorHold * call <sid>VkhOnIdle()

function! vandomkeyhint#rc()
    " to load this script, this is MUST to be done.
endfunction

"}}}

" vim:fdm=marker:ff=unix:
