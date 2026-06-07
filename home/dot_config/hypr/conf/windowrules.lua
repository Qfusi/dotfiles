-- Window Rules Configuration

-- Pavucontrol
hl.window_rule({
    name = "pavucontrol",
    match = { class = ".*org.pulseaudio.pavucontrol.*" },
    float = true,
    center = true,
    pin = true,
    size = { 700, 600 },
})

-- Waypaper
hl.window_rule({
    name = "waypaper",
    match = { class = ".*waypaper.*" },
    float = true,
    center = true,
    pin = true,
    size = { 900, 700 },
})

-- Newelle
hl.window_rule({
    name = "newelle",
    match = { class = "io.github.qwersyk.Newelle" },
    float = true,
    center = true,
    pin = true,
    size = { 1000, 700 },
})

-- Blueman Manager
hl.window_rule({
    name = "blueman-manager",
    match = { class = "blueman-manager" },
    float = true,
    center = true,
    size = { 800, 600 },
})

-- nwg-look
hl.window_rule({
    name = "nwg-look",
    match = { class = "nwg-look" },
    float = true,
    center = true,
    size = { 700, 600 },
})

-- nwg-displays
hl.window_rule({
    name = "nwg-displays",
    match = { class = "nwg-displays" },
    float = true,
    center = true,
    size = { 900, 600 },
})

-- System Mission Center
hl.window_rule({
    name = "missioncenter",
    match = { class = "io.missioncenter.MissionCenter" },
    float = true,
    center = true,
    pin = true,
    size = { 900, 600 },
})

-- Gnome Calculator
hl.window_rule({
    name = "gnome-calculator",
    match = { class = "org.gnome.Calculator" },
    float = true,
    center = true,
    size = { 700, 600 },
})
