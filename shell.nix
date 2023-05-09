let
  current-pkgs = import <nixpkgs> {};

  pkgs = import (builtins.fetchGit {
    # Descriptive name to make the store path easier to identify
    name = "has-lilypond-2.22.2";
    url  = "https://github.com/NixOS/nixpkgs/";
    ref  = "refs/heads/nixpkgs-unstable";
    rev  = "3c3b3ab88a34ff8026fc69cb78febb9ec9aedb16";
  }) {};

in
  pkgs.mkShell {
    buildInputs = with pkgs; [
      lilypond
    ] ++ (with current-pkgs; [
      glibcLocales
    ]);
    shellHook = ''
      export LANG=en_US.UTF-8
      export LC_CTYPE="en_US.UTF-8"
      export LC_NUMERIC=en_US.UTF-8
      export LC_TIME=en_US.UTF-8
      export LC_COLLATE="en_US.UTF-8"
      export LC_MONETARY=en_US.UTF-8
      export LC_MESSAGES="en_US.UTF-8"
      export LC_PAPER=en_US.UTF-8
      export LC_NAME=en_US.UTF-8
      export LC_ADDRESS=en_US.UTF-8
      export LC_TELEPHONE=en_US.UTF-8
      export LC_MEASUREMENT=en_US.UTF-8
      export LC_IDENTIFICATION=en_US.UTF-8
      export LC_ALL=
      echo "Welcome to nix lilypond"
      lilypond --version
      echo
      '';
 }
