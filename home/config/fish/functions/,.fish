#!/usr/bin/env fish

# From https://github.com/i077/system

set _dir (dirname (status filename))
source $_dir/_lib.fish

function help
    echo "comma: Run software from nixpkgs without installing it.

"$bold"Usage:"$resf" , [flags] program [args]

"$bold"Flags:"$resf"
    -n, --dry-run     Print what would be run
    -c, --check       Just quietly check if a package is available"
end

function _run
    # Use nix-locate to find the right package
    log_step "Looking for packages with \$out/bin/$argv[1]..."
    set attr (nix-locate --top-level --minimal --at-root --whole-name "/bin/$argv[1]")
    if test (count $attr) -eq 0
        log_error "No match."
        exit 1
    else if test (count $attr) -gt 1
        log_minor "Found multiple packages. Select one."
        set attr (string split0 $attr | fzf --reverse --height 10)
    end
    if test -z $attr
        log_error "No package selected."
        exit 1
    end
    log_ok "Running with nixpkgs#$attr..."

    if test -z $dry_run
        nix shell "nixpkgs#$attr" -c $argv
    else
        echo nix shell "nixpkgs#$attr" -c $argv
    end
end

function _check
    set attr (nix-locate --top-level --minimal --at-root --whole-name "/bin/$argv[1]")
    if test (count $attr) -eq 0
        exit 1
    else
        exit 0
    end
end

# Entry point
argparse -s n/dry-run c/check -- $argv
set -g dry_run $_flag_dry_run

switch $argv[1]
    case ''
        help
    case '*'
        if test -z $_flag_check
            _run $argv
        else
            _check $argv
        end
end
