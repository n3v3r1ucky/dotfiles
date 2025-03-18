local wezterm = require 'wezterm'

local config = {}

-- Set the default domain based on the operating system
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  -- On Windows, use the WSL Ubuntu domain
  config.default_domain = 'WSL:Ubuntu'
else
  -- On other systems (Linux/macOS), use the local domain
  config.default_domain = 'local'
end

-- Enable the status bar
config.enable_tab_bar = true
config.status_update_interval = 1000 -- Update every second
config.use_fancy_tab_bar = false

-- Custom status bar
wezterm.on('update-status', function(window, pane)
  -- Get the current time
  local time = wezterm.strftime '%H:%M:%S'

  -- Update the status bar
  window:set_right_status(wezterm.format {
    { Text = ' 󰥔 ' .. time }, -- Add a clock icon (󰥔) before the time
  })
end)

-- Set the leader key to Alt+Shift (using 'a' as a placeholder)
config.leader = { key = 'a', mods = 'ALT|SHIFT' }

-- Key bindings
config.keys = {
  -- Create a new tab with Alt+Shift+w
  {
    key = 'w',
    mods = 'ALT|SHIFT',
    action = wezterm.action.SpawnTab 'DefaultDomain',
  },
    -- Close the current tab with Alt+Shift+k
  {
    key = 'k',
    mods = 'ALT|SHIFT',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
  -- Navigate to the left tab with Alt+Shift+h
  {
    key = 'h',
    mods = 'ALT|SHIFT',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  -- Navigate to the right tab with Alt+Shift+l
  {
    key = 'l',
    mods = 'ALT|SHIFT',
    action = wezterm.action.ActivateTabRelative(1),
  },
}

return config
