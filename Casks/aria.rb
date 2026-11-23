cask "aria" do
  version "0.11.0"
  sha256 "1fcd5754d5c1b67ad73ec544ba4baa0349e9297953b8b0c5189808ac0759bea7"

  url "https://github.com/Farhad-Shabani/aria/releases/download/v#{version}/Aria.dmg"
  name "Aria"
  desc "Local voice assistant for dictation, speech, and AI agents"
  homepage "https://github.com/Farhad-Shabani/aria"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Aria.app"
  binary "#{appdir}/Aria.app/Contents/Helpers/aria"

  uninstall launchctl: "io.github.farhad-shabani.aria.daemon",
            quit:      "io.github.farhad-shabani.aria.mac"

  zap trash: [
    "~/.aria",
    "~/Library/Logs/aria-daemon.log",
    "~/Library/Preferences/io.github.farhad-shabani.aria.mac.plist",
  ]
end
