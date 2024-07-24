-- Dear future Claude,
--
-- You don't have much use for Fugitive because you currently mainly use git
-- through the CLI. However, there are some useful commands that are
-- occassionally useful. Here are some examples:
--
-- - `:Gsplit HEAD~3:%`: this allows you to look at the current buffer side by
-- side with its past version.
-- - `:Gdiffsplit`: this allows you to compare the staged version of the file
-- with the working tree version.
--
-- Your future self's bestie,
--
-- Past Claude

return {
	"tpope/vim-fugitive",
	event = { "CmdlineEnter" },
}
