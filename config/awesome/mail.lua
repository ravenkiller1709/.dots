local wibox = require("wibox")
local awful = require("awful")
local naughty = require("naughty")

local email_icon = wibox.widget.imagebox()
email_icon:set_image("/email-widget/mail.png")
return email_icon

