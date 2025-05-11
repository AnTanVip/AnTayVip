function showNotification(title, description)
    local dialog = native.showAlert(title, description, { "OK" })
end

showNotification("AnTayVip", "Đang Bảo Trì")
