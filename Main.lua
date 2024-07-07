local script = [[
function love.load()
    love.window.setTitle("Simple UI Example")
    love.window.setMode(800, 600, {resizable=false, vsync=true})
    love.graphics.setBackgroundColor(0, 0, 0)
    button = {
        x = 350,
        y = 250,
        width = 100,
        height = 50,
        color = {1, 1, 1},
        hoverColor = {0.7, 0.7, 0.7},
        pressedColor = {0.4, 0.4, 0.4},
        isPressed = false
    }
end

function love.update(dt)
    local x, y = love.mouse.getPosition()
    button.isHovered = x > button.x and x < button.x + button.width and y > button.y and y < button.y + button.height
end

function love.mousepressed(x, y, buttonType, istouch, presses)
    if buttonType == 1 and button.isHovered then
        button.isPressed = true
    end
end

function love.mousereleased(x, y, buttonType, istouch, presses)
    if buttonType == 1 and button.isPressed then
        button.isPressed = false
        if button.isHovered then
            button.color = {math.random(), math.random(), math.random()}
        end
    end
end

function love.draw()
    local currentColor = button.color
    if button.isPressed then
        currentColor = button.pressedColor
    elseif button.isHovered then
        currentColor = button.hoverColor
    end
    love.graphics.setColor(currentColor)
    love.graphics.rectangle("fill", button.x, button.y, button.width, button.height)
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf("Click Me", button.x, button.y + (button.height / 4), button.width, "center")
end
]]

loadstring(script)()
