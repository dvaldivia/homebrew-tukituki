# Homebrew formula template for tukituki.
#
# `homebrew/render.sh` fills in 0.1.1 and the four __SHA__
# placeholders, then commits the rendered file to
# dvaldivia/homebrew-tukituki/Formula/tukituki.rb.

class Tukituki < Formula
  desc "Terminal UI for managing multiple dev processes"
  homepage "https://github.com/dvaldivia/tukituki"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.1/tukituki_darwin_arm64.tar.gz"
      sha256 "d136b5c8b9177cf04480cbf52bdb2502d7437953936308754f2c5a0dc72d21c3"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.1/tukituki_darwin_x86_64.tar.gz"
      sha256 "457e4302e0e6d100d45f4ab1487087f39f51eae32028c73361cf3c15bfd3ca28"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.1/tukituki_linux_arm64.tar.gz"
      sha256 "b7754254d6896112b00b57508080fca6020ed8d01e380d4a0c2fbcab422f3bee"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.1/tukituki_linux_x86_64.tar.gz"
      sha256 "1d6eb90601e9d5e26eb622f7da23cbb60b99b92ba3ed03c1cb2224caf35a879a"
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
