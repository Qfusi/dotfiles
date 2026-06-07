-- Autostart programs

hl.on("hyprland.start", function()
    -- Update D-Bus environment
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    
    -- Shell (Noctalia shell)
    hl.exec_cmd("qs -c noctalia-shell")
    
    -- Polkit
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
end)
