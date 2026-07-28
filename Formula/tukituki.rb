# Homebrew formula template for tukituki.
#
# `homebrew/render.sh` fills in 0.1.12 and the four __SHA__
# placeholders, then commits the rendered file to
# dvaldivia/homebrew-tukituki/Formula/tukituki.rb.

class Tukituki < Formula
  desc "Terminal UI for managing multiple dev processes"
  homepage "https://github.com/dvaldivia/tukituki"
  version "0.1.12"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.12/tukituki_darwin_arm64.tar.gz"
      sha256 "f423e2dc683eac6ba1ee46f144cc55c81757cc2d7268d4371672afad9af48a7b"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.12/tukituki_darwin_x86_64.tar.gz"
      sha256 "c530cb530965c339d1515aa15553236099107173e119bb3f6fff58b260c1d9a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.12/tukituki_linux_arm64.tar.gz"
      sha256 "89114c93b462997fc07f5b46ea203fb2cc0e66b8faec575d3f42c846d11bbca1"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.12/tukituki_linux_x86_64.tar.gz"
      sha256 "32669fa54fd6eb62bc6a823b505b30db8fba05983249e57a40f9fe0f6a623630"
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
