# Hyprland Inactive Window Opacity

A simple, lightweight Hyprland configuration snippet that makes the currently focused window fully opaque while reducing the opacity of inactive windows.

This creates a clear visual distinction between the window you are currently working with and other open windows.

---

## Features

* Fully opaque active window
* Customizable inactive-window opacity
* Optional inactive-window dimming
* Compatible with Hyprland's `decoration` configuration
* Works with both traditional Hyprland configuration and Lua-based configurations
* No external plugin required
* No additional application required

---

# 1. How It Works

Hyprland provides window appearance settings through its `decoration` configuration.

The two most important settings for this project are:

```lua
active_opacity = 1.0,
inactive_opacity = 0.30,
```

They control the opacity of focused and unfocused windows.

### Active Window

```lua
active_opacity = 1.0,
```

`1.0` means 100% opacity.

The currently focused window remains completely opaque.

### Inactive Windows

```lua
inactive_opacity = 0.30,
```

`0.30` means 30% opacity.

Windows that are not currently focused become transparent.

When you switch focus to another window, Hyprland automatically changes which window is active.

---

# 2. Opacity Values

Opacity is represented as a decimal value between `0.0` and `1.0`.

| Value | Percentage | Appearance                |
| ----- | ---------: | ------------------------- |
| `1.0` |       100% | Fully opaque              |
| `0.9` |        90% | Very slightly transparent |
| `0.8` |        80% | Slightly transparent      |
| `0.7` |        70% | Noticeably transparent    |
| `0.6` |        60% | More transparent          |
| `0.5` |        50% | Medium transparency       |
| `0.4` |        40% | Strong transparency       |
| `0.3` |        30% | Very transparent          |
| `0.2` |        20% | Highly transparent        |
| `0.1` |        10% | Almost invisible          |
| `0.0` |         0% | Completely transparent    |

For example:

### 30% opacity

```lua
inactive_opacity = 0.30,
```

### 40% opacity

```lua
inactive_opacity = 0.40,
```

### 50% opacity

```lua
inactive_opacity = 0.50,
```

### 70% opacity

```lua
inactive_opacity = 0.70,
```

### 80% opacity

```lua
inactive_opacity = 0.80,
```

You can use decimal values between `0.0` and `1.0`, such as:

```lua
inactive_opacity = 0.35,
```

or:

```lua
inactive_opacity = 0.45,
```

---

# 3. What Is `decoration.lua`?

This project contains:

```text
config/decoration.lua
```

This is a **Lua configuration snippet**.

It is not a separate program and it does not need to be executed.

The `.lua` extension means the file contains Lua syntax.

For example:

```lua
active_opacity = 1.0,
inactive_opacity = 0.30,
```

Hyprland itself normally uses configuration syntax such as:

```text
hyprland.conf
```

However, many Hyprland setups use Lua-based configuration frameworks or custom Lua loaders.

If your Hyprland setup uses Lua configuration, you can place the relevant configuration directly into your existing Lua configuration.

---

# 4. Important: Do Not Run `decoration.lua`

You do **not** normally run:

```bash
lua config/decoration.lua
```

and you do not execute it like a shell script.

Instead, the settings from this file should be incorporated into the active Hyprland configuration.

Think of `decoration.lua` as a reusable configuration snippet.

---

# 5. Find Your Hyprland Configuration

Before changing anything, determine where your actual Hyprland configuration is located.

A common installation uses:

```text
~/.config/hypr/hyprland.conf
```

Check whether it exists:

```bash
ls ~/.config/hypr/
```

If you see:

```text
hyprland.conf
```

you may be using the traditional Hyprland configuration format.

---

# 6. Lua-Based Hyprland Configurations

Some users use a Lua-based configuration system instead.

For example, your configuration might contain:

```text
~/.config/hypr/hyprland.lua
```

and additional files such as:

```text
~/.config/hypr/hyprland/
├── general.lua
├── variables.lua
├── keybinds.lua
├── rules.lua
└── execs.lua
```

In this situation, the actual `decoration` configuration may be inside:

```text
general.lua
```

For example:

```lua
decoration = {
    ...
}
```

If this is your setup, add the opacity settings **inside the existing `decoration` block**.

---

# 7. Review Your Existing Configuration

Before making changes, always inspect the configuration.

For a traditional configuration:

```bash
cat ~/.config/hypr/hyprland.conf
```

