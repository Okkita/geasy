-- Prints all parameters sent, e.g. to know how many arguments are being passed to an event
function Geasy.eventArgs(...)
    local args = {...}
    local amount = select("#", ...)
    local first = select(1, ...)
    echo("Number of arguments: " .. amount)
    echo("\nTable of all arguments: ")
    display(args)
    echo("First argument: " .. first)
    echo("\n\n")
end
