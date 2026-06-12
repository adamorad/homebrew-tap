class Airlock < Formula
  desc "Agent coordination daemon for macOS — named locks and shared scratchpad via MCP"
  homepage "https://airlock-web.vercel.app"
  url "https://github.com/adamorad/airlock/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "11dabcde924b50010e5a889f13c9613092f0f1a1bedf6bf27bbbd629247c9ffd"
  version "1.1.0"
  license "MIT"

  depends_on :macos => :ventura

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/airlock"
    (share/"airlock").install "com.airlock.daemon.plist"
  end

  def caveats
    <<~EOS
      To start Airlock automatically at login:
        cp #{share}/airlock/com.airlock.daemon.plist ~/Library/LaunchAgents/
        launchctl load ~/Library/LaunchAgents/com.airlock.daemon.plist

      Then configure your MCP client to connect to http://127.0.0.1:27183
    EOS
  end

  test do
    assert_predicate bin/"airlock", :exist?
  end
end