local dap = require("dap")
dap.set_log_level('TRACE')

local function get_python_path()
    local python_bin = "python3"
    local path = vim.fn.getcwd()
    local python_path = path .. "/.venv/bin/" .. python_bin
    if vim.fn.executable(python_path) == 1 then
        return python_path
    end
    return python_bin

end

local set_python_dap = function()
    require('dap-python').setup(get_python_path()) -- earlier, so I can setup the various defaults ready to be replaced
    require('dap-python').resolve_python = function()
        return get_python_path()
    end
    dap.configurations.python = {
        {
            type = 'python';
            request = 'launch';
            name = "Launch file";
            program = "${file}";
            pythonPath = get_python_path()
        },
        {
            type = 'debugpy',
            request = 'launch',
            name = 'Django',
            program = '${workspaceFolder}/manage.py',
            args = {
                'runserver',
            },
            justMyCode = true,
            django = true,
            console = "integratedTerminal",
            pythonPath = get_python_path()
        },
        {
            type = 'python';
            request = 'attach';
            name = 'Attach remote';
            connect = function()
                return {
                    host = 'localhost',
                    port = 5678
                }
            end;
        },
        {
            type = 'python';
            request = 'launch';
            name = 'Launch file with arguments';
            program = '${file}';
            args = function()
                local args_string = vim.fn.input('Arguments: ')
                return vim.split(args_string, " +")
            end;
            console = "integratedTerminal",
            pythonPath = get_python_path()
        }
    }

    dap.adapters.python = {
        type = 'executable',
        command = get_python_path(),
        args = {'-m', 'debugpy.adapter'}
    }
end

local setup_dap_go = function()
    require('dap-go').setup()
end

setup_dap_go()
set_python_dap()
vim.api.nvim_create_autocmd({"DirChanged", "BufEnter"}, {
    callback = function() set_python_dap() end,
})
