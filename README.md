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
