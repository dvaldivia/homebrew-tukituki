# Homebrew formula template for tukituki.
#
# `homebrew/render.sh` fills in 0.1.10 and the four __SHA__
# placeholders, then commits the rendered file to
# dvaldivia/homebrew-tukituki/Formula/tukituki.rb.

class Tukituki < Formula
  desc "Terminal UI for managing multiple dev processes"
  homepage "https://github.com/dvaldivia/tukituki"
  version "0.1.10"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.10/tukituki_darwin_arm64.tar.gz"
      sha256 "81ace8d6bc25c4130a68b1b9da5264af5060d22de876a14a0b1dd55c0cc9ca37"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.10/tukituki_darwin_x86_64.tar.gz"
      sha256 "67d52190ebe0b76c6769bb36d70beee1c19959550e226b968045cf5d8e038f2c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.10/tukituki_linux_arm64.tar.gz"
      sha256 "fea5329f5a1478072c122f1d7f827e7bcb6cb359f48da0d6a353222368e6ad12"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.10/tukituki_linux_x86_64.tar.gz"
      sha256 "fa2d325d65d68b31cef778e1c7c36bdbdfe9f369fca209df61d2f0d70beb9a15"
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
