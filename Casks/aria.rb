cask "aria" do
  version "0.4.0"
  sha256 "4b0a9c500849a06ddaad686c27ffc9bcd08a5b97e2ab3b2b063bb98714de67ce"

  url "https://github.com/Farhad-Shabani/aria/releases/download/v#{version}/aria-#{version}-macos-arm64.dmg"
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
