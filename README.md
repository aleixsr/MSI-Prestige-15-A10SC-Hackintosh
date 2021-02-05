# Hackintosh
OpenCore EFI for MSI Prestige 15 A10SC

## Specification
| **Component** | **Model** |
| ------------- | --------- |
| CPU | Intel Comet Lake i7-10710u |
| RAM | 32GB (2 x 16GB) Samsung DDR4 @2666MHz |
| IGPU | Intel Graphics UHD 620	|
| DGPU | Nvidia GTX1650 Max-Q |
| Display | CMN N156HCE-EN1 FHD |
| NVMe 1 | Kingston 512GB |
| NVMe 2 | Kingston 512GB |
| Audio | Realtek ACL298 |
| Wireless | DW1560 Broadcom BCM94352Z (default setting) / Intel AX201 |


**OpenCore version**: [0.6.6](https://github.com/acidanthera/opencorepkg/releases)

## Compatible macOS versions
 - Big Sur (11.1)

## What Works
 - Wi-Fi : DW1560 (out of the box) / Intel AX201 (see workaround)
 - Bluetooth
 - HDMI/DisplayPort
 - Internal/External audio jacks
 - Sleep/Wake up

## What Doesn't Work
 - Nvidia GTX1650 Max-Q (Disabled via SSDT)
 - Fingerprint Reader Synaptics WBDI
 - Card Reader Realtek RTS5250 PCI-E


## Issues/Workarounds
- Intel Wi-Fi : Run Tools/HeliPort app at login, please check [FAQs] https://openintelwireless.github.io/itlwm/FAQ.html


## How to use
  1. Make your USB installer with [**this guide**](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/)
  	sudo /Applications/Install\ macOS\ YOUR\ VERSION.app/Contents/Resources/createinstallmedia --volume /Volumes/USB --nointeraction
  2. Clone the repository and paste "BOOT" and "OC" directories into your's pendrive "EFI" folder
  3. Download [**GenSMBIOS**](https://github.com/corpnewt/GenSMBIOS) to generate unique SMBIOS information. Run it and follow all steps, as the model select **MacBookPro15,4 1**.
  4. Boot it!  

**You CAN NOT use SMBIOS from this repository, it MUST be unique for every macOS installation**

## Steps
 - BIOS:
 	- Turn off Secure Boot
 	- Press L-ALT + R-CTRL + R-SHIFT + F2 or (fn + F2) for see hidden feature
 	- Advanced → Power & Performance → CPU - Power Management Control → CPU Lock Configuration → CFG Lock : Disabled

 		
## Post Installation
- Move your OpenCore EFI folder to a MacOS drive: https://dortania.github.io/OpenCore-Post-Install/universal/oc2hdd.html#grabbing-opencore-off-the-usb

## Hints
- SIP has been disabled permanently : csr-active-config = FF070000
- If you've dual boot:
	- To enable macOS-only SMBIOS injection:
		- Kernel → Quirks → CustomSMBIOSGuid → True
		- Platforminfo → CustomSMBIOSMode → Custom
	- To have UTC clock and fix Windows 10 issues : DualBoot/UniversalTimeFix.reg
	- Disable Fast Boot on Windows 10 : DualBoot/DisableFastBoot.reg
	- NTFS r/w support : brew install --cask osxfuse; brew install --cask mounty

## Credits
 - [[Kext] Lilu v1.5.1](https://github.com/acidanthera/Lilu)
 - [[Kext] VirtualSMC v1.2.0](https://github.com/acidanthera/VirtualSMC)
 - [[Kext] WhateverGreen v1.4.7](https://github.com/acidanthera/WhateverGreen)
 - [[Kext] AppleALC v1.5.7](https://github.com/acidanthera/AppleALC)
 - [[Kext] VoodooPS2Controller v2.2.1](https://github.com/acidanthera/VoodooPS2)
 - [[Kext] VoodooI2C v2.2.1](https://github.com/VoodooI2C/VoodooI2C)
 - [[Kext] CPUFriend v1.2.3](https://github.com/acidanthera/CPUFriend)
 - [[Kext] NoTouchID v1.0.4](https://github.com/al3xtjames/NoTouchID)
 - [[Kext] NVMeFix v1.0.5](https://github.com/acidanthera/NVMeFix)
 - [[Kext] USBInjectAll v0.7.5](https://github.com/Sniki/OS-X-USB-Inject-All)
 - [[Kext] AirportBrcmFixup v2.1.2](https://github.com/acidanthera/AirportBrcmFixup)
 - [[Kext] itlwm v1.2.0](https://github.com/OpenIntelWireless/itlwm)
 - [[Kext] IntelBluetoothFirmware v1.1.2](https://github.com/OpenIntelWireless/IntelBluetoothFirmware)
 - [[Kext] IntelBluetoothInjector v1.1.2](https://github.com/OpenIntelWireless/IntelBluetoothFirmware)



## Special Thanks to...
 - https://github.com/naturalBlacksmith/hackintosh-msi-prestige-15
 - https://github.com/KerKerOgh/MSI-Prestige-15-Hackintosh
 - https://github.com/wgjas2/MSI-Prestige-15-Hackintosh


# Hackitosh Apps
- Install Homebrew : 
	- /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
- Karabiner :
	- brew install --cask karabiner-elements
	- Import settings from karabiner/ folder
	- If doesn't work change keyboard to "virtual" and change to USB Keyboard again
- Hackintool
- OpenCore Configurator


# MacOS Apps
- iTerm2 + Oh My Zsh! :
	- brew install --cask iterm2
	- brew install zsh zsh-completions
	- Follow https://www.freecodecamp.org/news/how-to-configure-your-macos-terminal-with-zsh-like-a-pro-c0ab3f3c1156/
- XtraFinder : https://www.trankynam.com/xtrafinder/
- HyperDock : brew install --cask hyperdock
- HyperSwitch : brew install --cask hyperswitch
- CopyQ : brew install --cask copyq
- Caffeine : brew install --cask caffeine
- iStat Menus : brew install --cask istat-menus
- Keka : brew install --cask keka
- Lightshot Screenshot : https://app.prntscr.com/es/download.html
- MonitorControl : brew install --cask monitorcontrol
- Numi : brew install --cask numi
- PingMenu : brew install --cask pingmenu
- Tunnelblick : brew install --cask tunnelblick
- Sublime Text : brew install --cask sublime-text
