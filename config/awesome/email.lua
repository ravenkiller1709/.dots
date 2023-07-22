local wibox = require("wibox")
local awful = require("awful")
local naughty = require("naughty")
local watch = require("awful.widget.watch")

local path_to_icons = "/usr/share/icons/Arc/actions/16@2x/"

local email_widget = wibox.widget.textbox()
email_widget:set_font("Play 9")

local email_icon = wibox.widget.imagebox()
email_icon:set_image(path_to_icons .. "mail-mark-unread.png")

watch(
    "python /home/kim/.config/awesome/email-widget/count_unread_emails.py", 20,
    function(_, stdout)
        local unread_emails_num = tonumber(stdout) or 0
        if (unread_emails_num > 0) then
            email_icon:set_image(path_to_icons .. "mail-message-new.png")
	    email_widget:set_text(stdout)
        elseif (unread_emails_num == 0) then
            email_icon:set_image(path_to_icons .. "mail-mark-read.png")
            email_widget:set_text("0 beskeder")
        end
    end
)


local function show_emails()
    awful.spawn.easy_async([[bash -c 'python /home/kim/.config/awesome/email-widget/read_unread_emails.py']],
        function(stdout)
            naughty.notify{
                text = stdout,
                title = "Unread Emails",
                timeout = 5, hover_timeout = 0.5,
                width = 400,
            }
        end
    )
end

email_icon:connect_signal("mouse::enter", function() show_emails() end)

return email_widget, email_icon
