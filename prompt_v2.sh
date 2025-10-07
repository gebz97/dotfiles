# Add to your ~/.bashrc file

# Colors for better readability
RED='\[\033[0;31m\]'
GREEN='\[\033[0;32m\]'
YELLOW='\[\033[0;33m\]'
ORANGE='\[\033[0;33m\]'  # Same as yellow in basic 8-color palette
BLUE='\[\033[0;34m\]'
MAGENTA='\[\033[0;35m\]'
CYAN='\[\033[0;36m\]'
WHITE='\[\033[0;37m\]'
RESET='\[\033[0m\]'

# For true orange (if your terminal supports 256 colors)
ORANGE_256='\[\033[38;5;214m\]'

# Function to get git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Function to check if in virtual environment
get_venv_info() {
    if [ -n "$VIRTUAL_ENV" ]; then
        basename "$VIRTUAL_ENV"
    elif [ -n "$CONDA_DEFAULT_ENV" ] && [ "$CONDA_DEFAULT_ENV" != "base" ]; then
        echo "conda:$CONDA_DEFAULT_ENV"
    fi
}

# Build the PS1
set_prompt() {
    # Time (hh:mm) - without seconds
    local time_part="${WHITE}$(date +%H:%M)${RESET}"

    # User (green) and Host (yellow) in different colors
    local user_part="${GREEN}\u${RESET}"
    local host_part="${YELLOW}\h${RESET}"

    # Current directory (base name only)
    local dir_part="${BLUE}\W${RESET}"

    # Git branch - using orange
    local git_part="${ORANGE_256}\$(parse_git_branch)${RESET}"

    # Virtual environment
    local venv_info=$(get_venv_info)
    local venv_part=""
    if [ -n "$venv_info" ]; then
        venv_part="${MAGENTA} [$venv_info]${RESET}"
    fi

    # User symbol ($ or #) and arrow - FIXED ESCAPING
    local user_symbol='\$'
    local arrow_part="${CYAN}→${RESET}"

    # Combine all parts
    PS1="${time_part}${venv_part}${git_part} [${user_part}@${host_part} ${dir_part}] ${CYAN}${user_symbol}${RESET} ${arrow_part} "
}

PROMPT_COMMAND=set_prompt
