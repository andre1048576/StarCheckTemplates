
local mod_name = "Super Mario Rainbow Road"

local function format_number(number)
    local string = tostring(number)
    if number < 10 then
        string = "0" .. string
    end
    return string
end

local function rainbow_road_layout_page_1()
    layout = {}
    table.insert(layout,{type = "font",font = FONT_HUD})
    for i = COURSE_BOB,COURSE_LLL do
        table.insert(layout,{type = "text",text = format_number(i),x = 0, y = i})
        for s = 0,6 do
            table.insert(layout,{type = "star",course = i,star_num = s,x = s+2,y = i})
        end
    end
    return layout
end

local function rainbow_road_layout_page_2()
    layout = {}
    cap_text = {[COURSE_COTMC] = "MC",[COURSE_TOTWC] = "WC",[COURSE_VCUTM] = "VC"}
    cap_checks = {[COURSE_COTMC] = SAVE_FLAG_HAVE_METAL_CAP,[COURSE_TOTWC] = SAVE_FLAG_HAVE_WING_CAP,[COURSE_VCUTM] = SAVE_FLAG_HAVE_VANISH_CAP}
    cap_colors = {[COURSE_COTMC] = {type = "color", r = 0, g = 255, b = 0, a = 255},[COURSE_TOTWC] = {type = "color", r = 255, g = 0, b = 0, a = 255},[COURSE_VCUTM] = {type = "color", r = 0, g = 0, b = 255, a = 255}}
    for i = COURSE_COTMC, COURSE_VCUTM do
        local y = 2
        local x =  3*(i-COURSE_COTMC) 
        if save_file_get_flags() & cap_checks[i] ~= 0 then
            table.insert(layout,cap_colors[i])
        else
            table.insert(layout,{type = "color",r = 255, g = 255,b = 255, a = 255})
        end
        table.insert(layout,{type = "font",font = FONT_MENU})
        table.insert(layout,{type = "text",text = cap_text[i],x = x,y = y})
        table.insert(layout,{type = "font",font = FONT_HUD})
        table.insert(layout,{type = "color",r = 255, g = 255,b = 255, a = 255})
        table.insert(layout,{type = "star",course = i,star_num = 0,x = x,y = y + 1})
    end
    if save_file_get_flags() & (SAVE_FLAG_HAVE_KEY_1 | SAVE_FLAG_UNLOCKED_BASEMENT_DOOR) ~= 0 then
        table.insert(layout,{type = "color",r = 0, g = 255,b = 0, a = 255})
    end
    table.insert(layout,{type = "font",font = FONT_MENU})
    table.insert(layout,{type = "text",text = "Fiery Fortress",x = 0,y = 4})
    table.insert(layout,{type = "color",r = 255, g = 255,b = 255, a = 255})
    table.insert(layout,{type = "text",text = "Cap Courses",x = 0,y = 1})
    y_end = 6
    if (save_file_get_total_star_count(get_current_save_file_num() - 1,0,26)) >= 54 then
        y_end = y_end + 2
        if (save_file_get_star_flags(get_current_save_file_num() - 1, COURSE_SA - 1) > 0) then
            table.insert(layout,{type = "color",r = 0, g = 255,b = 0, a = 255})
        end
        table.insert(layout,{type = "text",text = "Galaxy Palace",x = 0,y = 6})
        table.insert(layout,{type = "color",r = 255, g = 255,b = 255, a = 255})
        table.insert(layout,{type = "star",course = COURSE_BITS,star_num = 0,x = 0,y = 7})
        table.insert(layout,{type = "star",course = COURSE_PSS,star_num = 0,x = 1,y = 7})
        table.insert(layout,{type = "star",course = COURSE_BITDW,star_num = 1,x = 1,y = 5})
        table.insert(layout,{type = "star",course = COURSE_COTMC,star_num = 1,x = 1,y = 3})
        table.insert(layout,{type = "star",course = COURSE_TOTWC,star_num = 1,x = 4,y = 3})
        table.insert(layout,{type = "star",course = COURSE_VCUTM,star_num = 1,x = 7,y = 3})
    end
    
    table.insert(layout,{type = "text",text = "End",x = 0,y = y_end})
    table.insert(layout,{type = "font",font = FONT_HUD})
    table.insert(layout,{type = "star",course = COURSE_BITDW,star_num = 0,x = 0,y = 5})
    table.insert(layout,{type = "star",course = COURSE_SA,star_num = 0,x = 0,y = y_end + 1})
    return layout
end

local pages = {rainbow_road_layout_page_1,rainbow_road_layout_page_2}

local function generate_rainbow_road_layout(pageNum)
    return pages[pageNum]()
end

---@diagnostic disable-next-line: undefined-global
if star_check_layouts ~= nil then
    ---@diagnostic disable-next-line: undefined-global
    star_check_layouts[mod_name] = {pages = generate_rainbow_road_layout,page_count = #pages}
end