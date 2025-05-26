{
  description = "C/C++ development flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = inputs: let
    supportedSystems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    forEachSupportedSystem = f:
      inputs.nixpkgs.lib.genAttrs supportedSystems (system:
        f {
          pkgs = import inputs.nixpkgs {
            inherit system;
          };
        });
  in {
    devShells = forEachSupportedSystem ({pkgs}: {
      default =
        pkgs.mkShell.override {
          stdenv = pkgs.gccStdenv;
        } {
          packages = with pkgs;
            [
              clang-tools
              cmake
              conan
              cppcheck
              doxygen
              gtest
              vcpkg
              vcpkg-tool
            ]
            ++ (
              if system == "aarch64-darwin"
              then []
              else [gdb]
            );
        };
    });
  };
}
