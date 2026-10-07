cask "meeting-pilot" do
  version "0.2.1"
  sha256 "28a193c8c5e8bc2644140ce892ee4a42b7c437e56bf8451375bfe4fe59973674"

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
