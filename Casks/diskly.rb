cask "diskly" do
  version "0.8.0"
  sha256 "af75901b7672818c165edf002d2366a0745bc48ffc4dc5c85c4e150048ce4659"

  url "https://diskly.net/download/releases/Diskly-#{version}.dmg"
  name "Diskly"
  desc "Disk usage analyzer that shows what is safe to remove"
  homepage "https://diskly.net/"

  livecheck do
    url "https://diskly.net/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Diskly.app"

  zap trash: [
    "~/Library/Application Support/Diskly",
    "~/Library/Caches/app.diskly.mac",
    "~/Library/Caches/Diskly",
    "~/Library/HTTPStorages/app.diskly.mac",
    "~/Library/Preferences/app.diskly.mac.plist",
    "~/Library/Preferences/Diskly.plist",
    "~/Library/Saved Application State/app.diskly.mac.savedState",
  ]
end
