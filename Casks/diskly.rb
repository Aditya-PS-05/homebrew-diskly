cask "diskly" do
  version "0.9.0"
  sha256 "aa9cb3cdd4808b72b7c9e5e692731874e723d215386cfd8536276051a83821e5"

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
