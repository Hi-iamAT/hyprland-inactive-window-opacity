-- Hyprland Focus Opacity
-- Keeps the active window fully visible while making
-- inactive windows transparent and visually subdued.

decoration = {
    rounding_power = 2.5,
    rounding = 18,


    active_opacity = 1.0,
    inactive_opacity = 0.30, -- change it whatever you want


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