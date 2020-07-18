local user_host='%{$fg[green]%}╭── %n@%m%{$reset_color%}'
local user_symbol='%{$fg[green]%}╰─➜ %{$reset_color%}'
local current_dir='%{$fg[cyan]%}%2~%{$reset_color%}'
local git_branch='$(git_prompt_info)'

PROMPT="${user_host} ${current_dir} ${git_branch} 
${user_symbol}"
#PROMPT+=' %{$fg[cyan]%}%2~%{$reset_color%} $(git_prompt_info)'

RPROMPT='%(?::%{$fg[red]%}-$?-%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
