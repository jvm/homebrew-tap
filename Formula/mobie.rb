class Mobie < Formula
  desc "Standalone CLI for querying the MOBIE API"
  homepage "https://github.com/jvm/mobie-cli"
  license "ISC"
  version "0.1.3"

  if Hardware::CPU.arm?
    url "https://github.com/jvm/mobie-cli/releases/download/v0.1.3/mobie-v0.1.3-aarch64-apple-darwin.tar.gz"
    sha256 "3a19a0a32199e18035ce2bcd74fbcab29653bb946b5bd039917fcc641b331f6e"
  else
    url "https://github.com/jvm/mobie-cli/releases/download/v0.1.3/mobie-v0.1.3-x86_64-apple-darwin.tar.gz"
    sha256 "cecba00e74303e0b88dc9c8ef1224689aaa84fea311bbdb0f045388051138f4a"
  end

  def install
    bin.install "mobie"
  end

  test do
    assert_match "mobie", shell_output("#{bin}/mobie --help")
  end
end
