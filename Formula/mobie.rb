class Mobie < Formula
  desc "Standalone CLI for querying the MOBIE API"
  homepage "https://github.com/jvm/mobie-cli"
  url "https://github.com/jvm/mobie-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "ISC"
  head "https://github.com/jvm/mobie-cli.git", branch: "main"

  depends_on "rust"

  def install
    system "cargo", "install", "--release", "--locked", "--path", prefix
  end

  test do
    system "#{bin}/mobie", "--help"
  end
end
