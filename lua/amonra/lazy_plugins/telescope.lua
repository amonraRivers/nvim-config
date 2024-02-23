return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function(plugin,opts) 
        
	local builtin=require('telescope.builtin')
	vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
	vim.keymap.set('n', '<leader>f.', function()
	    builtin.find_files({
		find_command = { 'rg', '--files', '--glob', '!.git', '--glob', '.env*', '--hidden' },
	    });
	end, {})
	vim.keymap.set('n', '<leader>fA', function()
	    builtin.find_files({
		find_command = { 'rg', '--files', '--glob', '!.git', '--no-ignore', '--hidden' },
	    });
	end, {})
	vim.keymap.set('n', '<leader>ff', function()
	    builtin.find_files({
		find_command = { 'rg', '--files', '--glob', '!.git', '--glob', '!.ccls-cache', '--hidden' },
	    });
	end, {})
	vim.keymap.set('n', '<C-p>', function()
	    builtin.git_files({});
	end, {})
	vim.keymap.set('n', '<leader>fs', function()
	    builtin.grep_string({ search = vim.fn.input("Grep> ") });
	end, {})
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
	end
    }
