class Mobie < Formula
  desc "Standalone CLI for querying the MOBIE API"
  homepage "https://github.com/jvm/mobie-cli"
  url "https://github.com/jvm/mobie-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "43e1d8227ee479b9b068b0d05e175478b577380e3025878dcaa3664c84d619df"
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
