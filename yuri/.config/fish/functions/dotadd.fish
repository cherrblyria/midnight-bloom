function dotadd --description "Add a file or directory from HOME into the midnight bloom repo"
    if test (count $argv) -eq 0
        echo "Error: Please specify a file or folder to add."
        echo "Usage: dotadd ~/.config/app/config.conf"
        return 1
    end

    # Get absolute, clean path of the target
    set -l target (realpath $argv[1])
    
    # Ensure the target is actually inside your home directory
    if not string match -q "$HOME*" $target
        echo "Error: The target file must be inside your home directory ($HOME)"
        return 1
    end

    # Strip the $HOME prefix to get the relative path (e.g., .config/app/config.conf)
    set -l relative_path (string replace "$HOME/" "" $target)
    
    # Define repository paths
    set -l repo_dir "$HOME/.dotfiles/yuri"
    set -l repo_target_path "$repo_dir/$relative_path"
    set -l repo_target_parent (dirname $repo_target_path)

    # 1. Recreate the parent directory structure inside the repo
    mkdir -p $repo_target_parent

    # 2. Move the file/folder into the repo
    mv $target $repo_target_path

    # 3. Run stow to link it back instantly
    stow --adopt --no-folding -d $repo_dir -t $HOME yuri

    echo "Added and linked: $relative_path -> midnight bloom dotfiles!"
end

