class PortpeekMcp < Formula
  desc "Headless MCP server for AI agent port coordination"
  homepage "https://adamorad.github.io/portpeek/"
  url "https://github.com/adamorad/portpeek/archive/refs/tags/mcp-v0.1.0.tar.gz"
  sha256 "29c53c18615083fa67ddf1ac5edb1c4856cc97bfa143be55b8eb27b16275f891"
  version "0.1.0"
  license "MIT"

  depends_on :macos => :ventura

  def install
    system "swift", "build", "--package-path", "mcp-server", "-c", "release",
           "--disable-sandbox"
    bin.install "mcp-server/.build/release/portpeek-mcp"
  end

  test do
    assert_predicate bin/"portpeek-mcp", :exist?
  end
end
