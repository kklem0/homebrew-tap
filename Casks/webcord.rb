cask "webcord" do
  arch arm: "arm64", intel: "x64"

  version "3.7.1"

  on_intel do
    sha256 "50ad50c626ced7d9cc2ccf214691a953fc23856515ff40f5288eeb86eac81781"
  end
  on_arm do
    sha256 "ff018566f8a5410c1b78e77ae015f77644ee866062c5079ab6440ffa03b35547"
  end

  url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-#{arch}.dmg"
  name "webcord"
  desc "A Discord and Fosscord Electron based client implemented without Discord API."
  homepage "https://github.com/SpacingBat3/WebCord"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "webcord.app"

  postflight do
    `codesign --force --deep --sign - "#{appdir}/webcord.app"`
    `xattr -r -d com.apple.quarantine "#{appdir}/webcord.app"`
  end

  zap trash: [
    "~/Library/Application\ Support/WebCord",
  ]
end