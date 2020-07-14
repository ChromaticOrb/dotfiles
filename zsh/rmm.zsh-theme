PROMPT="%(?:%{$fg[green]%}➜ :%{$fg[red]%}➜ )"
PROMPT+=' %{$fg[cyan]%}%2~%{$reset_color%} $(git_prompt_info)'

RPROMPT='%(?::%{$fg[red]%}-$?-%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
