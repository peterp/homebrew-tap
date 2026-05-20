cask "cmdcmd" do
  version "0.4.0"
  sha256 "d3480096a93008ebb1cbad353edf1caa75ed9755398a8fa8d58cae67ebd00111"

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
