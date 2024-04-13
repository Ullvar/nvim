function Ullvar_String_Split(s, delimiter)
    local arr = {}
    local i = 0
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
	arr[i] = match
	i = i + 1
    end
    return arr;
end

function Open_File_In_Github()
	local gitOutput = vim.fn.system("git config --get remote.origin.url 2> /dev/null | tr -d '\n'")
 	local gitOutputClean = gitOutput:gsub("%.git", "")
	local relPath = vim.api.nvim_buf_get_name(0)

	local arr = Ullvar_String_Split(relPath, '/')
	local repoReplaced = string.gsub(arr[4], "%-", "")

	local relPath = string.gsub(relPath, "/Users", "")
	local relPath = string.gsub(relPath, "/ullvarbrekke", "")
	local relPath = string.gsub(relPath, "/Projects", "")
	local relPath = string.gsub(relPath, "%-", "")
	local relPath = string.gsub(relPath, "/" .. repoReplaced, "") 

	local cmd = "!open " .. gitOutputClean .. "/blob/main" .. relPath
	vim.cmd(cmd)
end