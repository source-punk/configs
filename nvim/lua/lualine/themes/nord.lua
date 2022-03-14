local colors = require('nord.colors')

local nord = {}

nord.normal = {
  a = {fg = colors.nord1_gui, bg = colors.nord9_gui},
  b = {fg = colors.nord5_gui, bg = colors.nord2_gui},
  c = {fg = colors.nord4_gui, bg = colors.nord0_gui},
}

nord.insert = {
  a = {fg = colors.nord1_gui, bg = colors.nord14_gui},
  b = {fg = colors.nord1_gui, bg = colors.nord9_gui},
}

nord.command = {
  a = {fg = colors.nord0_gui, bg = colors.nord8_gui},
  b = {fg = colors.nord1_gui, bg = colors.nord9_gui},
}

nord.replace = {
  a = {fg = colors.nord0_gui, bg = colors.nord11_gui},
  b = {fg = colors.nord1_gui, bg = colors.nord9_gui},
}

nord.visual = {
  a = {fg = colors.nord0_gui, bg = colors.nord13_gui, gui = 'bold'},
  b = {fg = colors.nord1_gui, bg = colors.nord9_gui},
}

nord.inactive = {
  a = {fg = colors.nord4_gui, bg = colors.nord1_gui, gui = 'bold'},
  b = {fg = colors.nord4_gui, bg = colors.nord2_gui},
  c = {fg = colors.nord4_gui, bg = colors.nord0_gui}
}

return nord

