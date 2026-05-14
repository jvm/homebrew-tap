class ShellyCloudCli < Formula
  desc "Agent-native CLI for Shelly Cloud Control API v2"
  homepage "https://github.com/jvm/shelly-cloud-cli"
  url "https://github.com/jvm/shelly-cloud-cli/releases/download/v0.1.7/shelly-cloud-cli-0.1.7.tgz"
  sha256 "7aeaf53d8ad5b46bf8e6536675d83881e970cb5bf08e07b6394d2137d07b2533"
  license "MIT"

  depends_on "node@20"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match "0.1.7", shell_output("#{bin}/shelly-cloud --version")
    assert_match "schema_version", shell_output("#{bin}/shelly-cloud agent-context --json")
  end
end
