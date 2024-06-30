# idx-template.nix
# Accept additional arguments to this template corresponding to template
# parameter IDs, including default values (language=ts by default in this example).
{ pkgs, language ? "ts", ... }: {
  packages = [
    pkgs.symfony-cli
  ];

  bootstrap = ''
    # Copy .idx folder to the new workspace
    cp -rf ${./.} "$out"

    # Set some permissions
    chmod -R +w "$out"

    # Remove the template files themselves and any connection to the template's
    # Git repository
    rm -rf "$out/.git" "$out/idx-template".{nix,json}

    # Run symfony command to create a new project
    symfony new --version=${version} \
      ${if type == "api" then "--api"} \
      ${if type == "webapp" then "--webapp"} \
      ${if docker then "--docker"} \
      --dir="$out"
  ''
}