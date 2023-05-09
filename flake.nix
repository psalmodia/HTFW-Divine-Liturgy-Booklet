{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
          pkgs-fixed = import (builtins.fetchGit {
            # Descriptive name to make the store path easier to identify                
            name = "has-lilypond-2.22.2";                                                 
            url = "https://github.com/NixOS/nixpkgs/";                       
            ref = "refs/heads/nixpkgs-unstable";                     
            rev = "3c3b3ab88a34ff8026fc69cb78febb9ec9aedb16";                                           
          }) { inherit system; };
      in {
        devShell = pkgs.mkShell { buildInputs = [
          # The following should have lilypond v 2.22.2 (def < 2.24.x
          # which was giving us problems making pngs of the correct
          # size).
          pkgs-fixed.lilypond  #-with-fonts
        ]; };
      });
}
