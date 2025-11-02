return{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
        local npairs = require("nvim-autopairs")
        local Rule = require('nvim-autopairs.rule')
        local cond = require('nvim-autopairs.conds')
        local ts_conds = require('nvim-autopairs.ts-conds')
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')

        npairs.setup({
            check_ts = true,
            ts_config = {
                lua = {'string'},-- it will not add a pair on that treesitter node
                javascript = {'template_string'},
                java = false,-- don't check treesitter on java
            },
            fast_wrap = {
                map = '<M-e>',
                chars = { '{', '[', '(', '"', "'", '<' },
                pattern = [=[[%'%"%>%]%)%}%,]]=],
                end_key = '$',
                before_key = 'h',
                after_key = 'l',
                cursor_pos_before = true,
                keys = 'qwertyuiopzxcvbnmasdfghjkl',
                manual_position = true,
                highlight = 'Search',
                highlight_grey='Comment'
            },
            disable_filetype = {
                "TelescopePrompt" , "vim"
            },
        })

        -- press % => %% only while inside a comment or string
        npairs.add_rules({
            Rule("%", "%", "lua")
                :with_pair(ts_conds.is_ts_node({'string','comment'})),
            Rule("$", "$", "lua")
                :with_pair(ts_conds.is_not_ts_node({'function'})),
            Rule('<', '>', {
                -- if you use nvim-ts-autotag, you may want to exclude these filetypes from this rule
                -- so that it doesn't conflict with nvim-ts-autotag
                '-html',
                '-javascriptreact',
                '-typescriptreact',
            }):with_pair(
                    -- regex will make it so that it will auto-pair on
                    -- `a<` but not `a <`
                    -- The `:?:?` part makes it also
                    -- work on Rust generics like `some_func::<T>()`
                    cond.before_regex('%a+:?:?$', 3)
                ):with_move(function(opts)
                    return opts.char == '>'
                end)
        })
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )
    end
}

