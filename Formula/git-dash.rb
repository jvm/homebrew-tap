class GitDash < Formula
  desc "Fast TUI dashboard for discovering and managing multiple Git repositories"
  homepage "https://github.com/jvm/git-dash"
  license "MIT"
  version "0.1.1"

  if Hardware::CPU.arm?
    url "https://github.com/jvm/git-dash/releases/download/v0.1.1/git-dash-v0.1.1-aarch64-apple-darwin.tar.gz"
    sha256 "f35aa69b6caa89366e33471996fb11c05b7a42ecedf0b6b5494b4465f945df9d"
  else
    url "https://github.com/jvm/git-dash/releases/download/v0.1.1/git-dash-v0.1.1-x86_64-apple-darwin.tar.gz"
    sha256 "7373ba27a8c34e05f4c076ab3d6229f973ca78fdb1431d53d5397c42e1c85772"
  end

  def install
    bin.install "git-dash"
  end

  test do
    assert_match "git-dash", shell_output("#{bin}/git-dash --help")
  end
end
