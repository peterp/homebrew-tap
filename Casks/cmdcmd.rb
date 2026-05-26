cask "cmdcmd" do
  version "0.4.1"
  sha256 "2c565269a4a4fa2736b83048ad3e0c808bc2e66c83a690e9ff4c0ee458d86a8a"

  url "https://github.com/peterp/cmdcmd/releases/download/v#{version}/cmdcmd.zip"
  name "cmdcmd"
  desc "Keyboard-first window switcher"
  homepage "https://github.com/peterp/cmdcmd"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "cmdcmd.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/cmdcmd.app"]
  end

  uninstall quit: "com.p4p8.cmdcmd"

  zap trash: [
    "~/Library/Application Support/cmdcmd",
    "~/Library/Preferences/com.p4p8.cmdcmd.plist",
  ]
end
