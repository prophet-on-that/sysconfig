{ pkgs ? import <nixpkgs> {} }:

let
  myEmacs = pkgs.emacs;
  emacsWithPackages = (pkgs.emacsPackagesNgGen myEmacs).emacsWithPackages;
in
  emacsWithPackages (epkgs: (with epkgs.melpaStablePackages; [
    magit
    nix-mode
    haskell-mode
    counsel
    swiper
    ivy
    markdown-mode
    projectile
    counsel-projectile
    paredit
    geiser
    yaml-mode
  ]))
