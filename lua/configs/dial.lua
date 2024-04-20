local augend = require("dial.augend")
require("dial.config").augends:register_group({
	default = {
		augend.integer.alias.decimal,
		augend.integer.alias.hex,
		augend.date.alias["%Y/%m/%d"],
		augend.date.new({
			pattern = "%b",
			default_kind = "month",
			-- if true, it does not match dates which does not exist, such as 2022/05/32
			only_valid = true,
			-- if true, it only matches dates with word boundary
			word = false,
		}),
		augend.date.new({
			pattern = "%B",
			default_kind = "month",
			-- if true, it does not match dates which does not exist, such as 2022/05/32
			only_valid = true,
			-- if true, it only matches dates with word boundary
			word = false,
		}),

		augend.constant.alias.alpha,
		augend.constant.alias.Alpha,
		augend.semver.alias.semver,
	},
})
