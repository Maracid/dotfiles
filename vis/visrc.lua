require('vis')

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
    vis:command('set number')
    vis:command('set relativenumbers')
    vis:command('set tabwidth 4')
end)
