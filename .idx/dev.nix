# .idx/dev.nix
{pkgs, ... }: {
  channel = "stable-23.11"; # or "unstable"
  packages = [
    pkgs.php82
    pkgs.php82Packages.composer
    pkgs.symfony-cli
    pkgs.nodejs_20
  ];
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "bmewburn.vscode-intelephense-client"
      "esbenp.prettier-vscode"
      "mblode.twig-language-2"
      "MehediDracula.php-namespace-resolver"
    ];
    # Enable previews
    previews = {
      enable = true;
      previews = {
        web = {
          command = ["symfony" "local:server:start" "--port" "$PORT"];
          manager = "web";
        };
      };
    };
    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created with this `dev.nix` file
      onCreate = {
        # Open editors for the following files by default, if they exist.
        # The last file in the list will be focused.
        default.openFiles = [
          "README.md"
          "composer.json"
        ]
        # Include other scripts here, as needed, for example:
        # installDependencies = "npm install";
      };
      # To run something each time the workspace is (re)started, use the `onStart` hook
    };
  };
  services = {
    docker = {
      enable = true;
    };
  };
}