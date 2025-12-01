--[[
Pandoc 'normalises' math mode in headings with `\texorpdfstring`. This is a hack
to replace the section with unicode characters for the PDF bookmarks.
--]]

pandoc = require("pandoc")
local levels = {
  [1] = "chapter",
  [2] = "section",
  [3] = "subsection",
  [4] = "subsubsection",
  [5] = "paragraph",
  [6] = "subparagraph"
}

local header_replacements = {
  -- $\mathbf{S}$‑matrix constraints {#sec-s-matrix-constraints}
  ["sec-s-matrix-constraints"] =
  [[\texorpdfstring{$\mathbf{S}$}{𝐒}‑matrix constraints]],
  -- $N^*$ resonances in scattering processes {#sec-nucleon-scattering}
  ["sec-nucleon-scattering"] =
  [[\texorpdfstring{$N^*$~}{𝑁* }resonances in scattering processes]],
  -- $N^*$ resonances in charmonium decays {#sec-nucleons-in-charmonium}
  ["sec-nucleons-in-charmonium"] =
  [[\texorpdfstring{$N^*$~}{𝑁* }resonances in charmonium decays]],
  -- Continuing with the $\mathbfit{K}$‑matrix {#sec-k-matrix}
  ["sec-k-matrix"] =
  [[Continuing with the \texorpdfstring{$\mathbfit{K}$}{𝑲}‑matrix]],
  -- {{< meta var.cxx >}} origins {#sec-compwa-cpp}
  ["sec-compwa-cpp"] =
  [[\cxx origins]],
  -- Polarimeter vector field of $\varLambda_c$ {#sec-polarimeter-vector-field}
  ["sec-polarimeter-vector-field"] =
  [[Polarimeter vector field of\texorpdfstring{~$\varLambda_c$}{ 𝛬𝑐}]],
  -- Application to $\varLambda_c^+ \to p K^- \pi^+$ {#sec-computed-polarimeter}
  ["sec-computed-polarimeter"] =
  [[Application to \texorpdfstring{$\varLambda_c^+ \to p K^- \pi^+$}{𝛬𝑐⁺ → 𝑝𝐾⁻𝜋⁺}]],
  -- Spin alignment tests with $J/\psi \to \bar{p} K^0_S \varSigma^+$ {#sec-jpsi-to-pbar-k-sigma}
  ["sec-jpsi-to-pbar-k-sigma"] =
  [[Spin alignment tests with \texorpdfstring{$J/\psi \to \bar{p} K^0_S \varSigma^+$}{𝐽/𝜓 → p̄𝐾⁰𝛴⁺}]],
}


function Header(el)
  if FORMAT == "latex" then
    local replacement = header_replacements[el.identifier]
    if replacement then
      local header_type = levels[el.level]
      local tex = string.format("\\%s{%s} \\label{%s}", header_type, replacement, el.identifier)
      return { pandoc.RawBlock("latex", tex) }
    end
  end
end
