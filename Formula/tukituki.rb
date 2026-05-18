# Homebrew formula template for tukituki.
#
# `homebrew/render.sh` fills in 0.1.3 and the four __SHA__
# placeholders, then commits the rendered file to
# dvaldivia/homebrew-tukituki/Formula/tukituki.rb.

class Tukituki < Formula
  desc "Terminal UI for managing multiple dev processes"
  homepage "https://github.com/dvaldivia/tukituki"
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.3/tukituki_darwin_arm64.tar.gz"
      sha256 "0b3905a58a8634895f6f4c521b89a677d5e670238d41c0a50da5f111c423f089"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.3/tukituki_darwin_x86_64.tar.gz"
      sha256 "6fdef0feeb84578c0f28fb6e191942e7c0c228b8eabbf7c2fc07747a24c53af1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.3/tukituki_linux_arm64.tar.gz"
      sha256 "9726c46685583cc4b7e2b2496ec6ec0ab1b8a5074068c0441d63cd87ac22793b"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.3/tukituki_linux_x86_64.tar.gz"
      sha256 "bd701b313ebbef8d79949d141df8c4b4fffb2e28329c49ff09135e6113fa5087"
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
