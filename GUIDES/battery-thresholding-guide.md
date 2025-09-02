Of course. Here is the complete guide formatted as a single, copy-pastable Markdown file.

````markdown
# How to Set Battery Charge Limits on Linux (Ubuntu/Debian)

**Author:** Gemini Assistant
**Last Updated:** September 2, 2025
**Purpose:** A guide for setting up battery charge thresholds on a new Linux laptop to improve long-term battery health.

---

## Table of Contents
1.  [Why Set a Charge Limit?](#why-set-a-charge-limit)
2.  [Prerequisites](#prerequisites)
3.  [Method 1: The Recommended Permanent Solution (TLP)](#method-1-the-recommended-permanent-solution-tlp)
    * [Step 1: Install TLP](#step-1-install-tlp)
    * [Step 2: Configure the Charge Thresholds](#step-2-configure-the-charge-thresholds)
    * [Step 3: Apply and Verify the Settings](#step-3-apply-and-verify-the-settings)
4.  [Method 2: Manual Override & Diagnostics (`/sysfs`)](#method-2-manual-override--diagnostics-sysfs)
    * [When to Use This Method](#when-to-use-this-method)
    * [Step 1: Find the Battery Control File](#step-1-find-the-battery-control-file)
    * [Step 2: Check the Current Limit](#step-2-check-the-current-limit)
    * [Step 3: Manually Set a New Limit](#step-3-manually-set-a-new-limit)
5.  [Common Scenarios & Troubleshooting](#common-scenarios--troubleshooting)

---

## Why Set a Charge Limit?

Keeping a Lithium-ion battery perpetually at 100% charge can accelerate its degradation. Limiting the maximum charge to around 80% can significantly extend its overall lifespan. This guide details how to configure this on a Linux system.

## Prerequisites

* An Ubuntu-based or Debian-based Linux distribution.
* Access to a terminal.
* `sudo` (administrator) privileges.

## Method 1: The Recommended Permanent Solution (TLP)

**TLP** is a powerful and feature-rich utility for optimizing battery life. It's the best way to set and forget your charging thresholds.

### Step 1: Install TLP

Open your terminal and install TLP and the Radio Device Wizard (`tlp-rdw`), which is recommended for full functionality.

```bash
sudo apt update
sudo apt install tlp tlp-rdw
````

### Step 2: Configure the Charge Thresholds

1.  Open the TLP configuration file in a text editor like `nano`:

    ```bash
    sudo nano /etc/tlp.conf
    ```

2.  Search for the lines `START_CHARGE_THRESH_BAT0` and `STOP_CHARGE_THRESH_BAT0`. You can use `Ctrl + W` in nano to search.

3.  Uncomment the lines (remove the `#` at the beginning) and set your desired values. A 75%-80% window is a common and effective choice.

    **Example Configuration:**

    ```ini
    # Battery charge thresholds (BAT0).
    # Main battery, replace BAT0 with BAT1 for secondary battery if needed.

    # Start charging when battery level is below 75%
    START_CHARGE_THRESH_BAT0=75

    # Stop charging when battery level reaches 80%
    STOP_CHARGE_THRESH_BAT0=80
    ```

4.  Save the file and exit (`Ctrl + X`, then `Y`, then `Enter`).

### Step 3: Apply and Verify the Settings

For the changes to take effect, start the TLP service.

```bash
sudo tlp start
```

You can verify that the thresholds are correctly applied by running a battery status check:

```bash
sudo tlp-stat -b
```

Look for the `Charge thresholds` section in the output. It should show your configured start and stop values.

✅ **Done\!** TLP will now automatically manage your battery charging according to these rules, even after a reboot.

-----

## Method 2: Manual Override & Diagnostics (`/sysfs`)

This method writes directly to the kernel's power supply control files. It's useful for troubleshooting or for temporarily changing the limit without modifying your TLP configuration.

⚠️ **Note:** Changes made this way are **not permanent** and will be reset upon reboot or when TLP re-applies its settings.

### When to Use This Method

  * To check what charge limit is *currently* active at the system level.
  * To temporarily charge to 100% for a specific reason (e.g., a long trip).
  * If TLP is not working or not installed.

### Step 1: Find the Battery Control File

The control file is located in `/sys/class/power_supply/`. It's usually `BAT0` for the main battery.

```bash
ls /sys/class/power_supply/BAT0/
```

Look for a file named `charge_control_end_threshold` or `charge_stop_threshold`.

### Step 2: Check the Current Limit

Use the `cat` command to read the value in the file. This will tell you the current maximum charge percentage.

```bash
cat /sys/class/power_supply/BAT0/charge_control_end_threshold
```

*(Replace the filename if yours is different)*

### Step 3: Manually Set a New Limit

Use `echo` and `tee` to write a new value to the file. You need `tee` because you can't write to these protected files with standard `sudo` redirection.

**Example 1: Temporarily charge to 100%**

```bash
echo 100 | sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold
```

**Example 2: Temporarily set the limit to 85%**

```bash
echo 85 | sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold
```

The laptop will immediately begin adhering to the new limit.

-----

## Common Scenarios & Troubleshooting

  * **"I set the TLP config, but my laptop still charges to 100%."**

      * Did you uncomment the lines in `/etc/tlp.conf` (remove the `#`)?
      * Did you run `sudo tlp start` to apply the changes?
      * Does your laptop hardware support this feature? Check with `sudo tlp-stat -b`. If it says "not supported," you won't be able to set thresholds.

  * **"I want to charge to 100% just this one time."**

      * Use Method 2: `echo 100 | sudo tee ...`. Your TLP settings will automatically restore the 80% limit on the next reboot.

  * **"My laptop has two batteries."**

      * TLP supports this. In `/etc/tlp.conf`, you will see sections for `BAT1`. Simply configure the `START_CHARGE_THRESH_BAT1` and `STOP_CHARGE_THRESH_BAT1` variables as well.

  * **"The `charge_control_end_threshold` file does not exist."**

      * Unfortunately, this means your laptop's firmware/kernel driver does not expose this functionality. You will not be able to set a charge limit.

<!-- end list -->

```
```