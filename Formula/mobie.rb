class Mobie < Formula
  desc "Standalone CLI for querying the MOBIE API"
  homepage "https://github.com/jvm/mobie-cli"
  url "https://github.com/jvm/mobie-cli/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "e30db82f0182cac88eb1c75d998c745cd89188ab327d62d4b5d1ed9ef0a82122"
  license "ISC"
  head "https://github.com/jvm/mobie-cli.git", branch: "main"

  depends_on "rust"

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "apps/mobie"
  end

  test do
    system "#{bin}/mobie", "--help"
  end
end
