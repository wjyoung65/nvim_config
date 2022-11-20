local dap_status, dap = pcall(require, "dap")
if not dap_status then
  print("dap not found")
  return
end

local dapui_status, dapui = pcall(require, "dapui")
if not dapui_status then
  print("dapui not found")
  return
end


