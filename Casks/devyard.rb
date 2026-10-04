# typed: false
# frozen_string_literal: true

cask "devyard" do
  version "0.1.0"

  on_macos do
    on_arm do
      sha256 "7df0f96c592bae0638f051acc708b316e959fa26a1eca801af1c1b3917a9afaa"
      url "https://github.com/blesswinsamuel/devyard/releases/download/v#{version}/devyard_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "a76e512dc19eb29cc75d775bdaefaa9a1ec3a919bd098e4db848a1db3796a53f"
      url "https://github.com/blesswinsamuel/devyard/releases/download/v#{version}/devyard_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "e171e1634c1362716cafc8a11f88748ac8b9ff90113ba420addcad447ced026f"
      url "https://github.com/blesswinsamuel/devyard/releases/download/v#{version}/devyard_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "4acd458227a626ed1df56d04e37156e92b9f5bb0438bcae5e46b2649d5f6a2b4"
      url "https://github.com/blesswinsamuel/devyard/releases/download/v#{version}/devyard_#{version}_linux_amd64.tar.gz"
    end
  end

  name "devyard"
  desc "Orchestrate local processes with a compose-style config (no Docker)"
  homepage "https://github.com/blesswinsamuel/devyard"

  binary "devyard"
end
