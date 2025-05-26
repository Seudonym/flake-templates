{
  description = "A Collection of Nix Flake Templates";

  outputs = {self, ...}: {
    templates = {
      rust = {
        path = ./rust;
        description = "A simple Rust application template";
      };

      c-cpp = {
        path = ./c-cpp;
        description = "A simple C/C++ application template";
      };

      defaultTemplate = self.templates.rust;
    };
  };
}
