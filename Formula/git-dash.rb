class GitDash < Formula
  desc "Fast TUI dashboard for discovering and managing multiple Git repositories"
  homepage "https://github.com/jvm/git-dash"
  license "MIT"
  version "0.1.0"

  if Hardware::CPU.arm?
    url "https://github.com/jvm/git-dash/releases/download/v0.1.0/git-dash-v0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "TO_BE_REPLACED_ON_RELEASE"
  else
    url "https://github.com/jvm/git-dash/releases/download/v0.1.0/git-dash-v0.1.0-x86_64-apple-darwin.tar.gz"
    sha256 "TO_BE_REPLACED_ON_RELEASE"
  end

  def install
    bin.install "git-dash"
  end

  test do
    assert_match "git-dash", shell_output("#{bin}/git-dash --help")
  end
end
