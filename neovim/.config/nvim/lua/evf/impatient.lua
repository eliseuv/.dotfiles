-- Impatient
-- https://github.com/lewis6991/impatient.nvim

-- Safely initialize impatient
local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  return
end

-- Enable profile
impatient.enable_profile()
