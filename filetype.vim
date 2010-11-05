"Todo list file
au BufRead,BufNewFile todo.txt,*.todo.txt,recur.txt,*.todo set filetype=todo

" ActionScript
au BufNewFile,BufRead *.mxml set filetype=mxml
au BufNewFile,BufRead *.as   set filetype=actionscript

au BufRead,BufNewFile *.json set filetype=json 

au BufRead,BufNewFile *.hx set filetype=haxe 

" named file
au BufRead,BufNewFile /etc/bind/named.conf* set filetype=named


" nginx config file
au BufRead,BufNewFile /etc/nginx/conf.d/*,
            \/etc/nginx/*.conf,
            \/etc/nginx/sites-*/* set filetype=nginx 

au BufNewFile,BufRead *.log set filetype=log

" Virata Config Script File or Drupal module
au BufRead,BufNewFile *.hw,*.module,*.pkg,*.install,*.test
	\ if getline(1) =~ '<?php' |
	\   setf php |
	\ else |
	\   setf virata |
	\ endif

au BufRead,BufNewFile *.info set filetype=dosini
