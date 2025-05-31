-- vim compat
vim.cmd("set runtimepath^=~/.vim runtimepath+=~/.vim/after")
vim.cmd("let &packpath = &runtimepath")
-- Don't leave things highlighted after searching
vim.cmd("set nohlsearch")
vim.cmd("source ~/.vimrc")
