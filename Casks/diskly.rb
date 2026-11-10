cask "diskly" do
  version "0.7.0"
  sha256 "4ff1ea9d8fe0d7fa78ecd0fbb74f2f3d9d144557cbfb891e418f68b38cf0b618"

  url "https://diskly.net/download/releases/Diskly-#{version}.dmg"
  name "Diskly"
  desc "Disk usage analyzer that shows what is safe to remove"
  homepage "https://diskly.net/"

  livecheck do
    url "https://diskly.net/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

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
