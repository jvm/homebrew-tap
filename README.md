# homebrew-tap
Homebrew tap for jvm projects

## Install

```bash
brew tap jvm/tap
brew install mobie
brew install raindrop-cli
```

Available formulae:

- `mobie` — standalone CLI for querying the MOBIE API
- `raindrop-cli` — agent-friendly CLI for Raindrop.io; installs the `raindrop` binary

## Release Automation

`jvm/mobie-cli` dispatches a `mobie_release` repository event after it publishes a tagged GitHub release.

This tap listens for that event and updates `Formula/mobie.rb` with the new release URLs and SHA-256 values, then commits the change back to `main`.

`raindrop-cli` is updated by `.github/workflows/update-raindrop-cli.yml`. The workflow can be run manually with an optional version, and also runs hourly to compare the tap formula with the latest npm release of `@mocito/raindrop-cli`. It downloads the npm tarball, computes the SHA-256, renders `Formula/raindrop-cli.rb`, and commits only when the formula changes.
