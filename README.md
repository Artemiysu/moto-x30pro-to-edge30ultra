# Guide: How to globalize Moto X30 Pro
A Guide to Globalizing Moto X30 Pro into a Motorola Edge 30 Ultra

---

## 1 - Unlocking bootloader
1) Make sure you have OEM unlocking enabled and USB debugging enabled.
2) Download [platform-tools](https://developer.android.com/tools/releases/platform-tools).
3) Connect your phone to PC and enter these commands:
```adb reboot bootloader```
then
```fastboot oem get_unlock_data```
The console displays 5 lines of long alphanumeric code. This code needs to be copied and pasted into one continuous long line, completely removing spaces and technical words like (bootloader).
4) Go to the [Motorola website](https://en-us.support.motorola.com/app/standalone/bootloader/unlock-your-device-b) and follow the guide.
5) Enter this command:
```fastboot oem unlock YOUR_RECEIVED_KEY```
6) Congratulations! You have unlocked the bootloader!

---

## 2 - Preparing for flashing and flashing
1) Download [RSU](https://support.lenovo.com/us/en/downloads/ds101291).
2) Open RSU and login.
3) Go to **"Rescue"**, then - **"Phones"**, **"Input IMEI"** and input this `355222700910939` or find the IMEI of the global version of the phone.
4) Download the firmware and wait for RSA to unpack the firmware files.
5) Go to `C:\ProgramData\RSA\Download\RomFiles\YOUR_FIRMWARE_FOLDER.xml`
6) Download the `flash_global.bat` script from this repository.
7) Copy `flash_global.bat` and paste it directly into your firmware folder (`C:\ProgramData\RSA\Download\RomFiles\YOUR_FIRMWARE_FOLDER\`).
8) Reboot your phone into **Fastboot Mode** (Power + Volume Down) and connect it to your PC via original USB cable.
9) Double-click `flash_global.bat` inside the firmware folder to start the automated flashing process.
10) **Be patient:** The script will automatically flash all necessary images. Flashing the dynamic `super` partition will take a few minutes as it sends 18 separate sparse chunks. This is completely normal.
11) Once finished, the script will automatically erase `userdata` and `metadata` to prevent region-mix bugs, and then send the reboot command.
12) Done! The first boot may take about 5-10 minutes.

---

## 🔍 3 - Troubleshooting (Cellular Network Fix)

If your device boots up into the Global ROM perfectly but you experience **no signal (cellular network drop / cross-region modem conflict)**, you need to restore the original Chinese modem files.

1. Download the original Chinese stock firmware for **Moto X30 Pro**.
2. Extract `radio.img` (or `NON-HLOS.bin`) from the Chinese firmware package.
3. Put your phone back into **Fastboot Mode** and connect to PC.
4. Flash the Chinese modem manually via command line:
```cmd
   fastboot flash radio radio.img
   fastboot reboot
```
