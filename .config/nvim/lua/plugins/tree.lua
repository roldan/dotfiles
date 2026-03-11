return {
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        hijack_netrw = true,
        update_focused_file = {
          enable = true,
          update_root = true,
        },
        view = {
          width = 35,
        },
        renderer = {
          icons = {
            show = {
              file = false,
              folder = false,
              folder_arrow = false,
              git = false,
              modified = false,
            },
          },
          indent_markers = {
            enable = true,
          },
        },
        filters = {
          dotfiles = false,
        },
      })

      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function(data)
          local directory = vim.fn.isdirectory(data.file) == 1
          local no_args = vim.fn.argc() == 0

          if directory then
            vim.cmd.cd(data.file)
            require("nvim-tree.api").tree.open()
            vim.cmd("wincmd p")
            return
          end

          if no_args then
            require("nvim-tree.api").tree.open()
            vim.cmd("wincmd p")
          end
        end,
      })

      vim.api.nvim_create_autocmd("BufEnter", {
        nested = true,
        callback = function()
          if vim.fn.winnr("$") ~= 1 then
            return
          end
          local buf = vim.api.nvim_get_current_buf()
          if vim.bo[buf].filetype == "NvimTree" then
            vim.cmd("quit")
          end
        end,
      })

      vim.api.nvim_create_autocmd("QuitPre", {
        callback = function()
          if vim.bo.filetype == "NvimTree" then
            vim.cmd("qa!")
          end
        end,
      })
    end,
  },
}
