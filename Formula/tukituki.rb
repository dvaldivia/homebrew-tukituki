# Homebrew formula template for tukituki.
#
# `homebrew/render.sh` fills in 0.1.0 and the four __SHA__
# placeholders, then commits the rendered file to
# dvaldivia/homebrew-tukituki/Formula/tukituki.rb.

class Tukituki < Formula
  desc "Terminal UI for managing multiple dev processes"
  homepage "https://github.com/dvaldivia/tukituki"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.0/tukituki_darwin_arm64.tar.gz"
      sha256 "e89fbb9b8bc96b2cb130965102cdf2deb30ec0c0cc40515b00091dd41d018acf"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.0/tukituki_darwin_x86_64.tar.gz"
      sha256 "976925ea7c60ea46b1ff70ff50014ac5d37dec06e5a3677b76c6b9552e0ff52d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.0/tukituki_linux_arm64.tar.gz"
      sha256 "2d3d0d23c9691a8d19403e163aee7df47d90e44f3b36063d9c85cbba420aa6ec"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.0/tukituki_linux_x86_64.tar.gz"
      sha256 "9398605d08867040a444b13b6aed9c589cc74b81ff1002999dec3f307cbbf08c"
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
