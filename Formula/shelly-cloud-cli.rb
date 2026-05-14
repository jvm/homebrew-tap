class ShellyCloudCli < Formula
  desc "Agent-native CLI for Shelly Cloud Control API v2"
  homepage "https://github.com/jvm/shelly-cloud-cli"
  url "https://github.com/jvm/shelly-cloud-cli/releases/download/v0.1.5/shelly-cloud-cli-0.1.5.tgz"
  sha256 "0c445e52583dedecdedbf7c421731d537a985e33a5a7cb747b29e33cc0464a86"
  license "MIT"

  depends_on "node@20"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match "0.1.5", shell_output("#{bin}/shelly-cloud --version")
    assert_match "schema_version", shell_output("#{bin}/shelly-cloud agent-context --json")
  end
end
