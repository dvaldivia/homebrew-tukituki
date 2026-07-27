# Homebrew formula template for tukituki.
#
# `homebrew/render.sh` fills in 0.1.11 and the four __SHA__
# placeholders, then commits the rendered file to
# dvaldivia/homebrew-tukituki/Formula/tukituki.rb.

class Tukituki < Formula
  desc "Terminal UI for managing multiple dev processes"
  homepage "https://github.com/dvaldivia/tukituki"
  version "0.1.11"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.11/tukituki_darwin_arm64.tar.gz"
      sha256 "8bb4abd86a88e19dcf2f631e7d29a2284da1028b4e0742d30a9f7da30d8420ea"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.11/tukituki_darwin_x86_64.tar.gz"
      sha256 "5ecfbc50eeec89e4895737a2dd4778e954abe365569bcd1912d2a8dae18e0467"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.11/tukituki_linux_arm64.tar.gz"
      sha256 "7b5776ea974c7cdc3cca32a098e9c57ed74727c0dc24a0365219901fbbeabe15"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.11/tukituki_linux_x86_64.tar.gz"
      sha256 "cc9fa1c50405dbc4920fc7522e4df59b279a92e10d423711bccdef585417d4e4"
    end
  end

  def install
    bin.install "tukituki"
    bin.install_symlink "tukituki" => "tktk"
  end

  test do
    assert_match "tukituki", shell_output("#{bin}/tukituki version")
    assert_match "tukituki", shell_output("#{bin}/tktk version")
  end
end
