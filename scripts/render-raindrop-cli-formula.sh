#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 3 ]]; then
  echo "usage: $0 <version> <tarball-url> <sha256>" >&2
  exit 1
fi

version="$1"
tarball_url="$2"
sha256="$3"

cat > Formula/raindrop-cli.rb <<EOF
class RaindropCli < Formula
  desc "Agent-friendly CLI for Raindrop.io"
  homepage "https://github.com/jvm/raindrop-cli"
  url "${tarball_url}"
  sha256 "${sha256}"
  license "MIT"

  depends_on "node@20"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/raindrop --version")
  end
end
EOF
