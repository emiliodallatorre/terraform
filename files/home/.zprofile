export PATH="$PATH:/home/emiliodallatorre/.local/share/JetBrains/Toolbox/scripts"

alias open="xdg-open"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias load_idf='. $HOME/esp/esp-idf/export.sh'

export PATH="$PATH:/home/emiliodallatorre/Documents/SDKs/flutter/bin"
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/platform-tools/"

export PATH="$PATH:/usr/local/go/bin"
# export PATH="$PATH:$HOME/go/bin"

source $HOME/.local/bin/env
