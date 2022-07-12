# X11OnWindows

X11OnWindows is a collection of utilities & scripts I used to quickly set up an X11 server on Windows 10.

## Installation

To setup an X11 server on Windows 10 you need to do a couple of things:
 - Download and install an X11 server (I recommend [VcXsrv Windows X Server](https://sourceforge.net/projects/vcxsrv/)).
    - Instead of downloading through the SourceForge, I recommend using the `winget` command (Windows Package Manager): `winget -e install marha.VcXsrv`.
 - Add `DISPLAY` and `TMPDIR` Environment variables to allow `xauth` to successfully setup X11 trusted authentication via SSH.
    - To properly setup trusted X11 passthrough via SSH, you need to set `DISPLAY = "127.0.0.1:0.0"` and `TMPDIR="%TMP%"`.
    - You can use `setx` on a `cmd` shell to do this: `setx TMPDIR "%TMP%"`
## Usage

To use X11 you simply need to start your X11 server using `xlaunch.exe` and configure it, or alternatively, use the [`config.xlaunch`](config.xlaunch) file provided in this repository to automatically start it.

## Contributing
If you run into any issues with this, please [open an issue](https://github.com/jncfa/X11OnWindows/issues) first.
