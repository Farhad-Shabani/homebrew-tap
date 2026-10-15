cask "aria" do
  version "0.2.0"
  sha256 "ae0df5dbd64a93c0a55a864205f08b01401dc00b4d5b58220d8e22f6d2cdaf3a"

  url "https://github.com/Farhad-Shabani/aria/releases/download/v#{version}/aria-#{version}-macos-arm64.dmg"
  name "Aria"
  desc "Local voice assistant for dictation, speech, and AI agents"
  homepage "https://github.com/Farhad-Shabani/aria"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Aria.app"
  binary "#{appdir}/Aria.app/Contents/Helpers/aria"

  uninstall launchctl: "com.aria.daemon",
            quit:      "com.farhad.aria.mac"

  zap trash: [
    "~/.aria",
    "~/Library/Logs/aria-daemon.log",
    "~/Library/Preferences/com.farhad.aria.mac.plist",
  ]
end
