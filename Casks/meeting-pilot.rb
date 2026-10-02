cask "meeting-pilot" do
  version "0.1.2"
  sha256 "dc6ec2aeca9fecbfd3a1d4c15cae8efbb875e39062e834263a8941fde5e6a487"

  url "https://github.com/mard4/meeting-pilot/releases/download/v#{version}/MeetingPilot.dmg"
  name "Meeting Pilot"
  desc "Records Teams meetings, transcribes them on-device and publishes summaries"
  homepage "https://meetingpilotapp.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Meeting Pilot.app"

  zap trash: [
    "~/Library/Application Support/Meeting Pilot",
    "~/Library/Caches/io.github.mard4.MeetingPilot",
    "~/Library/HTTPStorages/io.github.mard4.MeetingPilot",
    "~/Library/Preferences/io.github.mard4.MeetingPilot.plist",
    "~/Library/Saved Application State/io.github.mard4.MeetingPilot.savedState",
  ]

  caveats <<~EOS
    Meeting Pilot is not notarized. The first time you open it, macOS will block it:
    go to System Settings > Privacy & Security and click "Open Anyway".
  EOS
end
