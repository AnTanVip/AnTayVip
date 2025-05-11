function showNotification(title, description)
    local alertBox = native.showAlert(
        title, 
        description, 
        { "OK" }
    )

    timer.performWithDelay(60000, function()
        native.cancelAlert(alertBox)
    end)
end

showNotification("AnTayVip", "Đang Bảo Trì")
