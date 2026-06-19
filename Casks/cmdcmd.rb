cask "cmdcmd" do
  version "0.5.0"
  sha256 "637598b44efa5e7aab6ce7655971eb2e42d4f81cc0589852020827f7c0899803"

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
