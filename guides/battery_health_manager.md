Here’s a ready-to-use `README.md` that documents how to set up battery care and charge thresholds using TLP on a ThinkPad running Ubuntu.

---

````markdown
# 🔋 ThinkPad Battery Care Setup on Ubuntu (TLP)

This guide documents how to configure **battery charge thresholds** to extend battery lifespan on a ThinkPad using **TLP** on Ubuntu. It is particularly useful if you often use your laptop plugged in and want to avoid charging to 100%.

---

## 📦 Prerequisites

Ensure you're on a ThinkPad with battery threshold support via `thinkpad_acpi`.

Check compatibility:
```bash
sudo tlp-stat -b
````

Look for:

```
Driver usage:
* natacpi (thinkpad_acpi) = active (charge thresholds, recalibration)
```

---

## ⚙️ Install TLP

```bash
sudo apt update
sudo apt install tlp
```

Start TLP (if not already active):

```bash
sudo tlp start
```

Enable TLP on boot:

```bash
sudo systemctl enable tlp
```

---

## 🛠️ Configure Battery Charge Thresholds (e.g., 40%–80%)

Edit the TLP config file:

```bash
sudo vim /etc/tlp.conf
```

Uncomment and set the following lines:

```ini
START_CHARGE_THRESH_BAT0=40
STOP_CHARGE_THRESH_BAT0=80
```

Save and exit.

Then restart TLP to apply the config:

```bash
sudo tlp start
```

✅ This will ensure:

* Charging **starts only below 40%**
* Charging **stops automatically at 80%**

---

## 🔄 Manual Override (Optional)

If needed, apply thresholds immediately without reboot:

```bash
sudo tlp setcharge 40 80
```

---

## ✅ Verify Everything

Check current battery thresholds:

```bash
sudo tlp-stat -b
```

Look for output like:

```
/sys/class/power_supply/BAT0/charge_control_start_threshold = 40 [%]
/sys/class/power_supply/BAT0/charge_control_end_threshold   = 80 [%]
```

---

## 🧠 Notes

* `START_CHARGE_THRESH_BAT0` should be less than `STOP_CHARGE_THRESH_BAT0`
* These settings persist across reboots **only** if set in `/etc/tlp.conf`
* This helps prevent battery degradation by avoiding constant 100% charging

---

## 📎 References

* [TLP Documentation](https://linrunner.de/tlp/)
* [ThinkWiki - Battery charge thresholds](https://www.thinkwiki.org/wiki/TLP_-_Linux_Advanced_Power_Management)

```

---

Let me know if you'd like to add automation (e.g., switching to 80–100% when on battery or during travel).
```

