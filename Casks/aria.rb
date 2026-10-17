cask "aria" do
  version "0.3.0"
  sha256 "e79401e90baf71dfb013e94e1f7796b5f1c849eb8b89e7e7005a0d3d85c237f6"

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
