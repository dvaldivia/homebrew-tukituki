# Homebrew formula template for tukituki.
#
# `homebrew/render.sh` fills in 0.1.4 and the four __SHA__
# placeholders, then commits the rendered file to
# dvaldivia/homebrew-tukituki/Formula/tukituki.rb.

class Tukituki < Formula
  desc "Terminal UI for managing multiple dev processes"
  homepage "https://github.com/dvaldivia/tukituki"
  version "0.1.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.4/tukituki_darwin_arm64.tar.gz"
      sha256 "318994aa3fd7012098ea0358bc94bb26f5bc432d248b922030aebe22504ff7a3"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.4/tukituki_darwin_x86_64.tar.gz"
      sha256 "9e7abd6772b2fc9fe48830d8eecd3d4a0ab05ba5c86850c386ce1fcfcb269b27"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.4/tukituki_linux_arm64.tar.gz"
      sha256 "8d6d1d37d61492d1d5594d9a03629e96849de72864e6668d39fab44144d3ecb9"
    end
    on_intel do
      url "https://github.com/dvaldivia/tukituki/releases/download/v0.1.4/tukituki_linux_x86_64.tar.gz"
      sha256 "4846767aaa107f058a99a41093e98a837b5f9f6884620335d47337165ad0e8f5"
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
