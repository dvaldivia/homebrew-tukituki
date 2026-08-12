# Homebrew formula template for tukituki.
#
# `homebrew/render.sh` fills in 0.1.13 and the four __SHA__
# placeholders, then commits the rendered file to
# dvaldivia/homebrew-tukituki/Formula/tukituki.rb.

class Tukituki < Formula
  desc "Terminal UI for managing multiple dev processes"
  homepage "https://github.com/dvaldivia/tukituki"
  version "0.1.13"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.13/tukituki_darwin_arm64.tar.gz"
      sha256 "75f4ecc421e7b6cf3b7411ac886e785810e550b858f1f80f95aa469a9c626cc4"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.13/tukituki_darwin_x86_64.tar.gz"
      sha256 "8eb515e6c06b275e5ff626212f4176b260a5f3553c396316dfd06b5940f2ac10"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.13/tukituki_linux_arm64.tar.gz"
      sha256 "551f8c0448ddb3861257f8f61a264cc3ac9c6deb14bd50f9b1735af788972b0f"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.13/tukituki_linux_x86_64.tar.gz"
      sha256 "274a801f434ba40235e08bde0c1e677d83a9511a23c4fb985106d31b98a15f22"
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
