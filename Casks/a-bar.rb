cask "a-bar" do
  version "1.6.3"
  sha256 "6746e5aa5457ba06f781eaa46433e5ee5dc5b95b37cf93059faffbe9b029984d"

  url "https://github.com/Jean-Tinland/a-bar/releases/download/v#{version}/a-bar.zip",
      verified: "github.com/Jean-Tinland/a-bar/"
  name "a-bar"
  desc "Status bar working on top of yabai and AeroSpace written in Swift"
  homepage "https://github.com/Jean-Tinland/a-bar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "a-bar.app"

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{appdir}/a-bar.app"
  end

  uninstall quit: "com.jeantinland.a-bar"

  zap trash: [
    "~/Library/Application Support/a-bar",
    "~/Library/Caches/com.jeantinland.a-bar",
    "~/Library/Containers/com.jeantinland.a-bar",
    "~/Library/Logs/a-bar",
    "~/Library/Preferences/com.jeantinland.a-bar.plist",
  ]
end
