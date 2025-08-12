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

      python = {
        path = ./python;
        description = "A simple Python (uv) application template";
      };

      ros2 = {
        path = ./ros2;
        description = "A simple ROS2 development template";
      };
      defaultTemplate = self.templates.rust;
    };
  };
}
