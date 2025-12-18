return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>p",
        function()
          require("telescope.pickers")
            .new({}, {
              prompt_title = "Clipboard History",
              finder = require("telescope.finders").new_oneshot_job({
                "cliphist",
                "list",
              }),
              sorter = require("telescope.config").values.generic_sorter({}),
              attach_mappings = function(prompt_bufnr, map)
                local actions = require("telescope.actions")
                local action_state = require("telescope.actions.state")

                local function paste()
                  local selection = action_state.get_selected_entry()
                  actions.close(prompt_bufnr)
                  if selection then
                    vim.fn.system(
                      "echo "
                        .. vim.fn.shellescape(selection[1])
                        .. " | cliphist decode | wl-copy"
                    )
                    vim.api.nvim_put(
                      vim.split(
                        vim.fn.system("wl-paste --no-newline"),
                        "\n"
                      ),
                      "c",
                      true,
                      true
                    )
                  end
                end

                map("i", "<CR>", paste)
                map("n", "<CR>", paste)
                return true
              end,
            })
            :find()
        end,
        desc = "Paste from clipboard history",
      },
    },
  },
}