For a Lua-based configuration:

```bash
cat ~/.config/hypr/hyprland.lua
```

To inspect a specific Lua file:

```bash
cat ~/.config/hypr/hyprland/general.lua
```

For a more convenient viewer:

```bash
less ~/.config/hypr/hyprland/general.lua
```

You can also inspect a specific section:

```bash
sed -n '60,120p' ~/.config/hypr/hyprland/general.lua
```

---

# 8. Find the `decoration` Section

If you do not know where the decoration configuration is located, search for it.

For example:

```bash
grep -Rni "decoration" ~/.config/hypr/
```

You can also search specifically for opacity:

```bash
grep -Rni "active_opacity\|inactive_opacity" ~/.config/hypr/
```

This is useful because different Hyprland configurations organize their files differently.

---

# 9. Add the Opacity Settings

Find your existing:

```lua
decoration = {
```

section.

Add:

```lua
active_opacity = 1.0,
inactive_opacity = 0.30,
```

For example:

```lua
decoration = {
    rounding = 18,

    active_opacity = 1.0,
    inactive_opacity = 0.30,

    -- other decoration settings
}
```

Do not create a second `decoration` block if your configuration already has one.

Instead, add the settings to the existing block.

---

# 10. Optional: Inactive Window Dimming

Hyprland also supports inactive-window dimming.

You can enable it with:

```lua
dim_inactive = true,
dim_strength = 0.40,
```

For example:

```lua
decoration = {
    active_opacity = 1.0,
    inactive_opacity = 0.30,

    dim_inactive = true,
    dim_strength = 0.40,
}
```

### `dim_inactive`

```lua
dim_inactive = true,
```

enables additional dimming for inactive windows.

### `dim_strength`

```lua
dim_strength = 0.40,
```

controls the strength of that dimming.

If you do not want additional dimming, use:

```lua
dim_inactive = false,
```

or remove the setting if your existing configuration does not use it.

---

# 11. Optional Blur Configuration

The project also contains a blur configuration:

```lua
blur = {
    enabled = true,
    xray = true,
    special = false,
    new_optimizations = true,
    size = 10,
    passes = 3,
    brightness = 1,
    noise = 0.05,
    contrast = 0.89,
    vibrancy = 0.5,
    vibrancy_darkness = 0.5,
    popups = false,
    popups_ignorealpha = 0.6,
    input_methods = true,
    input_methods_ignorealpha = 0.8
},
```

Blur is **not required** for inactive-window opacity.

If you only want inactive windows to become transparent, the essential configuration is:

```lua
active_opacity = 1.0,
inactive_opacity = 0.30,
```

The blur settings control Hyprland's background/transparency blur behavior and are separate from the inactive-window opacity setting.

---

# 12. Optional Rounded Corners and Shadows

The example configuration also includes rounded corners:

```lua
rounding_power = 2.5,
rounding = 18,
```

and shadows:

```lua
shadow = {
    enabled = true,
    range = 20,
    offset = {0, 2},
    render_power = 10,
    color = "rgba(00000020)"
},
```

These are visual enhancements and are not required for inactive-window opacity.

You can remove them if you only want the opacity behavior.

---

# 13. Minimal Configuration

If you want only the functionality provided by this project, use:

```lua
decoration = {
    active_opacity = 1.0,
    inactive_opacity = 0.30,
}
```

This is the simplest implementation.

---

# 14. Full Example Configuration

If you want the complete visual setup used by this project:

```lua
decoration = {
    rounding_power = 2.5,
    rounding = 18,

    active_opacity = 1.0,
    inactive_opacity = 0.30,

    blur = {
        enabled = true,
        xray = true,
        special = false,
        new_optimizations = true,
        size = 10,
        passes = 3,
        brightness = 1,
        noise = 0.05,
        contrast = 0.89,
        vibrancy = 0.5,
        vibrancy_darkness = 0.5,
        popups = false,
        popups_ignorealpha = 0.6,
        input_methods = true,
        input_methods_ignorealpha = 0.8
    },

    shadow = {
        enabled = true,
        range = 20,
        offset = {0, 2},
        render_power = 10,
        color = "rgba(00000020)"
    },

    dim_inactive = true,
    dim_strength = 0.40,
    dim_special = 0.2
}
```

---

# 15. Reload Hyprland

After modifying your configuration, reload Hyprland:

```bash
hyprctl reload
```

