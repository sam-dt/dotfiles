vim.g.ale_linters = {
   sh = {'shellcheck'},
   php = {'php_cs_fixer'},
}

vim.g.ale_fixers = {
   php = {'prettier', 'php_cs_fixer'},
   javascript = {'prettier'},
   javascriptreact = {'prettier'},
   typescript = {'prettier'},
   typescriptreact = {'prettier'},
   graphql = {'prettier'},
}

vim.g.ale_linters_explicit = true

vim.g.php_cs_fixer_path = "vendor/bin/php-cs-fixer"

