
local mod_name = "Super Mario 74 (+EE)"
local function format_number(number)
    local string = tostring(number)
    if number < 10 then
        string = "0" .. string
    end
    return string
end

local function sm74_layout_page_1()
    layout = {}
    table.insert(layout,{type = "font",font = FONT_HUD})
    for i = COURSE_BOB,COURSE_RR do
        local y =  i
        table.insert(layout,{type = "text",text = format_number(i),x = 0, y = y})
        for s = 0,6 do
            local x = (s+2)
            table.insert(layout,{type = "star",course = i,star_num = s,x = x,y = y})
        end
    end
    return layout
end


local function sm74_layout_page_2()
    local layout = {}
    table.insert(layout,{type = "font",font = FONT_MENU})
    table.insert(layout,{type = "text",text = "Valley of Toads",x = 0, y = 2})
    table.insert(layout,{type = "text",text = "Overworld Stars",x = 0, y = 1})
    table.insert(layout,{type = "font",font = FONT_HUD})
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 0,x = 0,y = 3})
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 1,x = 1,y = 3 })
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 3,x = 2,y = 3 })
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 4,x = 3,y = 3 })
    table.insert(layout,{type = "font",font = FONT_MENU})
    table.insert(layout,{type = "text",text = "Tower of East",x = 0, y = 4})
    table.insert(layout,{type = "font",font = FONT_HUD})
    for s = 0,5 do
        table.insert(layout,{type = "star",course = COURSE_WMOTR,star_num = s,x = s,y = 5 })
    end
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 2,x = 0,y = 7 })
    table.insert(layout,{type = "font",font = FONT_MENU})
    table.insert(layout,{type = "text",text = "Magma Temple",x = 0, y = 6})
    table.insert(layout,{type = "text",text = "Cap Stars",x = 0, y = 8})
    cap_text = {[COURSE_COTMC] = "Metal Cap",[COURSE_TOTWC] = "Wing Cap",[COURSE_VCUTM] = "Vanish Cap"}
    cap_checks = {[COURSE_COTMC] = SAVE_FLAG_HAVE_METAL_CAP,[COURSE_TOTWC] = SAVE_FLAG_HAVE_WING_CAP,[COURSE_VCUTM] = SAVE_FLAG_HAVE_VANISH_CAP}
    cap_colors = {[COURSE_COTMC] = {r = 0, b = 0},[COURSE_TOTWC] = {g = 0, b = 0},[COURSE_VCUTM] = {r = 0, g = 0}}
    cap_stars = {[COURSE_COTMC] = 4,[COURSE_TOTWC] = 2,[COURSE_VCUTM] = 5}
    for i = COURSE_COTMC,COURSE_VCUTM do
        local y = (2*i-31)
        color = nil
        if save_file_get_flags() & cap_checks[i] ~= 0 then
            color = cap_colors[i]
        end
        table.insert(layout,{type = "font",font = FONT_MENU})
        table.insert(layout,{type = "text",text = cap_text[i],x = 0,y = y, color = color})
        table.insert(layout,{type = "font",font = FONT_HUD})
        for s = 0,cap_stars[i] do
            table.insert(layout,{type = "star",course = i,star_num = s,x = s,y = y + 1})
        end
    end
    return layout
end

local function sm74_layout_page_3()
    local layout = {}
    table.insert(layout,{type = "font",font = FONT_MENU})
    table.insert(layout,{type = "text",text = "Bowser Courses",x = 0, y = 1})
    key_checks = {[COURSE_BITDW] = SAVE_FLAG_HAVE_KEY_1 | SAVE_FLAG_UNLOCKED_BASEMENT_DOOR, [COURSE_BITFS] = SAVE_FLAG_HAVE_KEY_2 | SAVE_FLAG_UNLOCKED_UPSTAIRS_DOOR}
    for i = COURSE_BITDW,COURSE_BITS do
        local y =  2 * (i - 15)
        table.insert(layout,{type = "font",font = FONT_MENU})
        color = nil
        if key_checks[i] and save_file_get_flags() & key_checks[i] ~= 0 then
            color = {r = 0,b = 0}
        end
        table.insert(layout,{type = "text",text = "B" .. i-COURSE_BITDW+1,x =  0,y = y, color = color})
        table.insert(layout,{type = "font",font = FONT_HUD})
        for s = 0,(i-13) do
            table.insert(layout,{type = "star",course = i,star_num = s,x = s,y = y + 1})
        end
    end
        table.insert(layout,{type = "font",font = FONT_MENU})
        table.insert(layout,{type = "text",text = "Frozen Slide",x =  0,y = 9})
        table.insert(layout,{type = "font",font = FONT_HUD})
        for s = 0,3 do
            table.insert(layout,{type = "star",course = COURSE_PSS,star_num = s,x = s,y = 10})
        end
        table.insert(layout,{type = "font",font = FONT_MENU})
        table.insert(layout,{type = "text",text = "Champ Challenge",x =  0,y = 11})
        table.insert(layout,{type = "text",text = "151st Star",x =  0,y = 13})
        table.insert(layout,{type = "font",font = FONT_HUD})
        table.insert(layout,{type = "star",course = COURSE_SA,star_num = 0,x = 0,y = 12})
        table.insert(layout,{type = "star",course = COURSE_SA,star_num = 2,x = 0,y = 14})
    return layout
