cask "tesseract-ai" do
  arch arm: "-arm64", intel: ""

  version "0.12.4"
  sha256 arm:   "9cb0614ad577ca29ec4e723ee7e4bd7eb0718df31bc1aabc1e7b988a0dd0626c",
         intel: "aecab0561fd140a9890b739e7414024559cfdd72b16497dcb273e070b62fd38e"

  url "https://github.com/opentech-dev/tesseract-release/releases/download/v#{version}/Tesseract-#{version}#{arch}.dmg",
      verified: "github.com/opentech-dev/tesseract-release/"
  name "Tesseract"
  desc "Free AI agent app that turns one sentence into finished work"
  homepage "https://tesseract.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :monterey"

  app "Tesseract.app"

  zap trash: [
    "~/Library/Application Support/Tesseract",
    "~/Library/Caches/dev.tesseract.app",
    "~/Library/Caches/dev.tesseract.app.ShipIt",
    "~/Library/Logs/Tesseract",
    "~/Library/Preferences/dev.tesseract.app.plist",
    "~/Library/Saved Application State/dev.tesseract.app.savedState",
  ]
end
