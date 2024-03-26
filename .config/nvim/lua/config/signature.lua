return function(_, opts) 
    local signature = require("lsp_signature")
    opts.toggle_key = "<c-a-y>"
    signature.setup(opts);
end
