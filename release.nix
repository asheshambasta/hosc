let 
  overlays = [(import ./overlay.nix)];
  defPkgs = import <nixpkgs> { inherit overlays; }; # add the modified package to haskellPackages
in 
{ inherit (defPkgs.haskellPackages) hosc; }
