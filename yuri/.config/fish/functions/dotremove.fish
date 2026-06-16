function dotremove --description "Remove a file or directory from the midnight bloom repo and restore it to HOME"
    if test (count $argv) -eq 0
        echo "Error: Please specify a file or folder to remove."
        echo "Usage: dotremove ~/.config/app/config.conf"
        return 1
    end

    set -l input_path (realpath --no-symlinks $argv[1])
    set -l repo_dir "$HOME/.dotfiles/yuri"
    
    set -l target_in_home ""
    set -l target_in_repo ""

    # Case 1: Input is a symlink in HOME (or pointing to the repo)
    if test -L $argv[1]
        set -l link_target (realpath $argv[1])
        # Verify it actually points inside our dotfiles repo
        if string match -q "$repo_dir*" $link_target
            set target_in_home $argv[1]
            set target_in_repo $link_target
        else
            echo "Error: Symlink does not point to your dotfiles repository ($repo_dir)"
            return 1
        end

    # Case 2: Input is the actual file/folder inside the repo
    else if string match -q "$repo_dir*" $input_path
        set target_in_repo $input_path
        # Reconstruct the original HOME path by replacing the repo prefix with $HOME
        set -l relative_path (string replace "$repo_dir/" "" $input_path)
        set target_in_home "$HOME/$relative_path"

    # Error handling for invalid inputs
    else
        echo "Error: Target must be a symlink pointing to the repo, or a file inside $repo_dir"
        return 1
    end

    # Execution & Safety Checks
    if test -e $target_in_repo
        # 1. Remove the existing symlink in HOME if it exists
        if test -L $target_in_home
            rm $target_in_home
        else if test -e $target_in_home
            echo "Error: A real file already exists at $target_in_home. Aborting to prevent overwrite."
            return 1
        end

        # 2. Recreate parent directories in HOME just in case they were deleted
        mkdir -p (dirname $target_in_home)

        # 3. Move the file/folder back to HOME
        mv $target_in_repo $target_in_home

        # 4. Clean up empty parent directories left behind in the repo
        # 'dirname' gets the immediate parent, 'find' cleans up empty nested folders safely
        set -l repo_parent_dir (dirname $target_in_repo)
        if not test "$repo_parent_dir" = "$repo_dir"
            find $repo_parent_dir -type d -empty -delete 2>/devymlink
        end

        echo "Removed and restored: $target_in_home"
    else
        echo "Error: Could not find the source file in the repository."
        return 1
    end
end
