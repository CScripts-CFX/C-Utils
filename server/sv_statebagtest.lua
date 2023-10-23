RegisterCommand('teststatebagsize', function(source, args)
    args[1] = tonumber(args[1]) or 1000
    print("Inserting " .. args[1] .. " test statebags into the server (using wrp_statebags)")
    InsertEntryIntoStateBag(args[1])
end, true)

function InsertEntryIntoStateBag(amount)
    for i = 1, amount do
        local data = {
            one = 1,
            two = 2,
            three = 3,
            four = {
                one = 1,
                two = 2,
                three = 3,
            }
        }
        exports.wrp_statebags:InsertEntryIntoGlobalState("test", "test", i, data)
    end
end