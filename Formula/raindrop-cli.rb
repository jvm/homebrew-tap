class RaindropCli < Formula
  desc "Agent-friendly CLI for Raindrop.io"
  homepage "https://github.com/jvm/raindrop-cli"
  url "https://registry.npmjs.org/@mocito/raindrop-cli/-/raindrop-cli-0.2.4.tgz"
  sha256 "cf24a767c6d62f33c44f639573d72c3bf5e978b146d047c0a2f7dd70eab391d4"
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
