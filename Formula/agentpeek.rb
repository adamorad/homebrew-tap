class Agentpeek < Formula
  desc "Agent coordination daemon for macOS — named locks and shared scratchpad via MCP"
  homepage "https://agentpeek-web.vercel.app"
  url "https://github.com/adamorad/agentpeek/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "f1a1904d699836267fff23b165828f1f349b1e85460b35360d0cb318581c1ef6"
  version "1.0.0"
  license "MIT"

  depends_on :macos => :ventura

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/agentpeek"
    (share/"agentpeek").install "com.agentpeek.daemon.plist"
  end

  def caveats
    <<~EOS
      To start AgentPeek automatically at login:
        cp #{share}/agentpeek/com.agentpeek.daemon.plist ~/Library/LaunchAgents/
        launchctl load ~/Library/LaunchAgents/com.agentpeek.daemon.plist

      Then configure your MCP client to connect to http://127.0.0.1:27183
    EOS
  end

  test do
    assert_predicate bin/"agentpeek", :exist?
  end
end