If the configuration is valid, Hyprland should reload without restarting your session.

---

# 16. Verify the Configuration

You can verify the opacity values using:

```bash
hyprctl getoption decoration:active_opacity
```

and:

```bash
hyprctl getoption decoration:inactive_opacity
```

You should see the configured values.

For example:

```text
1.00000
```

for active opacity and:

```text
0.30000
```

for inactive opacity.

You can also check dimming:

```bash
hyprctl getoption decoration:dim_inactive
```

and:

```bash
hyprctl getoption decoration:dim_strength
```

---

# 17. Testing Different Opacity Levels

You do not need to permanently edit the configuration just to experiment.

Change:

```lua
inactive_opacity = 0.30,
```

to another value.

For example:

```lua
inactive_opacity = 0.40,
```

Then reload:

```bash
hyprctl reload
```

Test the appearance.

Repeat with:

```lua
inactive_opacity = 0.50,
```

or:

```lua
inactive_opacity = 0.70,
```

until you find the opacity you prefer.

---

# 18. Recommended Values

There is no universally correct opacity value.

A useful starting point is:

```lua
inactive_opacity = 0.80,
```

for a subtle effect.

Use:

```lua
inactive_opacity = 0.60,
```

for a more noticeable effect.

Use:

```lua
inactive_opacity = 0.40,
```

for strong transparency.

Use:

```lua
inactive_opacity = 0.30,
```

for a very noticeable inactive-window effect.

---

# 19. Troubleshooting

## Configuration does not change

First reload Hyprland:

```bash
hyprctl reload
```

Then verify the value:

```bash
hyprctl getoption decoration:inactive_opacity
```

If the value is not what you configured, you may be editing the wrong configuration file.

---

## Find where the setting is defined

Run:

```bash
grep -Rni "inactive_opacity" ~/.config/hypr/
```

This shows every file containing the setting.

Also check:

```bash
grep -Rni "active_opacity" ~/.config/hypr/
```

Multiple definitions may exist in a modular configuration.

---

## Hyprland reports a configuration error

Run:

```bash
hyprctl reload
```

If there is a syntax problem, Hyprland will report the relevant error.

For Lua-based configurations, also inspect the file around the `decoration` block:

```bash
sed -n '1,150p' ~/.config/hypr/hyprland/general.lua
```

Make sure commas, braces, and other Lua syntax are correct.

---

# 20. Back Up Your Configuration

Before making changes, create a backup.

For example:

```bash
cp ~/.config/hypr/hyprland/general.lua \
   ~/.config/hypr/hyprland/general.lua.backup
```

If something goes wrong, restore it with:

```bash
cp ~/.config/hypr/hyprland/general.lua.backup \
   ~/.config/hypr/hyprland/general.lua
```

Then reload:

```bash
hyprctl reload
```

---

# 21. Important Notes

### Opacity is not blur

This project primarily changes:

```lua
inactive_opacity
```

It does not turn the contents of inactive windows into a blurred image.

Hyprland's built-in `blur` configuration controls background/transparency blur behavior.

### Opacity is automatic

You do not need scripts or keybindings to switch opacity.

Hyprland automatically determines which window is active.

For example:

```text
Focus Firefox
    ↓
Firefox = active_opacity
Terminal = inactive_opacity

Focus Terminal
    ↓
Terminal = active_opacity
Firefox = inactive_opacity
```

### No external plugin is required

The basic opacity configuration uses Hyprland's built-in functionality.

---

# 22. Configuration Summary

The essential configuration is:

```lua
active_opacity = 1.0,
inactive_opacity = 0.30,
```

Optional dimming:

```lua
dim_inactive = true,
dim_strength = 0.40,
```

Optional visual enhancements:

```lua
rounding_power = 2.5,
rounding = 18,
```

and:

```lua
blur = {
    enabled = true,
    ...
}
```

and:

```lua
shadow = {
    enabled = true,
    ...
}
```

You can use only the settings you need.

---

# 23. Quick Start

For experienced Hyprland users, the entire setup can be reduced to:

### Add:

```lua
active_opacity = 1.0,
inactive_opacity = 0.30,
```

inside the existing `decoration` block.

### Reload:

```bash
hyprctl reload
```

### Verify:

```bash
hyprctl getoption decoration:active_opacity
hyprctl getoption decoration:inactive_opacity
```

That's all that is required.

---

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for the complete license text.
