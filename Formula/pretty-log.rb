class PrettyLog < Formula
  desc "Parses JSON logs and prints them in a clean, colorized view for humans."
  homepage "https://github.com/blesswinsamuel/pretty-log"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/blesswinsamuel/pretty-log/releases/download/v0.2.0/pretty-log-aarch64-apple-darwin.tar.xz"
      sha256 "88ee60588971b6722fb2cb76c28a3a6235ca2dd3eb69fa7944ade5fbca64fde6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blesswinsamuel/pretty-log/releases/download/v0.2.0/pretty-log-x86_64-apple-darwin.tar.xz"
      sha256 "fefefc6982790889fbd2ec48e4c8d798c2716d4611f4401ab1def3d12d68468a"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/blesswinsamuel/pretty-log/releases/download/v0.2.0/pretty-log-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "b7228af651f3d6f7bdf832f40e933f8883b4b4c71dc2c679fa3f913ede9c64ee"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blesswinsamuel/pretty-log/releases/download/v0.2.0/pretty-log-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "bd4c8f5b3293dadc9bb19a6701f698d31db89fe6c32eeaa18b34a045a6a9d202"
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
