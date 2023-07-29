
local mod_name = "Super Mario's Jammin Journey"

local function format_number(number)
    local string = tostring(number)
    if number < 10 then
        string = "0" .. string
    end
    return string
end

local function template_layout_page_1()
    layout = {}
    for i = COURSE_BOB,8 do
        table.insert(layout,{type = "font",font = FONT_MENU})
        table.insert(layout,{type = "text",text = format_number(i),x = 0, y = i})
        table.insert(layout,{type = "font",font = FONT_HUD})
        for s = 0,6 do
            table.insert(layout,{type = "star",course = i,star_num = s,x = s+2,y = i})
        end
    end
    table.insert(layout,{type = "font",font = FONT_MENU})
    table.insert(layout,{type = "text",text = "OW1 Reds",y = 10, x = 0})
    table.insert(layout,{type = "text",text = "OW1 Mips",y = 11, x = 0})
    table.insert(layout,{type = "text",text = "OW1 Toad",y = 12, x = 0})
    table.insert(layout,{type = "text",text = "OW2 Toad",y = 13, x = 0})
    table.insert(layout,{type = "text",text = "OW3 Toad",y = 14, x = 0})

    table.insert(layout,{type = "font",font = FONT_HUD})
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 4,x = 6,y = 10})
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 3,x = 6,y = 11})
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 0,x = 6,y = 12})
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 1,x = 6,y = 13})
    table.insert(layout,{type = "star",course = COURSE_NONE,star_num = 2,x = 6,y = 14})
    return layout
end

local function template_layout_page_2()
    layout = {}
    table.insert(layout,{type = "font",font = FONT_MENU})
    table.insert(layout,{type = "text",text = "Bowser Courses",y = 1, x = 0})
    table.insert(layout,{type = "text",text = "B1",y = 2, x = 0})
    table.insert(layout,{type = "text",text = "B2",y = 2, x = 9,right_align = true})
    table.insert(layout,{type = "text",text = "Cap Courses",y = 4, x = 0})
    table.insert(layout,{type = "text",text = "WC",y = 5, x = 0})
    table.insert(layout,{type = "text",text = "MC",y = 6, x = 0})
    table.insert(layout,{type = "text",text = "VC",y = 7, x = 0})
    table.insert(layout,{type = "text",text = "Peach Portrait",y = 9, x = 0})
    table.insert(layout,{type = "text",text = "Crystal Cavern",y = 12, x = 0})
    table.insert(layout,{type = "text",text = "Toad Tunnel",y = 14, x = 0})

    table.insert(layout,{type = "font",font = FONT_HUD})
    table.insert(layout,{type = "star",course = COURSE_BITDW,star_num = 0,x = 2,y = 2})
    table.insert(layout,{type = "star",course = COURSE_BITS,star_num = 0,x = 7,y = 2,right_align = true})
    table.insert(layout,{type = "star",course = COURSE_TOTWC,star_num = 0,x = 2,y = 5})
    table.insert(layout,{type = "star",course = COURSE_COTMC,star_num = 0,x = 2,y = 6})
    table.insert(layout,{type = "star",course = COURSE_VCUTM,star_num = 0,x = 2,y = 7})
    table.insert(layout,{type = "star",course = COURSE_PSS,star_num = 1,x = 0,y = 10})
    table.insert(layout,{type = "star",course = COURSE_PSS,star_num = 2,x = 1,y = 10})
    table.insert(layout,{type = "star",course = COURSE_WMOTR,star_num = 0,x = 0,y = 13})
    table.insert(layout,{type = "star",course = COURSE_SA,star_num = 0,x = 0,y = 15})

    icon = "key_uncollected"
    if save_file_get_flags() & (SAVE_FLAG_HAVE_KEY_1 | SAVE_FLAG_UNLOCKED_BASEMENT_DOOR) ~= 0 then
        icon = "key_collected"
    end
    table.insert(layout,{type = "texture",texture = icon,x = 3,y = 2})

    icon = "key_uncollected"
    if save_file_get_flags() & (SAVE_FLAG_HAVE_KEY_2 | SAVE_FLAG_UNLOCKED_UPSTAIRS_DOOR) ~= 0 then
        icon = "key_collected"
    end
    table.insert(layout,{type = "texture",texture = icon,x = 6,y = 2,right_align=true})

    icon = "red_switch_unpressed"
    if save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0 then
        icon = "red_switch_pressed"
    end
    table.insert(layout,{type = "texture",texture = icon,x = 3,y = 5})

    icon = "green_switch_unpressed"
    if save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0 then
        icon = "green_switch_pressed"
    end
    table.insert(layout,{type = "texture",texture = icon,x = 3,y = 6})

    icon = "blue_switch_unpressed"
    if save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0 then
        icon = "blue_switch_pressed"
    end
    table.insert(layout,{type = "texture",texture = icon,x = 3,y = 7})

    return layout
end
local pages = {template_layout_page_1,template_layout_page_2}

local function generate_template_layout(pageNum)
    return pages[pageNum]()
end

---@diagnostic disable-next-line: undefined-global
if star_check_layouts ~= nil and mod_name ~= "template" then
    ---@diagnostic disable-next-line: undefined-global
    star_check_layouts[mod_name] = {pages = generate_template_layout,page_count = #pages}
end