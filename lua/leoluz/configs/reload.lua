local F = {}

F.reload = function(module_name)
  local function match(pkg)
    return string.find(pkg, module_name, 1, true)
  end

  for p, _ in pairs(package.loaded) do
    if match(p) then
      package.loaded[p] = nil
    end
  end
  print("module "..module_name.." reloaded!")
end

return F
