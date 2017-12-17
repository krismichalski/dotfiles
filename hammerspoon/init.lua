-- Press Cmd+Q twice to quit

local quitModal = hs.hotkey.modal.new('cmd','q')

function quitModal:entered()
    hs.alert.show("Press Cmd+Q again to quit", 1)
    hs.timer.doAfter(1, function() quitModal:exit() end)
end

local function doQuit()
    local res = hs.application.frontmostApplication():selectMenuItem("^(Quit|退出).*$")
    quitModal:exit()
end

quitModal:bind('cmd', 'q', doQuit)
quitModal:bind('', 'escape', function() quitModal:exit() end)

-- local FRemap = require('foundation_remapping')
-- local remapper = FRemap.new()
-- remapper:remap(0x32, 'lshift')
-- remapper:remap(0x39, 0x35)
-- remapper:register()
