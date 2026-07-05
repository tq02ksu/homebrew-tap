class Hugrs < Formula
  desc "Transparent caching proxy for HuggingFace and ModelScope model files"
  homepage "https://github.com/tq02ksu/hugrs"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tq02ksu/hugrs/releases/download/v0.7.0/hugrs-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "373ab95c61fd46a310694c502e04252b51feeaa15a4409e0064452f5eed6affe"
    else
      url "https://github.com/tq02ksu/hugrs/releases/download/v0.7.0/hugrs-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "594d5b3019699e3d7db630b1bc34f2d9662e978e05c6bd6ae6d2a91d4ba70f60"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tq02ksu/hugrs/releases/download/v0.7.0/hugrs-v0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "740060860177959d8e6295b4a174fc930eca80af8095f6ebba558195a9d65262"
    else
      url "https://github.com/tq02ksu/hugrs/releases/download/v0.7.0/hugrs-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c7ae606334819f0c4a57e87d447f1859cebde76bd051b19dfe2bf4bc0190485"
    end
  end

  def install
    bin.install "hugrs", "hugrsctl"
  end

  test do
    assert_match "Usage: hugrs", shell_output("#{bin}/hugrs --help")
    assert_match "Usage:", shell_output("#{bin}/hugrsctl --help")
  end
end
