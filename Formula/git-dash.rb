class GitDash < Formula
  desc "Fast TUI dashboard for discovering and managing multiple Git repositories"
  homepage "https://github.com/jvm/git-dash"
  license "MIT"
  version "0.1.0"

  if Hardware::CPU.arm?
    url "https://github.com/jvm/git-dash/releases/download/v0.1.0/git-dash-v0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "32300136926403e155ec070b148e4cd00be9ece29cc8d9e37b27e3fd68ee73fd"
  else
    url "https://github.com/jvm/git-dash/releases/download/v0.1.0/git-dash-v0.1.0-x86_64-apple-darwin.tar.gz"
    sha256 "f432b2ddc05b5ae14fb074ee46ea4b6bf2926941fb7e1a3f19be6c7763c0f09e"
  end

  def install
    bin.install "git-dash"
  end

  test do
    assert_match "git-dash", shell_output("#{bin}/git-dash --help")
  end
end
