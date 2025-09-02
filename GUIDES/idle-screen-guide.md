# Configuring Idle Behavior in Sway to Prevent System Suspend

This guide details how to configure a Sway session on an Ubuntu-based system to lock the screen and turn off displays upon inactivity *without* putting the entire system to sleep (suspend). This ensures that background processes continue to run.

---

## The Problem

By default, even with `swayidle` configured, the system may enter a suspend state after a period of inactivity. The typical behavior is:

1.  `swayidle` triggers `swaylock` after a set timeout.
2.  `swayidle` turns off the displays (DPMS off) after another timeout.
3.  A short while later, the entire system suspends, halting all network connections and background tasks.

---

## Root Cause

This behavior is not caused by Sway or `swayidle`. The root cause is the **`systemd-logind`** service, which manages user sessions and has its own idle-action timer. By default, its idle action is to `suspend` the system. `swayidle` correctly handles the screen lock and display power, but `logind` eventually steps in and forces the system to sleep.

---

## The Solution

The solution involves two main steps:
1.  Disabling the idle-timer in `systemd-logind`.
2.  Optimizing the `swayidle` command in the Sway configuration.

### Step 1: Modify `systemd-logind` Configuration

We will instruct `systemd-logind` to ignore inactivity and leave all idle management to `swayidle`.

1.  **Open the configuration file** with root privileges:
    ```bash
    sudo nano /etc/systemd/logind.conf
    ```

2.  **Locate the `IdleAction` setting**. It is usually commented out by default:
    ```ini
    #IdleAction=suspend
    ```

3.  **Uncomment and change the value** to `ignore`. This explicitly tells the service to take no action when the session is idle.
    ```ini
    IdleAction=ignore
    ```

    > **Note:** Setting `IdleAction` to `lock` would also prevent suspension, but `swaylock` is already handling this more gracefully within the Sway session. Using `ignore` is the cleanest approach.

4.  **Save the file and exit** the editor (in `nano`, press `Ctrl+X`, then `Y`, then `Enter`).

5.  **Restart the `systemd-logind` service** to apply the new settings immediately:
    ```bash
    sudo systemctl restart systemd-logind
    ```

### Step 2: Optimize Sway Configuration

With the system no longer suspending automatically, the `before-sleep` hook in your `swayidle` command is now redundant. It's good practice to remove it.

1.  **Edit your Sway config file**:
    ```bash
    nano ~/.config/sway/config
    ```

2.  **Find your `exec swayidle` command** and remove the `before-sleep` line.

    **Before:**
    ```sway
    # Autostart swayidle for automatic sleep/lock
    exec swayidle -w \
        timeout 300 'exec swaylock -f -c 000000' \
        timeout 330 'exec swaymsg "output * dpms off"' \
        resume 'exec swaymsg "output * dpms on"' \
        before-sleep 'exec swaylock -f -c 000000'
    ```

    **After:**
    ```sway
    # Autostart swayidle for automatic lock and screen blanking
    exec swayidle -w \
        timeout 300 'exec swaylock -f -c 000000' \
        timeout 330 'exec swaymsg "output * dpms off"' \
        resume 'exec swaymsg "output * dpms on"'
    ```

3.  **Reload your Sway configuration** for the change to take effect. The default keybinding for this is `$mod+Shift+r`.

---

## Final Result

After following these steps, your system will now behave as intended:
- After 5 minutes (300s) of inactivity, the screen will lock.
- 30 seconds later, the displays will turn off.
- The underlying system and all your background processes will remain active indefinitely.