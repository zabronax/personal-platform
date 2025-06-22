{
  description = "A mini saas example system";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      withSystem = nixpkgs.lib.genAttrs [
        "x86_64-linux" # TODO! NOT Verified
        "x86_64-darwin" # TODO! NOT Verified
        "aarch64-linux" # TODO! NOT Verified
        "aarch64-darwin" # Verified
      ];
      withPkgs = callback: withSystem (system: callback (import nixpkgs { inherit system; }));
    in
    {
      devShells = withPkgs (pkgs: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            # User Interface Toolchain
            nodejs_22 # JS and NodeJS
            pnpm # Package manager

            # System Programming Toolchain
            cargo # Rust
            rust-analyzer # Rust

            # Interface/Contract Toolchain
            redocly # OpenAPI CLI and SPA generator

            # Platform Toolchain
            opentofu # IaC language
            docker # Container

            # Cloud Provider Toolchain
            hcloud # Hetzner Cloud CLI

            # Project Management
            just # Task runner
            sops # Secrets managements
            age # Encryption tool
          ];
        };
      });

      formatter = withPkgs (pkgs: pkgs.nixfmt-rfc-style);
    };
}
