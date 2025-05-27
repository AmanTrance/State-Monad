{ pkgs ? import <nixpkgs> { } } : 
pkgs.mkShell {
  buildInputs = with pkgs; [
    haskell-language-server
  ];
}
