"
" 很奇怪，现在保存，会触发两次 formmat , deno_fmt and coc-eslint
"

" Enable alignment globally
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion globally
"let g:neoformat_basic_format_retab = 1

let g:neoformat_basic_format_trim = 1

"let g:neoformat_typescript_denofmt = {
      "\ 'exe':'deno fmt',
      "\ 'args': ['--parser', 'typescript','--no-semi','--single-quote'],
"\}
" https://github.com/denoland/deno/issues/13616
" 2022.5.18: deno fmt not suppport remove semicolons (ASI)
"let g:neoformat_enabled_javascript = ['deno fmt']
"let g:neoformat_enabled_typescript = ['deno fmt']
let g:neoformat_enabled_typescript = ['eslint_d']
let g:neoformat_enabled_typescript = ['eslint_d']
"let g:neoformat_enabled_json = ['deno fmt']
let g:neoformat_enabled_yaml = ['prettier']

let g:neoformat_enabled_rust = ['rustfmt']
let g:neoformat_enabled_nix = ['nixpkgs-fmt']
let g:neoformat_enabled_lua = ['stylua']
"let g:neoformat_verbose = 1 "
