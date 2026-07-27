# Homebrew formula template for tukituki.
#
# `homebrew/render.sh` fills in 0.1.8 and the four __SHA__
# placeholders, then commits the rendered file to
# dvaldivia/homebrew-tukituki/Formula/tukituki.rb.

class Tukituki < Formula
  desc "Terminal UI for managing multiple dev processes"
  homepage "https://github.com/dvaldivia/tukituki"
  version "0.1.8"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.8/tukituki_darwin_arm64.tar.gz"
      sha256 "a4e39c06b01de90f146e4e32b0e35ce02a75e75a869ae03432738c9837b30a69"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.8/tukituki_darwin_x86_64.tar.gz"
      sha256 "5f36e2d1ba5f0d3cab336cd1b94d6aa6f10dabede649de32c28bd3dab68b4df6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.8/tukituki_linux_arm64.tar.gz"
      sha256 "db541fff613c581a26125f4826c69e0f7f90fa061ddbf54db671fb351850b71e"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.8/tukituki_linux_x86_64.tar.gz"
      sha256 "e6da9cd865f3492e369a458cf658a94ad46837236a4be0dc4941ac2714c415c3"
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
