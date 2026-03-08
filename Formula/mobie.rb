class Mobie < Formula
  desc "Standalone CLI for querying the MOBIE API"
  homepage "https://github.com/jvm/mobie-cli"
  license "ISC"
  version "0.3.0"

  if Hardware::CPU.arm?
    url "https://github.com/jvm/mobie-cli/releases/download/v0.3.0/mobie-v0.3.0-aarch64-apple-darwin.tar.gz"
    sha256 "d0e8331a6293af267161d0b01ddca893da408621520afe8ca5e2dc1543eb31a5"
  else
    url "https://github.com/jvm/mobie-cli/releases/download/v0.3.0/mobie-v0.3.0-x86_64-apple-darwin.tar.gz"
    sha256 "c81878d1127c962d68661d677035c9255c9f8398237063db1d4837999b7a7b9f"
  end

  def install
    bin.install "mobie"
  end

  test do
    assert_match "mobie", shell_output("#{bin}/mobie --help")
  end
end
