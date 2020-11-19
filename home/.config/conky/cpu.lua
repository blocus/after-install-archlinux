function conky_mycpus()
	local array = {"FFC49B", "D1495B", "6610F2", "C2F970"}
    local file = io.popen("grep -c processor /proc/cpuinfo")
    local numcpus = file:read("*n")
    file:close()
    listcpus = "${color #CFFCFF}CPU: ${cpu cpu0}% ${cpubar cpu0 10,}\n"
    for i = 1,numcpus
     do listcpus = listcpus .. "${color " .. array[i] .. "}${cpugraph cpu" .. tostring(i) .. " 25,64}${color FFFDE2} "
    end
    return listcpus
end


function check_services()
    local f = io.open("./service.lua", "r")
    local lines = lines_from(file)
    tmp = ""
    for k,v in pairs(lines) do
        print('line[' .. k .. ']', v)
    end


end