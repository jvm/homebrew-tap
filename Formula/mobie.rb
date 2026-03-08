class Mobie < Formula
  desc "Standalone CLI for querying the MOBIE API"
  homepage "https://github.com/jvm/mobie-cli"
  license "ISC"
  version "0.2.0"

  if Hardware::CPU.arm?
    url "https://github.com/jvm/mobie-cli/releases/download/v0.2.0/mobie-v0.2.0-aarch64-apple-darwin.tar.gz"
    sha256 "d3ad932677a935637858d6849c2b8018a5eabb2fc11e7e24e5042f57d8b67135"
  else
    url "https://github.com/jvm/mobie-cli/releases/download/v0.2.0/mobie-v0.2.0-x86_64-apple-darwin.tar.gz"
    sha256 "b75a1984271ea1365555f7900b80223940db3756b53269a3ba2df78cb670c38b"
  end

  def install
    bin.install "mobie"
  end

  test do
    assert_match "mobie", shell_output("#{bin}/mobie --help")
  end
end
