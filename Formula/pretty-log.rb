class PrettyLog < Formula
  desc "Parses JSON logs and prints them in a clean, colorized view for humans."
  homepage "https://github.com/blesswinsamuel/pretty-log"
  version "0.3.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/blesswinsamuel/pretty-log/releases/download/v0.3.0/pretty-log-aarch64-apple-darwin.tar.xz"
      sha256 "9e6561592fc6ad4e906b3f12f58fea19ae55b70aa4c38ddca5627459628e70a7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blesswinsamuel/pretty-log/releases/download/v0.3.0/pretty-log-x86_64-apple-darwin.tar.xz"
      sha256 "a69e0968023ad0566a90ddd0ef96f89ce3481e78c7a6c74d6050cd48ac17eb14"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/blesswinsamuel/pretty-log/releases/download/v0.3.0/pretty-log-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "6e9d0a28fcca39e69788aaf1e9ee67e453c1fbba5eab3ef8de401940028f2b41"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blesswinsamuel/pretty-log/releases/download/v0.3.0/pretty-log-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "29978a9bcb31a3fe5aec9a0bdcd977c11fe2fb145b8b0649fef066a3500e6ef4"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin": {},
    "x86_64-unknown-linux-gnu": {}
  }

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "pretty-log"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "pretty-log"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "pretty-log"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "pretty-log"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
