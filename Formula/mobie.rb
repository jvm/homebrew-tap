class Mobie < Formula
  desc "Standalone CLI for querying the MOBIE API"
  homepage "https://github.com/jvm/mobie-cli"
  url "https://github.com/jvm/mobie-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "PLACEHOLDER_SOURCE_SHA"
  license "ISC"
  head "https://github.com/jvm/mobie-cli.git", branch: "main"

  depends_on "rust"

  on_macos do
    on_arm do
      url "https://github.com/jvm/mobie-cli/releases/download/v0.1.0/mobie-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "fdc8bbd5fc53fcdf38928e7323a510b9fbb6519f8dadd475622c627d73a424fe"
    end
    on_intel do
      url "https://github.com/jvm/mobie-cli/releases/download/v0.1.0/mobie-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "f9ec7084964d40f048f44ae47667e00bfa4f8a3a73fec802b5ecd2fa39ed8e6a"
    end
  end

  def install
    bin.install "mobie"
  end

  test do
    system "#{bin}/mobie", "--help"
  end
end