end

local function sm74EE_layout_page_2()
    local layout = {}
    table.insert(layout,{type = "font",font = FONT_MENU})
    table.insert(layout,{type = "text",text = "Overworld Stars",x = 0, y = 1})
    table.insert(layout,{type = "text",text = "Fiery Valley",x = 0, y = 2})
    table.insert(layout,{type = "font",font = FONT_HUD})
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 0,x = 0,y = 3})
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 3,x = 1,y = 3 })
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 4,x = 2,y = 3 })
    table.insert(layout,{type = "font",font = FONT_MENU})
    table.insert(layout,{type = "text",text = "Lake of Lords",x = 0, y = 4})
    table.insert(layout,{type = "font",font = FONT_HUD})
    for s = 0,5 do
        table.insert(layout,{type = "star",course = COURSE_WMOTR,star_num = s,x = s,y = 5 })
    end
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 1,x = 0,y = 7 })
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 2,x = 1,y = 7 })
    table.insert(layout,{type = "font",font = FONT_MENU})
    table.insert(layout,{type = "text",text = "Shadow Temple",x = 0, y = 6})
    table.insert(layout,{type = "text",text = "Cap Stars",x = 0, y = 8})
    cap_text = {[COURSE_COTMC] = "Metal Cap",[COURSE_TOTWC] = "Wing Cap",[COURSE_VCUTM] = "Vanish Cap"}
    cap_checks = {[COURSE_COTMC] = SAVE_FLAG_HAVE_METAL_CAP,[COURSE_TOTWC] = SAVE_FLAG_HAVE_WING_CAP,[COURSE_VCUTM] = SAVE_FLAG_HAVE_VANISH_CAP}
    cap_colors = {[COURSE_COTMC] = {r = 0, b = 0},[COURSE_TOTWC] = {g = 0, b = 0},[COURSE_VCUTM] = {r = 0, g = 0}}
    cap_stars = {[COURSE_COTMC] = 5,[COURSE_TOTWC] = 2,[COURSE_VCUTM] = 5}
    for i = COURSE_COTMC,COURSE_VCUTM do
        local y = (2*i-31)
        color = nil
        if save_file_get_flags() & cap_checks[i] ~= 0 then
            color = cap_colors[i]
        end
        table.insert(layout,{type = "font",font = FONT_MENU})
        table.insert(layout,{type = "text",text = cap_text[i],x = 0,y = y,color = color})
        table.insert(layout,{type = "font",font = FONT_HUD})
        for s = 0,cap_stars[i] do
            table.insert(layout,{type = "star",course = i,star_num = s,x = s,y = y + 1})
        end
    end
    return layout
end

local function sm74EE_layout_page_3()
    local layout = {}
    table.insert(layout,{type = "font",font = FONT_MENU})
    table.insert(layout,{type = "text",text = "Bowser Courses",x = 0, y = 1})
    key_checks = {[COURSE_BITDW] = SAVE_FLAG_HAVE_KEY_1 | SAVE_FLAG_UNLOCKED_BASEMENT_DOOR, [COURSE_BITFS] = SAVE_FLAG_HAVE_KEY_2 | SAVE_FLAG_UNLOCKED_UPSTAIRS_DOOR}
    for i = COURSE_BITDW,COURSE_BITS do
        local y =  2 * (i - 15)
        table.insert(layout,{type = "font",font = FONT_MENU})
        color = nil
        if key_checks[i] and save_file_get_flags() & key_checks[i] ~= 0 then
            color = {r = 0, b = 0}
        end
        table.insert(layout,{type = "text",text = "B" .. i-COURSE_BITDW+1,x =  0,y = y, color = color})
        table.insert(layout,{type = "font",font = FONT_HUD})
        for s = 0,(i-13) do
            table.insert(layout,{type = "star",course = i,star_num = s,x = s,y = y + 1})
        end
    end
    table.insert(layout,{type = "font",font = FONT_MENU})
    table.insert(layout,{type = "text",text = "Supply Slide",x =  0,y = 9})
    table.insert(layout,{type = "font",font = FONT_HUD})
    for s = 0,3 do
        table.insert(layout,{type = "star",course = COURSE_PSS,star_num = s,x = s,y = 10})
    end
    table.insert(layout,{type = "font",font = FONT_MENU})
    table.insert(layout,{type = "text",text = "Triarch Bridge",x =  0,y = 12})
    table.insert(layout,{type = "font",font = FONT_HUD})
    for s = 0,6 do
        table.insert(layout,{type = "star",course = COURSE_SA,star_num = s,x = s,y = 13})
    end
    return layout
end


local pages = {sm74_layout_page_1,sm74_layout_page_2,sm74_layout_page_3}
local pagesEE = {sm74_layout_page_1,sm74EE_layout_page_2,sm74EE_layout_page_3}

local function generate_sm74_layout(pageNum)
    if gNetworkPlayers[0].currAreaIndex ~= 1 then
        return pagesEE[pageNum]()
    else
        return pages[pageNum]()
    end
end

---@diagnostic disable-next-line: undefined-global
if star_check_layouts ~= nil then
    ---@diagnostic disable-next-line: undefined-global
    star_check_layouts[mod_name] = {pages = generate_sm74_layout,page_count = #pages}
end