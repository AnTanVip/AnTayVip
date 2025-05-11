local topbar = require("topbar")

function showNotification(title, description)
    topbar.show({
        title = title,
        description = description,
        duration = 60000 -- 1 minute
    })
end

showNotification("AnTayVip", "Đang Bảo Trì")
