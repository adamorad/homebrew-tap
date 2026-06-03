cask "csv-quick-look" do
  version "1.0.1"
  sha256 :no_check

  url "https://github.com/adamorad/csv-quick-look/releases/download/v#{version}/CSV.Quick.Look.zip"
  name "CSV Quick Look"
  desc "QuickLook extension for CSV and TSV files"
  homepage "https://github.com/adamorad/csv-quick-look"

  app "CSV Quick Look.app"

  zap trash: "~/Library/Preferences/com.adammorad.csvquicklook.plist"
end
