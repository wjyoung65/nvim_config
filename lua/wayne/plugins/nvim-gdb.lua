local status, nvim_gdb = pcall(require, "nvim-gdb")
if not status then
  print("nvim-gdb not found")
  return
end
