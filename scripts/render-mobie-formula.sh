#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 5 ]]; then
  echo "usage: $0 <version> <arm-url> <arm-sha> <intel-url> <intel-sha>" >&2
  exit 1
fi

version="$1"
arm_url="$2"
arm_sha="$3"
intel_url="$4"
intel_sha="$5"

cat > Formula/mobie.rb <<EOF
class Mobie < Formula
  desc "Standalone CLI for querying the MOBIE API"
  homepage "https://github.com/jvm/mobie-cli"
  license "ISC"
  version "${version}"

  if Hardware::CPU.arm?
    url "${arm_url}"
    sha256 "${arm_sha}"
  else
    url "${intel_url}"
    sha256 "${intel_sha}"
  end

  def install
    bin.install "mobie"
  end

  test do
    assert_match "mobie", shell_output("#{bin}/mobie --help")
  end
end
EOF
