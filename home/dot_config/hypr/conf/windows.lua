-- Window Configuration

local colors = require("conf.noctalia")

hl.config({
    general = {
        gaps_in = 10,
        gaps_out = 20,
        border_size = 1,
        col = {
            active_border = colors.primary,
            inactive_border = colors.surface,
        },
        layout = "dwindle",
        resize_on_border = true,
    },
})
