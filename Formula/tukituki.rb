# Homebrew formula template for tukituki.
#
# `homebrew/render.sh` fills in 0.1.5 and the four __SHA__
# placeholders, then commits the rendered file to
# dvaldivia/homebrew-tukituki/Formula/tukituki.rb.

class Tukituki < Formula
  desc "Terminal UI for managing multiple dev processes"
  homepage "https://github.com/dvaldivia/tukituki"
  version "0.1.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.5/tukituki_darwin_arm64.tar.gz"
      sha256 "be5ae8c3fadff3ab5d36ed5b32958e7662525e07d66a159a981139743278ae64"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.5/tukituki_darwin_x86_64.tar.gz"
      sha256 "9e81102b91f4cf7773e5522bc3a33e9dfb47ff0a55c8aebb3a92e6e715d58300"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.5/tukituki_linux_arm64.tar.gz"
      sha256 "c8431118205a3ecb4432623c512ab3ac97f6018a7972e2f7d87cade4f8b0200f"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.5/tukituki_linux_x86_64.tar.gz"
      sha256 "1f74b348628f99566b142cf101d02f3c285635d4e40465670cf02f10a54b4274"
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
