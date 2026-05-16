# Homebrew formula template for tukituki.
#
# `homebrew/render.sh` fills in 0.1.2 and the four __SHA__
# placeholders, then commits the rendered file to
# dvaldivia/homebrew-tukituki/Formula/tukituki.rb.

class Tukituki < Formula
  desc "Terminal UI for managing multiple dev processes"
  homepage "https://github.com/dvaldivia/tukituki"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.2/tukituki_darwin_arm64.tar.gz"
      sha256 "5d1d9d66dd0fb9d64d3092e76366141fa76c071b213c279d3b32e1494eb1c4de"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.2/tukituki_darwin_x86_64.tar.gz"
      sha256 "c87b6a946088176fec244c8448cf97fc76729e80f523b759abc73ff058e9c39e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.2/tukituki_linux_arm64.tar.gz"
      sha256 "22ba8d8b0092dad131584039c48a8522cfc75ae8ec3d3f440f68650482355100"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.2/tukituki_linux_x86_64.tar.gz"
      sha256 "a35865e8c01cd7df07e8dd2a9197524043ab4fe96cd8d0038557de76d1ca7fcf"
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
