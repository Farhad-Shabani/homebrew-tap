cask "aria" do
  version "0.5.0"
  sha256 "15f895d95d119acc00ae3de98258531578cbb2724a80c356c8230cf53d593da5"

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
