-- Add this script to the ServerScriptService
-- Create a folder[1] named "Warps" in the workspace.
-- Create 2 parts, "fromX" and "toX", where X is the number of the portal.
-- 

local folder = game.Workspace.Warps -- 1

local function Warp(num: number, hit: BasePart)
	local char = hit.Parent
	local hum = char and char:FindFirstChildOfClass("Humanoid")
	if not hum then return end

	local to = folder:FindFirstChild(`to{num}`)
	if not to then return end
	char.HumanoidRootPart.CFrame = to.CFrame * CFrame.new(0, 4, 0)
end

for _, from in folder:GetChildren() do
	local regex = "from(%d+)"
	local num = string.match(from.Name, regex)
	if not num then continue end

	from.Touched:Connect(function(hit: BasePart)
		Warp(num, hit)
	end)
end