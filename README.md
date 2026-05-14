# homebrew-tap
Homebrew tap for jvm projects

## Install

```bash
brew tap jvm/tap
brew install mobie
brew install raindrop-cli
# After the first shelly-cloud-cli release:
# brew install shelly-cloud-cli
```

Available formulae:

- `mobie` — standalone CLI for querying the MOBIE API
- `raindrop-cli` — agent-friendly CLI for Raindrop.io; installs the `raindrop` binary
- `shelly-cloud-cli` — agent-native CLI for Shelly Cloud; installs the `shelly-cloud` binary after first release

## Release Automation

`jvm/mobie-cli` dispatches a `mobie_release` repository event after it publishes a tagged GitHub release.

This tap listens for that event and updates `Formula/mobie.rb` with the new release URLs and SHA-256 values, then commits the change back to `main`.

`raindrop-cli` is updated by `.github/workflows/update-raindrop-cli.yml`. The workflow can be run manually with an optional version, and also runs hourly to compare the tap formula with the latest npm release of `@mocito/raindrop-cli`. It downloads the npm tarball, computes the SHA-256, renders `Formula/raindrop-cli.rb`, and commits only when the formula changes.

`shelly-cloud-cli` is updated by the `jvm/shelly-cloud-cli` release workflow. That workflow publishes a GitHub release tarball, computes its SHA-256, checks out this tap, runs `scripts/render-shelly-cloud-cli-formula.sh`, and opens a pull request using a token scoped to this tap.
