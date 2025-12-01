--[[
This script performs post-processing for Quarto to replace `\ref` with `\eqref`
for equations. See https://github.com/quarto-dev/quarto-cli/issues/2439 for more
information.
--]]

pandoc = require("pandoc")

local function replace_eqref(el)
  if el.format == "latex" then
    el.text = el.text:gsub("\\ref{eq%-", "\\eqref{eq-")
    return el
  end
end

function RawBlock(el)
  return replace_eqref(el)
end

function RawInline(el)
  return replace_eqref(el)
end

local NBSP = "\194\160" -- nbsp; U+00A0
local function is_equation(el) return el and el.t == "Str" and el.text == "Equation" end
local function is_gap(el) return el and (el.t == "Space" or (el.t == "Str" and el.text == NBSP)) end
local function is_span(el) return el and el.t == "Span" end
function Inlines(inlines)
  local out = pandoc.List()
  local i = 1
  while i <= #inlines - 2 do
    local label     = inlines[i]
    local separator = inlines[i + 1]
    local ref_span  = inlines[i + 2]
    if is_equation(label) and is_gap(separator) and is_span(ref_span) then
      out:insert(label)
      out:insert(separator)
      out:insert(pandoc.Str("("))
      out:insert(ref_span)
      out:insert(pandoc.Str(")"))
      i = i + 3
    else
      out:insert(label)
      i = i + 1
    end
  end
  while i <= #inlines do
    out:insert(inlines[i])
    i = i + 1
  end
  return out
end
