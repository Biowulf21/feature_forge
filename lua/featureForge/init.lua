local utils = require("featureForge.utils")
local cubit = require("templates.cubit")
local M = {}

local features_directory = "features/"
local view_directory = "view/"
local repository_directory = "data/repository/"

function M.createFeature()
	local is_flutter_project = utils.check_if_flutter_project()

	if not is_flutter_project then
		error("Cannot run FeatureForge outside of a Flutter project!")
		return
	end

	local feature_name = vim.fn.input("Enter feature name: ")

	if feature_name == "" then
		error("Feature name cannot be empty")
		return
	end

	local current_buff_directory = vim.fn.expand("%:p:h")
	local feature_directory = current_buff_directory .. "/features/" .. feature_name
	if feature_directory == "" then
		error("Feature directory cannot be empty")
		return
	end

	local package_name = utils.get_package_name()
	local feature_name_lowercase = utils.convert_to_snake_case(feature_name)

	cubit.create_cubit(feature_name, feature_directory)
end

return M
