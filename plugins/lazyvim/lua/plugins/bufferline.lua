return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        custom_filter = function(buf_id)
          if vim.bo[buf_id].buflisted == false then
            return true
          end
          return buf_id == vim.api.nvim_get_current_buf()
        end,
        always_show_bufferline = true,
      },
    },
  },
}
