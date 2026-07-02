class Hugrs < Formula
  desc "Transparent caching proxy for HuggingFace and ModelScope model files"
  homepage "https://github.com/tq02ksu/hugrs"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tq02ksu/hugrs/releases/download/v0.5.0/hugrs-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "185ece5c13fb673f935a1a28b624fc45ec8db046a752e62c42847ad2ebedbaba"
    else
      url "https://github.com/tq02ksu/hugrs/releases/download/v0.5.0/hugrs-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "1b00306fa8020274413f7b6269151af8638fea5fd3db6ac0f08be17305fb8c2b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tq02ksu/hugrs/releases/download/v0.5.0/hugrs-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a065a9461210850b7979f55285ee973c3a1786bad3d7a3c0add120a14b8813e0"
    else
      url "https://github.com/tq02ksu/hugrs/releases/download/v0.5.0/hugrs-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a4b41b84f1ba5ab0a42e04220fec5a4a28dc517e9179b189b19f8aa596d1604b"
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
