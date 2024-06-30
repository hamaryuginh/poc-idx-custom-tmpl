# idx-template.nix
# Accept additional arguments to this template corresponding to template
# parameter IDs, including default values (language=ts by default in this example).
{ pkgs, language ? "ts", ... }: {
  packages = [
    pkgs.nodejs
  ];

  bootstrap = ''
    # We use Nix string interpolation to pass the user's chosen programming
    # language to our script.
    npm init --yes my-boot-strap@latest "$out" -- --lang=${language}
    
    # Copy .idx folder to the new workspace
    cp -rf ${./.idx} "$out"
  ''
}