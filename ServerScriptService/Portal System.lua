-- This script allows you to create a portal system, you have 2 parts a start point and an end point, when you enter the start point(from) you will be teleported to the end point(to).

-- Create a folder[1] named "Portals" in the workspace.
-- Create 2 parts, "fromX" and "toX", where X is the number of the portal.

local folder = game.Workspace.Portals -- 1

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
