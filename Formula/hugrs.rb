class Hugrs < Formula
  desc "Transparent caching proxy for HuggingFace and ModelScope model files"
  homepage "https://github.com/tq02ksu/hugrs"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tq02ksu/hugrs/releases/download/v0.6.1/hugrs-v0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "7de30996370b3d01aa5840831ea202d41017e82c317a3e08817b7deaf246bd00"
    else
      url "https://github.com/tq02ksu/hugrs/releases/download/v0.6.1/hugrs-v0.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "61a78c2e1cf0f790b3e41fa953c12e622ddc54b8e9a087c3660942d5450d7c0a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tq02ksu/hugrs/releases/download/v0.6.1/hugrs-v0.6.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7e0f37f60eb3341cd05300c7b2a8da1b93a3dc091e897b1e43c93ab77fe3cc5c"
    else
      url "https://github.com/tq02ksu/hugrs/releases/download/v0.6.1/hugrs-v0.6.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "862381be36d9bbab42d331789e0dd4c42546f164512495bc7819eae0a571833c"
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
