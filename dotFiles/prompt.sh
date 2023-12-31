function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  }

  # This function builds your prompt. It is called below
  function prompt {
    # Define the prompt character
    local   CHAR="♥"

    # Define some local colors
    local   RED="\[\e[0;31m\]"
    local   BLUE="\[\e[0;34m\]"
    local   GREEN="\[\e[0;32m\]"
    local   GRAY_TEXT_BLUE_BACKGROUND="\[\e[37;44;1m\]"

    # Define a variable to reset the text color
    local   RESET="\[\e[0m\]"

    # ♥ ☆ - Keeping some cool ASCII Characters for reference
    # Here is where we actually export the PS1 Variable which stores the text for your prompt export 
PS1="\[\e]2;\u@\h\a[$GRAY_TEXT_BLUE_BACKGROUND\t$RESET]$RED\$(parse_git_branch) 
$GREEN\W\n$BLUE//$RED $CHAR $RESET"
      PS2='> '
      PS4='+ '
    }

  # Finally call the function and our prompt is all pretty
  prompt
