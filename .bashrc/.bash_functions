# ~/.bash_functions: executed by bash(1) for non-login shells.
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Check if gum is available
if ! command -v gum >/dev/null 2>&1; then
    echo "❌ gum is not installed. Please install it first."
    return
fi

# Menu-driven configuration functions
_func() {
    local -a options=(
        "Update ~/.bashrc|1"
        "Set locale (LC_ALL)|2"
        "Configure Timezone (TZ)|3"
        "Configure Git global settings|4"
        "Run benchmark script|5"
        "Get IP information|6"
        "Manage swap file|7"
    )

    local choice=$(
        gum choose \
            --header "Which function would you like to run?" \
            --label-delimiter '|' \
            "${options[@]}"
    )

    case $choice in
        1) _func_update_bashrc ;;
        2) _func_set_locale ;;
        3) _func_set_timezone ;;
        4) _func_gitconf ;;
        5) _func_bench ;;
        6) _func_get_ip ;;
        7) _func_swapfile ;;
    esac
}

# Update ~/.bashrc
_func_update_bashrc() {
    export GH_BASHRC_FORCE_UPDATE=1
    source ~/.bash_autoload
    echo "✅ ~/.bashrc is up to date."
}

# Configure Bash locale
_func_set_locale() {
    local -a options=(
        "en_US.UTF-8|1"
        "zh_TW.UTF-8|2"
    )

    local choice=$(
        gum choose \
            --header "Which locale would you like to set? (LC_ALL)" \
            --label-delimiter '|' \
            "${options[@]}"
    )

    case $choice in
        1) en_US ;;
        2) zh_TW ;;
    esac

    echo "✅ Successfully set Locale to ${LC_ALL}."
}

# Configure Timezone (TZ)
_func_set_timezone() {
    local -a options=(
        "UTC|1"
        "Asia/Taipei|2"
    )

    local choice=$(
        gum choose \
            --header "Select your timezone (TZ):" \
            --label-delimiter '|' \
            "${options[@]}"
    )

    case $choice in
        1) sudo timedatectl set-timezone UTC ;;
        2) sudo timedatectl set-timezone Asia/Taipei ;;
    esac

    echo "✅ Successfully set timezone to ${options[$choice]}."
}

# Configure Git global settings with interactive prompt
_func_gitconf() {
    local -r GITHUB_NAME="lmly9193"
    local -r GITHUB_EMAIL="15520160+lmly9193@users.noreply.github.com"
    local git_name="$(whoami)"
    local git_email="$(whoami)@$(hostname)"

    local -a options=(
        "Use GitHub noreply ($GITHUB_NAME / $GITHUB_EMAIL)|1"
        "Custom configuration|2"
    )

    local choice=$(gum choose \
        --header "Select Git configuration option:" \
        --label-delimiter '|' \
        "${options[@]}"
    )

    case $choice in
        1)
            git_name="$GITHUB_NAME"
            git_email="$GITHUB_EMAIL"
            ;;
        2)
            read -p "Enter your Git name [$git_name]: " input_name
            git_name=${input_name:-$git_name}

            read -p "Enter your Git email [$git_email]: " input_email
            git_email=${input_email:-$git_email}
            ;;
    esac

    # Set Git config
    git config --global user.name "$git_name"
    git config --global user.email "$git_email"

    gum style \
        --foreground 212 --border-foreground 212 --border rounded \
        --align center --width 50 --margin "1 2" --padding "2 4" \
        "✅ Git global configuration updated:" "" "Name: $git_name" "Email: $git_email"
}

# bench
_func_bench() {
    curl -Lso- bench.sh | bash
}

# Get IP info
_func_get_ip() {
    curl -s https://ipinfo.io/json; echo
}

# swapfile management
_func_swapfile() {
    local -a options=(
        "View Swap Status|1"
        "Create Swap File (Specify Size)|2"
        "Enable Swap File|3"
        "Disable Swap File|4"
        "Delete Swap File|5"
    )

    local SWAP_FILE="/swapfile"

    local choice=$(
        gum choose \
            --header "Select swap file operation:" \
            --label-delimiter '|' \
            "${options[@]}"
    )

    case $choice in
        1)
            echo "當前的 Swap 狀態："
            swapon --show
            free -h | grep Swap
            ;;
        2)
            read -p "請輸入 Swap 大小 (例如 1G, 512M): " swapsize
            if [ -z "$swapsize" ]; then
                echo "無效的輸入，創建失敗。"
                return
            fi

            if [ -f "$SWAP_FILE" ]; then
                echo "Swap 文件已存在，無需創建。"
            else
                echo "創建 ${swapsize} 的 Swap 文件..."
                sudo fallocate -l "$swapsize" "$SWAP_FILE"
                sudo chmod 600 "$SWAP_FILE"
                sudo mkswap "$SWAP_FILE"
                # Check if entry already exists in fstab
                if ! grep -q "$SWAP_FILE" /etc/fstab 2>/dev/null; then
                    echo "$SWAP_FILE none swap defaults 0 0" | sudo tee -a /etc/fstab > /dev/null
                fi
                echo "Swap 文件創建完成。"
            fi
            ;;
        3)
            if [ -f "$SWAP_FILE" ]; then
                sudo swapon "$SWAP_FILE"
                echo "Swap 文件已啟用。"
            else
                echo "Swap 文件不存在，請先創建。"
            fi
            ;;
        4)
            if [ -f "$SWAP_FILE" ]; then
                sudo swapoff "$SWAP_FILE"
                echo "Swap 文件已停用。"
            else
                echo "Swap 文件不存在。"
            fi
            ;;
        5)
            if [ -f "$SWAP_FILE" ]; then
                sudo swapoff "$SWAP_FILE"
                sudo rm "$SWAP_FILE"
                # Remove from fstab
                if grep -q "$SWAP_FILE" /etc/fstab 2>/dev/null; then
                    sudo sed -i "\|$SWAP_FILE|d" /etc/fstab
                fi
                echo "Swap 文件已刪除。"
            else
                echo "Swap 文件不存在。"
            fi
            ;;
    esac
}
