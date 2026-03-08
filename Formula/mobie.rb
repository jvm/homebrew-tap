class Mobie < Formula
  desc "Standalone CLI for querying the MOBIE API"
  homepage "https://github.com/jvm/mobie-cli"
  license "ISC"
  version "0.3.1"

  if Hardware::CPU.arm?
    url "https://github.com/jvm/mobie-cli/releases/download/v0.3.1/mobie-v0.3.1-aarch64-apple-darwin.tar.gz"
    sha256 "c5b1e4e2bedcf266812ce6d2213907252d44989e621b40b6ecc4457d8477c6d8"
  else
    url "https://github.com/jvm/mobie-cli/releases/download/v0.3.1/mobie-v0.3.1-x86_64-apple-darwin.tar.gz"
    sha256 "7f19265168f4cd16a35814404011a408ae33f1f0d9c14e95b7ee71c7e526661d"
  end

  def install
    bin.install "mobie"
  end

  test do
    assert_match "mobie", shell_output("#{bin}/mobie --help")
  end
end
