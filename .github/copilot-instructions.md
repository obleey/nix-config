This repository is a Nix-based personal configuration flake. The notes below are tuned to help an AI coding agent be immediately productive when editing, extending, or debugging the configs.

Purpose
- Short: edit and extend user/system configuration built as a Nix flake.
- Scope: host-specific `home.nix` files, reusable `common/*` package and module fragments, and system-level variants under `systems/`.

Big picture
- Root flake: [flake.nix](flake.nix) is the entrypoint. Use `nix flake show` to discover outputs and attribute names before building.
- Shared components: `common/` contains reusable packages and module fragments (each component usually exposes `default.nix`). Example: [common/packages.nix](common/packages.nix) aggregates packages.
- Hosts: `hosts/<name>/default.nix` and `hosts/<name>/home.nix` contain per-host wiring. Example: [hosts/personal/home.nix](hosts/personal/home.nix).
- Systems: `systems/<arch>/` contains architecture-specific defaults and overrides (see [systems/aarch64-darwin/homebrew.nix](systems/aarch64-darwin/homebrew.nix)).

Developer workflows (quick)
- Inspect flake outputs: `nix flake show`.
- Build an output: `nix build .#<output>` (run `nix flake show` first to get the exact output name).
- Enter a dev shell (if provided): `nix develop .#<devShell>`.
- Validate flake (if configured): `nix flake check`.

Repository conventions
- Most components expose `default.nix` and are composed by the root `flake.nix`.
- Prefer adding functionality under `common/<component>/default.nix` so it becomes reusable across hosts.
- Host-level customization belongs in `hosts/<host>/home.nix` and small wiring in `hosts/<host>/default.nix`.
- Naming: directories are named for the tool (e.g., `neovim`, `vscode`, `fzf`) and contain `default.nix` that exposes attributes used by `flake.nix`.

Patterns and examples
- To add a package used across hosts: update [common/packages.nix](common/packages.nix) to include the new package attribute, then reference it from host `home.nix`.
- To customize Neovim: edit [common/neovim/default.nix](common/neovim/default.nix) rather than copying config into every host.
- To change VSCode settings: edit [common/vscode/settings.nix](common/vscode/settings.nix) which is included by host configs.

Integration points & external dependencies
- This repo is a Nix flake and relies on nixpkgs and any flake inputs defined in [flake.nix](flake.nix).
- macOS-specific integration is under `systems/aarch64-darwin/` (nix-darwin, Homebrew wiring).
- Home-manager or other Nix modules are expected — check `hosts/*/home.nix` for which module sets are enabled.

Editing guidance for an AI
- Read `flake.nix` first to identify the exact attribute names and outputs; prefer editing shared `common/*` modules rather than duplicating logic.
- When adding or renaming attributes, update both the `common` component and any `hosts/*/home.nix` that import it.
- Use `nix flake show` and `nix build` during iteration to confirm outputs; include the exact `flake` output attribute in proposed changes.
- Keep changes minimal and consistent with the `default.nix` pattern used across `common/` subfolders.

Where to look for examples
- Root manifest: [flake.nix](flake.nix)
- Package aggregator: [common/packages.nix](common/packages.nix)
- Host example: [hosts/personal/home.nix](hosts/personal/home.nix)
- macOS specifics: [systems/aarch64-darwin/default.nix](systems/aarch64-darwin/default.nix)

If anything here is unclear or you want the instructions expanded (examples for PR descriptions, or automated check commands), tell me which section to elaborate.
