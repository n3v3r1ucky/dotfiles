
function Color(color)
	color = color or "nord"
	vim.cmd.colorscheme(color)
end

Color()
