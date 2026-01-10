class GitDash < Formula
  desc "Fast TUI dashboard for discovering and managing multiple Git repositories"
  homepage "https://github.com/jvm/git-dash"
  license "MIT"
  version "0.2.0"

  if Hardware::CPU.arm?
    url "https://github.com/jvm/git-dash/releases/download/v0.2.0/git-dash-v0.2.0-aarch64-apple-darwin.tar.gz"
    sha256 "3e6777efe39ada1a2c4dcf247aaf177f582537fb1c4f6d7ba47df64e4263e595"
  else
    url "https://github.com/jvm/git-dash/releases/download/v0.2.0/git-dash-v0.2.0-x86_64-apple-darwin.tar.gz"
    sha256 "a2136b5fb2c249e27244513cb1003d40931b28d1e70639b356b852f8b73b4146"
  end

  def install
    bin.install "git-dash"
  end

  test do
    assert_match "git-dash", shell_output("#{bin}/git-dash --help")
  end
end
