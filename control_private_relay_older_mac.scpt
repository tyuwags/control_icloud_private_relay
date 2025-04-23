# 1) Open System Preferences to Apple ID pane
do shell script "open x-apple.systempreferences:com.apple.preferences.AppleIDPrefPane"

# 2) Give the window time to appear
delay 10

# 3) Use osascript to toggle
osascript <<'APPLESCRIPT'
set WINDOW_NAME to "Apple ID"
set PRIVACY_RELAY_INDEX to 3

-- Activate Private Relay (if off), or deactivate (if on)
tell application "System Preferences"
    activate
    set the current pane to pane id "com.apple.preferences.AppleIDPrefPane"
end tell

delay 2

tell application "System Events"
    tell window WINDOW_NAME of process "System Preferences"
        set relayBox to checkbox 1 of UI element 1 of row PRIVACY_RELAY_INDEX of table 1 of scroll area 1 of group 1
        if (relayBox's value as boolean) then
            -- Currently ON → turn off
            click relayBox
            delay 2
            click button "Turn Off Private Relay" of sheet 1
        else
            -- Currently OFF → turn on
            click relayBox
        end if
    end tell
end tell

tell application "System Preferences" to quit