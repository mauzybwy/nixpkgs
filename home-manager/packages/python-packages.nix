{pkgs}: let
  python = pkgs.python3.override {
    self = python;
    packageOverrides = pyfinal: pyprev: {
      visidata = pyfinal.callPackage ./pypi/visidata.nix {
        pypkg = pyprev;
      };
      toolz = pyfinal.callPackage ./pypi/toolz.nix {};
    };
  };
in (python.withPackages (pypkgs:
    with pypkgs; [
      pandas
      requests
      ipython # interactive shell
      numpy
      pip
      toolz
      visidata
    ]))
