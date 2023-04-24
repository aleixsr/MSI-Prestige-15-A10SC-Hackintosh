# Hackintosh
OpenCore EFI for MSI Prestige 15 A10SC

## Specification
| **Component** | **Model** |
| ------------- | --------- |
| CPU | Intel Comet Lake i7-10710u |
| RAM | 32GB (2 x 16GB) Samsung DDR4 @2666MHz |
| IGPU | Intel Graphics UHD 630	|
| DGPU | Nvidia GTX1650 Max-Q |
| Display | CMN N156HCE-EN1 FHD / Sharp SHP14A1 15.6' 3840x2160(4K) |
| NVMe 1 | Kingston 512GB |
| NVMe 2 | Kingston 512GB |
| Audio | Realtek ACL298 |
| Wireless | DW1560 Broadcom BCM94352Z (default setting) / Intel AX201 |


**OpenCore version**: [0.9.1](https://github.com/acidanthera/opencorepkg/releases)

## Compatible macOS versions
 - Ventura (13.3.1)
 - Monterey (12.6.5)

## What Works
 - Wi-Fi : DW1560 (out of the box) / Intel AX201
 - Bluetooth (see sleep/wakeup hint)
 - HDMI (thanks to @vomesk)
 - Internal/External audio jacks
 - Sleep/Wake up

## What Doesn't Work
 - Nvidia GTX1650 Max-Q (Disabled via SSDT)
 - Fingerprint Reader Synaptics WBDI
 - Card Reader Realtek RTS5250 PCI-E



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
- If you've dual boot:
	- To enable macOS-only SMBIOS injection (disabled for Windows 10):
		- Kernel → Quirks → CustomSMBIOSGuid → True
		- Platforminfo → UpdateSMBIOSMode → Custom
	- To have UTC clock and fix Windows 10 issues : DualBoot/UniversalTimeFix.reg
	- Disable Fast Boot on Windows 10 : DualBoot/DisableFastBoot.reg
	- NTFS r/w support : brew install --cask osxfuse; brew install --cask mounty

## BlueTooth fix after sleep/wakeup
	- brew install blueutil
	- brew install sleepwatcher
	- echo "blueutil -p 0 && sleep 1 && blueutil -p 1" > ~/.wakeup
	- chmod +x ~/.wakeup
	- more ~/Library/LaunchAgents/homebrew.mxcl.sleepwatcher.plist
	- brew services restart sleepwatcher
	- ps -ef | grep -i sleepwatcher

## Audio jack noise fix after sleep/wakeup
	- ComboJack_Installer/install.sh

## Credits
 - [[Kext] Lilu v1.6.4](https://github.com/acidanthera/Lilu)
 - [[Kext] WhateverGreen v1.6.4](https://github.com/acidanthera/WhateverGreen)
 - [[Kext] VirtualSMC/SMCBatteryManager/SMCProcessor/SMCSuperIO/SMCLightSensor v1.3.1](https://github.com/acidanthera/VirtualSMC)
 - [[Kext] AppleALC v1.8.1](https://github.com/acidanthera/AppleALC)
 - [[Kext] VerbStub v1.0.4](https://github.com/hackintosh-stuff/ComboJack/tree/master/ComboJack_Installer)
 - [[Kext] VoodooPS2Controller v2.3.5](https://github.com/acidanthera/VoodooPS2)
 - [[Kext] VoodooI2C v2.8](https://github.com/VoodooI2C/VoodooI2C)
 - [[Kext] CPUFriend v1.2.6](https://github.com/acidanthera/CPUFriend)
 - [[Kext] NoTouchID v1.0.4](https://github.com/al3xtjames/NoTouchID)
 - [[Kext] NVMeFix v1.1.1](https://github.com/acidanthera/NVMeFix)
 - [[Kext] IOElectrify v1.0.0](https://github.com/the-darkvoid/macOS-IOElectrify)
 - [[Kext] AirportBrcmFixup v2.1.7](https://github.com/acidanthera/AirportBrcmFixup)
 - [[Kext] BrcmPatchRAM v2.6.5](https://github.com/acidanthera/BrcmPatchRAM)
 - [[Kext] AirportItlwm v2.2.0](https://github.com/OpenIntelWireless/itlwm)
 - [[Kext] IntelBluetoothFirmware v2.2.0](https://github.com/OpenIntelWireless/IntelBluetoothFirmware)



## Special Thanks to...
 - https://github.com/KerKerOgh/MSI-Prestige-15-Hackintosh
 - https://github.com/wgjas2/MSI-Prestige-15-Hackintosh
 - https://github.com/ueh-oaug/ComboJack


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
- Shottr : brew install --cask maccy
- Caffeine : brew install --cask caffeine
- iStat Menus : brew install --cask istat-menus
- Keka : brew install --cask keka
- Shottr Screenshot : brew install --cask shottr
- MonitorControl : brew install --cask monitorcontrol
- Numi : brew install --cask numi
- Pingu : https://github.com/attheodo/Pingu
- Tunnelblick : brew install --cask tunnelblick
- Sublime Text : brew install --cask sublime-text
