# X11OnWindows

X11OnWindows is a collection of utilities & scripts I used to quickly set up an X11 server on Windows 10 for X11 forwarding via SSH.

## Installation

To setup an X11 server on Windows 10 you need to do a couple of things. I recommend using the [setupX11.bat](setupX11.bat) that does everything I'm about to describe for you, but if you wish to do it manually, you need to:
 - Download and install an X11 server (I recommend [VcXsrv Windows X Server](https://sourceforge.net/projects/vcxsrv/)).
    - Instead of downloading through the SourceForge, I recommend using the `winget` command (Windows Package Manager): `winget -e install marha.VcXsrv`.
 - Add `DISPLAY` and `TMPDIR` Environment variables to allow `xauth` to successfully setup X11 trusted authentication via SSH.
    - To properly setup trusted X11 passthrough via SSH, you need to set `DISPLAY = "127.0.0.1:0.0"` and `TMPDIR="%TMP%"`.
    - You can use `setx` on a `cmd` shell to do this: `setx TMPDIR "%TMP%"`
- Add a workaround for `XAuthLocation` [bug](https://github.com/PowerShell/Win32-OpenSSH/issues/1563). You need to define `XAuthLocation` in your ssh config so the ssh client can use `xauth`, simply add this line at the bottom / top of your ssh config file: `XAuthLocation C:\Progra~1\\VcXsrv\\xauth.exe`.

## Usage

To use X11 you simply need to start your X11 server using `xlaunch.exe` and configure it, or alternatively, use the [`config.xlaunch`](config.xlaunch) file provided in this repository to automatically start it.

## Contributing
If you run into any issues with this, please [open an issue](https://github.com/jncfa/X11OnWindows/issues) so I can look into it!
