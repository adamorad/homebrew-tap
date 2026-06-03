cask "csv-quick-look" do
  version "1.0.1"
  sha256 "3395634b917b72c25966a35b90720b78218d40dd8b423db18f8778d0ae0bc544"

  url "https://github.com/adamorad/csv-quick-look/releases/download/v1.0.1/CSV.Quick.Look.zip"
  name "CSV Quick Look"
  desc "QuickLook extension for CSV and TSV files"
  homepage "https://github.com/adamorad/csv-quick-look"

  app "CSV Quick Look.app"

  zap trash: "~/Library/Preferences/com.adammorad.csvquicklook.plist"
end
