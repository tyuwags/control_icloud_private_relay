# 1) Open System Settings directly at the iCloud pane
do shell script "open x-apple.systempreferences:com.apple.systempreferences.AppleIDSettings*AppleIDSettings?iCloud"

# 2) Give the window time to appear
delay 10

# 3) Use osascript to inspect & click
tell application "System Events"
    -- Bring Settings to the front
    tell application process "System Settings"
        set frontmost to true

        -- Target the "iCloud" window
        tell window "iCloud"
            delay 2

            -- Click the “Manage…” (or similar) button to reveal the checkbox sheet
            click button 1 of group 3 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1
            delay 2

            -- Grab the checkbox in the sheet
            set theCheckbox to checkbox 1 of group 1 of scroll area 1 of group 1 of sheet 1

            -- Toggle it
            if (theCheckbox's value as boolean) then
                -- Currently ON → click to turn OFF
                click theCheckbox
                delay 2
                click button 1 of sheet 1 of sheet 1
            else
                -- Currently OFF → click to turn ON
                click theCheckbox
                delay 2
                
            end if
            -- Confirm “Turn On/Off”
            click button 1 of group 1 of sheet 1
            delay 2
        end tell
    end tell
end tell

-- 4) Quit System Settings
tell application "System Settings" to quit
