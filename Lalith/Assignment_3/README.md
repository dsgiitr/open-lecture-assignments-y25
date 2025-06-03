# PC Guardian
## `libinput` 
This tool help us to record the input devices from our system.<br>
- `libinput list-devices` - List all input devices.
- `libinput debug-events` - Monitor input events in real-time.
  - We are using this command to record the input events from the system.
  - It reads from the `/dev/input/event*` files.
## `espeak`
We use this tool to convert text to speech.<br>
- `espeak -s 150 -p 50 -v en-us "Hello World"` - Convert text to speech.
  - `-s` is the speed of the speech.
  - `-p` is the pitch of the speech.
  - `-v` is the voice of the speech.
# What it does?
- Logs detection of input devices.
- Triggeres an alert when a mouse movement is detected.
- Converts the alert message to speech.
- Has 10s sleep time to avoid multiple alerts.
- Threshold time for mouse movement is 1ms.
