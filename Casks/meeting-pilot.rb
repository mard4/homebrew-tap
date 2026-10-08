cask "meeting-pilot" do
  version "0.3.0"
  sha256 "3c02a29707a5ea5af082cc1653dceaa6884e70c589e69aebd779270bc259a7f9"

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
end
