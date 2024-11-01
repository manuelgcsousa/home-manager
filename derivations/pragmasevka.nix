{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "Pragmasevka-NF";
  version = "1.6.6";

  src = pkgs.fetchurl {
    url = "https://github.com/shytikov/pragmasevka/releases/download/v1.6.6/Pragmasevka_NF.zip";
    sha256 = "12m8zyqclwzgr4ydzk7bcjk20zkv3mlfjbcmm3w31ys66l24l8al";
  };

  buildInputs = [ pkgs.unzip ];

  sourceRoot = ".";

  installPhase = ''
    mkdir -p $out/share/fonts/Pragmasevka-NF
    unzip $src -d $out/share/fonts/Pragmasevka-NF
  '';
}
