class ShellyCloudCli < Formula
  desc "Agent-native CLI for Shelly Cloud Control API v2"
  homepage "https://github.com/jvm/shelly-cloud-cli"
  url "https://github.com/jvm/shelly-cloud-cli/releases/download/v0.1.8/shelly-cloud-cli-0.1.8.tgz"
  sha256 "664fde8b72d0aadf36124e8b5e3bc8c91f0763a26888001efd732e7cdf624633"
  license "MIT"

  depends_on "node@20"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match "0.1.8", shell_output("#{bin}/shelly-cloud --version")
    assert_match "schema_version", shell_output("#{bin}/shelly-cloud agent-context --json")
  end
end
