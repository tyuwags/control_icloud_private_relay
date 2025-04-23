# toggle_icloud.sh

A small Bash/Zsh wrapper that opens macOS **System Settings** directly to the Apple ID → iCloud pane, inspects the current state of the iCloud checkbox, and toggles it on or off (including confirming the dialog). When it’s done, **System Settings** is automatically quit.

---

## Table of Contents

- [Prerequisites](#prerequisites)  
- [Installation](#installation)  
- [Usage](#usage)  
- [Customization](#customization)  
- [Troubleshooting](#troubleshooting)  
- [License](#license)  

---

## Prerequisites

1. **macOS 13 Ventura or later** (uses the new “System Settings” app).

   If it doesn't work on your Mac (error from AppleScript), you can use the project from https://github.com/OMGnotThatGuy/macos_internal_urls and replace the URL in the script to your own.  
2. **Accessibility permissions** for:
   - Your terminal app (e.g. Terminal.app, iTerm).  
   - **System Settings**  
   
   You can grant these under **System Settings → Privacy & Security → Accessibility**.

---

## Installation

1. **Download** or **clone** this repository to your local machine.  
2. **Make the script executable**:

   ```bash
   chmod +x toggle_icloud.sh
   ```

3. (Optional) Move it somewhere on your `PATH`, e.g.:

   ```bash
   mv toggle_icloud.sh /usr/local/bin/toggle_icloud
   ```

---

## Usage

```bash
./toggle_icloud.sh
# or, if installed in your PATH:
toggle_icloud
```

Each run will:

1. Open **System Settings** to the Apple ID → iCloud pane.  
2. Wait for the window to load.  
3. Inspect the “iCloud” checkbox:
   - If **ON**, it will click to turn **OFF** and confirm.  
   - If **OFF**, it will click to turn **ON** and confirm.  
4. Quit **System Settings**.

---

## Customization

- **Delays**  
  The script uses `sleep` (in shell) and `delay` (in AppleScript) to allow the UI time to render. If your Mac is particularly slow or fast, tweak these values:

  ```diff
  # In the shell portion
  - sleep 10
  + sleep 8      # shorten wait
  
  # In the AppleScript portion (example)
  - delay 2
  + delay 3      # lengthen each UI delay
  ```

- **Shebang**  
  By default, it uses Bash. To target Zsh, change the first line to:

  ```bash
  #!/usr/bin/env zsh
  ```

---

## Troubleshooting

- **Permission denied** when running:  
  Ensure you ran `chmod +x toggle_icloud.sh` and are invoking it correctly.

- **Script appears to hang** on “waiting for System Settings”:  
  - Verify you have granted Accessibility permissions to both **System Settings** and your terminal.  
  - Increase the initial `sleep` value if your machine is slow to open the Settings pane.

- **Button positions change in later macOS releases**:  
  The script’s UI targets (groups, buttons) can shift if Apple redesigns the pane. You may need to adjust the AppleScript selectors.

---
## Acknowledgments

- The scripts in this project were informed by the [icloud-private-relay-experiments (1_visit.sh)](https://github.com/marty90/icloud-private-relay-experiments) repository by marty90, which demonstrates how to programmatically control iCloud Private Relay.

---

## License

This project is released under the [MIT License](LICENSE). Feel free to use, modify, and redistribute as you see fit.

