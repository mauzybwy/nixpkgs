{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
  pypkg,
}:
buildPythonPackage rec {
  pname = "visidata";
  version = "3.1.1";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-jESEFY8IUeSIfllVQr1lvdmR3pwgZStEKz/ZdCzosDE=";
  };

  # do not run tests
  doCheck = false;

  # specific to buildPythonPackage, see its reference
  pyproject = true;
  build-system = [
    setuptools
    wheel
  ];

  dependencies = with pypkg; [
    python-dateutil
    importlib-metadata
  ];
}
