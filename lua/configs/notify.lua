local banned_messages = {
  "No signature help available", -- Пример заблокированного сообщения
  "Notify", -- Еще одно сообщение для фильтрации
}

local function on_open()
  -- Если существует последний ID уведомления, то закрываем его
  if vim.g.last_notification_id then
    require("notify").dismiss(vim.g.last_notification_id)
  end
end

local M = {
  "rcarriga/nvim-notify", -- Подключаем плагин nvim-notify
  priority = 99999, -- Высокий приоритет для плагина
  config = function()
    -- Настройка плагина nvim-notify
    require("notify").setup {
      max_width = 90, -- Максимальная ширина уведомлений
      background_colour = "#1e1e1e", -- Цвет фона уведомлений
      timeout = 3500, -- Время отображения уведомлений
      top_down = false, -- Уведомления снизу
      stages = "fade_in_slide_out", -- Эффект появления уведомлений
      on_open = on_open, -- Действия при открытии уведомления
    }

    -- Переопределяем vim.notify для фильтрации сообщений
    vim.notify = function(msg, ...)
      -- Проверяем каждое сообщение на наличие запрещенных фраз
      for _, banned_msg in ipairs(banned_messages) do
        if string.find(msg, banned_msg) then
          return -- Если сообщение заблокировано, не показываем его
        end
      end
      -- Если сообщение не заблокировано, передаем его в nvim-notify
      require "notify"(msg, ...)
    end
  end,
}

return M
