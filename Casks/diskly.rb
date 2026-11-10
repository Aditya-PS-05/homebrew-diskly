cask "diskly" do
  version "0.8.0"
  sha256 "904835fd953c4ac143be29efdf304a56d2529fc32210ae9dfb0cfa14d608a10b"

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
