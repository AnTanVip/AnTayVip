local widget = require("widget")

function showNotification(title, description)
    local alertBox = native.showAlert(
        title, 
        description, 
        { "OK" }
    )
end

showNotification("AnTayVip", "Đang Bảo Trì")
