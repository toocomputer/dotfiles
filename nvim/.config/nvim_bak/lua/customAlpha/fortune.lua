-- fortune printing (from vim-startify)

-- To add this to the footer, simply add the following lines to the config:
-- use {
--     'goolord/alpha-nvim',
--     config = function ()
--         require'alpha.themes.dashboard'.section.footer.val = require'alpha.fortune'()
--         require'alpha'.setup(require'alpha.themes.dashboard'.opts)
--     end
-- }

local list_extend = vim.list_extend

--- @param line string
--- @param max_width number
--- @return table
local format_line = function(line, max_width)
    if line == "" then
        return { " " }
    end

    local formatted_line = {}

    -- split line by spaces into list of words
    local words = {}
    local target = "%S+"
    for word in line:gmatch(target) do
        table.insert(words, word)
    end

    local bufstart = " "
    local buffer = bufstart
    for i, word in ipairs(words) do
        if (#buffer + #word) <= max_width then
            buffer = buffer .. word .. " "
            if i == #words then
                table.insert(formatted_line, buffer:sub(1, -2))
            end
        else
            table.insert(formatted_line, buffer:sub(1, -2))
            buffer = bufstart .. word .. " "
            if i == #words then
                table.insert(formatted_line, buffer:sub(1, -2))
            end
        end
    end
    -- right-justify text if the line begins with -
    if line:sub(1, 1) == "-" then
        for i, val in ipairs(formatted_line) do
            local space = string.rep(" ", max_width - #val - 2)
            formatted_line[i] = space .. val:sub(2, -1)
        end
    end
    return formatted_line
end

--- @param fortune table
--- @param max_width number
--- @return table
local format_fortune = function(fortune, max_width)
    -- Converts list of strings to one formatted string (with linebreaks)
    local formatted_fortune = { " " } -- adds spacing between alpha-menu and footer
    for _, line in ipairs(fortune) do
        local formatted_line = format_line(line, max_width)
        formatted_fortune = list_extend(formatted_fortune, formatted_line)
    end
    return formatted_fortune
end

local get_fortune = function(fortune_list)
    -- selects an entry from fortune_list randomly
    math.randomseed(os.time())
    local ind = math.random(1, #fortune_list)
    return fortune_list[ind]
end

-- Credit to @mhinz for compiling this list in vim-startify
local fortune_list = {
    { "If you don't finish then you're just busy, not productive." },
    { "Fools ignore complexity...Geniuses remove it.", "", "- Alan Perlis" },
    { "Optimization hinders evolution.", "", "- Alan Perlis" },
    {
        "There is nothing quite so useless as doing with great efficiency something that should not be done at all.",
        "",
        "- Peter Drucker",
    },
    { "If you don't fail at least 90% of the time, you're not aiming high enough.", "", "- Alan Kay" },
    { "I would rather die of passion than of boredom.", "", "- Vincent Van Gogh" },
    {
        "The computing scientist's main challenge is not to get confused by the complexities of his own making.",
        "",
        "- Edsger W. Dijkstra",
    },
    {
        "A good programmer is someone who always looks both ways before crossing a one-way street.",
        "",
        "- Doug Linder",
    },
    {
        "Always code as if the person who ends up maintaining your code is a violent psychopath who knows where you live.",
        "",
        "- John Woods",
    },
    {
        "Unix was not designed to stop its users from doing stupid things, as that would also stop them from doing clever things.",
    },
    {
        "Contrary to popular belief, Unix is user friendly. It just happens to be very selective about who it decides to make friends with.",
    },
    { "Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away." },
    { "If you don't make mistakes, you're not working on hard enough problems.", "", "- Frank Wilczek" },
    { "All idioms must be learned. Good idioms only need to be learned once.", "", "- Alan Cooper" },
    { "Use the power of command shells.", "", "Use the shell when graphical user interfaces don't cut it." },
    {
        "Always use source code control.",
        "",
        "Source code control is a time machine for your work - you can go back.",
    },
    { "Don't panic when debugging", "", "Take a deep breath and THINK! about what could be causing the bug." },
    { "Write code that writes code.", "", "Code generators increase your productivity and help avoid duplication." },
    {
        "Always design for concurrency.",
        "",
        "Allow for concurrency, and you'll design cleaner interfaces with fewer assumptions.",
    },
    {
        "Use blackboards to coordinate workflow.",
        "",
        "Use blackboards to coordinate disparate facts and agents, while maintaining independence and isolation among participants.",
    },
    { "Test your software, or your users will.", "", "Test ruthlessly. Don't make your users find bugs for you." },
    {
        "Don't think outside the box - find the box.",
    },
    {
        "Some things are better done than described.",
        "",
        "Don't fall into the specification spiral - at some point you need to start coding.",
    },
    {
        "Don't use manual procedures.",
        "",
        "A shell script or batch file will execute the same instructions, in the same order, time after time.",
    },
    { "Coding ain't done 'til all the Tests run.", "", "'Nuff said." },
    {
        "Test state coverage, not code coverage.",
        "",
        "Identify and test significant program states. Just testing lines of code isn't enough.",
    },
    {
        "Gently exceed your users' expectations.",
        "",
        "Come to understand your users' expectations, then deliver just that little bit more.",
    },
    { "Don't live with broken windows.", "", "Fix bad designs, wrong decisions, and poor code when you see them." },
    {
        "Remember the big picture.",
        "",
        "Don't get so engrossed in the details that you forget to check what's happening around you.",
    },
    { "Invest regularly in your knowledge portfolio.", "", "Make learning a habit." },
    {
        "It's both what you say and the way you say it.",
        "",
        "There's no point in having great ideas if you don't communicate them effectively.",
    },
    {
        "Make it easy to reuse.",
        "",
        "If it's easy to reuse, people will. Create an environment that supports reuse.",
    },
    {
        "There are no final decisions.",
        "",
        "No decision is cast in stone. Instead, consider each as being written in the sand at the beach, and plan for change.",
    },
    {
        "Prototype to learn.",
        "",
        "Prototyping is a learning experience. Its value lies not in the code you produce, but in the lessons you learn.",
    },
    { "Estimate to avoid surprises.", "", "Estimate before you start. You'll spot potential problems up front." },
    {
        "Use a single editor well.",
        "",
        "The editor should be an extension of your hand; make sure your editor is configurable, extensible, and programmable.",
    },
    {
        "You can't write perfect software.",
        "",
        "Software can't be perfect. Protect your code and users from the inevitable errors.",
    },
    {
        "Test early. Test often. Test automatically.",
        "",
        "Tests that run with every build are much more effective than test plans that sit on a shelf.",
    },
    {
        "Find bugs once.",
        "",
        "Once a human tester finds a bug, it should be the last time a human tester finds that bug. Automatic tests should check for it from then on.",
    },
    { "Think twice, code once." },
    { "No matter how far down the wrong road you have gone, turn back now." },
    { "Why do we never have time to do it right, but always have time to do it over?" },
    { "Weeks of programming can save you hours of planning." },
    { "To iterate is human, to recurse divine.", "", "- L. Peter Deutsch" },
    { "Computers are useless. They can only give you answers.", "", "- Pablo Picasso" },
    {
        "The question of whether computers can think is like the question of whether submarines can swim.",
        "",
        "- Edsger W. Dijkstra",
    },
    { "The city's central computer told you? R2D2, you know better than to trust a strange computer!", "", "- C3PO" },
    {
        "Most software today is very much like an Egyptian pyramid with millions of bricks piled on top of each other, with no structural integrity, but just done by brute force and thousands of slaves.",
        "",
        "- Alan Kay",
    },
    { "Controlling complexity is the essence of computer programming.", "", "- Brian Kernighan" },
    { "The function of good software is to make the complex appear to be simple.", "", "- Grady Booch" },
    { 'There are only two industries that refer to their customers as "users".', "", "- Edward Tufte" },
    {
        "Most of you are familiar with the virtues of a programmer. There are three, of course: laziness, impatience, and hubris.",
        "",
        "- Larry Wall",
    },
    { "Optimism is an occupational hazard of programming; feedback is the treatment.", "", "- Kent Beck" },
    { "First, solve the problem. Then, write the code.", "", "- John Johnson" },
    {
        "Measuring programming progress by lines of code is like measuring aircraft building progress by weight.",
        "",
        "- Bill Gates",
    },
    {
        "Don't worry if it doesn't work right. If everything did, you'd be out of a job.",
        "",
        "- Mosher's Law of Software Engineering",
    },
    {
        "Functions delay binding; data structures induce binding. Moral: Structure data late in the programming process.",
        "",
        "- Alan J. Perlis",
    },
    { "Easy things should be easy and hard things should be possible.", "", "- Larry Wall" },
    { "Nothing is more permanent than a temporary solution." },
    {
        "If you can't explain something to a six-year-old, you really don't understand it yourself.",
        "",
        "- Albert Einstein",
    },
    { "Software is hard.", "", "- Donald Knuth" },
    { "They did not know it was impossible, so they did it!", "", "- Mark Twain" },
    {
        "If debugging is the process of removing bugs, then programming must be the process of putting them in.",
        "",
        "- Edsger W. Dijkstra",
    },
    { "640K ought to be enough for anybody.", "", "- Bill Gates, 1981" },
    { "To understand recursion, one must first understand recursion.", "", "- Stephen Hawking" },
    {
        "Developing tolerance for imperfection is the key factor in turning chronic starters into consistent finishers.",
        "",
        "- Jon Acuff",
    },
    {
        "Every great developer you know got there by solving problems they were unqualified to solve until they actually did it.",
        "",
        "- Patrick McKenzie",
    },
    {
        "The average user doesn't give a damn what happens, as long as (1) it works and (2) it's fast.",
        "",
        "- Daniel J. Bernstein",
    },
    {
        "Walking on water and developing software from a specification are easy if both are frozen.",
        "",
        "- Edward V. Berard",
    },
    {
        "Be curious. Read widely. Try new things. I think a lot of what people call intelligence boils down to curiosity.",
        "",
        "- Aaron Swartz",
    },
    { "What one programmer can do in one month, two programmers can do in two months.", "", "- Frederick P. Brooks" },
}

--- @return table
--- @param opts number|table? optional
--- returns an array of strings
local main = function(opts)
    local options = {
        max_width = 54,
        fortune_list = fortune_list,
    }

    if type(opts) == "number" then
        options.max_width = opts
    elseif type(opts) == "table" then
        options = vim.tbl_extend("force", options, opts)
    end

    local fortune = get_fortune(options.fortune_list)
    local formatted_fortune = format_fortune(fortune, options.max_width)

    return formatted_fortune
end

return main
