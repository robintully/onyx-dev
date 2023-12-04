!include 100-bling.just
# Include some of your custom scripts here!

# Install all flatpaks defined in recipe.yml
setup-flatpaks:
    #!/usr/bin/env bash
    echo 'Installing flatpaks from the ublue recipe ...'
    flatpaks=$(yq -- '.firstboot.flatpaks[]' "/usr/share/ublue-os/recipe.yml")
    for pkg in $flatpaks; do \
        echo "Installing: ${pkg}" && \
        flatpak install --user --noninteractive flathub $pkg; \
    done

# launch firefox with tabs to start day
start-day:
    flatpak run org.mozilla.firefox -url \
          https://app.sunsama.com/ \
          https://todoist.com/app/today \
          https://app.shortwave.com/ \
          https://account.proton.me/mail \
          https://app.ynab.com/

# launch chrome with tabs to start work day
start-work:
    flatpak run com.google.Chrome \
          https://mail.google.com/mail/u/0/#inbox \
          https://calendar.google.com/calendar/u/0/r?pli=1 \
          https://app.asana.com/0/1201615314190742/list

# install devbox
devbox-me-up:
    echo 'Installing devbox!'
    curl -fsSL https://get.jetpack.io/devbox | bash
    echo 'You MUST reboot to continue'

# remove devbox
devbox-me-down:
    rm -rf /usr/local/bin/devbox

# Switch to the zsh shell
zsh:
    sudo lchsh $USER /usr/bin/zsh 

# Switch to the fish shell
fish:
    sudo lchsh $USER /usr/bin/fish 
