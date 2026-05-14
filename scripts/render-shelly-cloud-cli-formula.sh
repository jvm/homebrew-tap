#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 3 ]]; then
  echo "usage: $0 <version> <tarball-url> <sha256>" >&2
  exit 1
fi

version="$1"
tarball_url="$2"
sha256="$3"

mkdir -p Formula
cat > Formula/shelly-cloud-cli.rb <<EOF
class ShellyCloudCli < Formula
  desc "Agent-native CLI for Shelly Cloud Control API v2"
  homepage "https://github.com/jvm/shelly-cloud-cli"
  url "${tarball_url}"
  sha256 "${sha256}"
  license "MIT"

  depends_on "node@20"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match "${version}", shell_output("#{bin}/shelly-cloud --version")
    assert_match "schema_version", shell_output("#{bin}/shelly-cloud agent-context --json")
  end
end
EOF
