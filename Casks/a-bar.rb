cask "a-bar" do
  version "1.6.0"
  sha256 "3115db8848560885bd3c641a4410b45217850306419047818133fa379f929f40"

  url "https://github.com/Jean-Tinland/a-bar/releases/download/v#{version}/a-bar.zip"
  name "a-bar"
  desc "Status bar working on top of yabai and AeroSpace written in Swift"
  homepage "https://github.com/Jean-Tinland/a-bar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "a-bar.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-d", "com.apple.quarantine", "{{appdir}}/a-bar.app"],
        must_succeed:   false,
        writable_paths: ["a-bar.app"],
        writable_base:  :appdir
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
