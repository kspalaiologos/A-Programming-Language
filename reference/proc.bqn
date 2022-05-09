h ← •file.Chars "APL1.htm" # https://www.jsoftware.com/papers/APL1.htm
h /˜↩ ¬ (@+13)=h
h +↩ (' '-@+10) × ((»∨«)⊸<(@+10)=h) ∧ «'<'≠h

# Adapted from bqn-libs
Find ← ∧⟜«˝=⌜  # ≠∘⊢↑⍷ is slow currently
ReplaceAll ← { ⟨old,new⟩ 𝕊 str:
  ! (≠new) ≡ l ← ≠old
  match ← 1-˜ (l+1)|⌊´ (↕⊸-l) × old Find¨ <str
  cont ← (-⟜1⌈≤⟜1×⊢)` match ⊏ (≠¨old)∾0
  keep ← ⋈⟜(⊏⟜str) / 0=cont
  insert ← (new⊏˜⊏⟜match)⊸(≠¨⊸/⋈∾∘⊣) / (0⊸<∧»⊸≤) cont
  ⍋⊸⊏´ keep ∾¨ insert
}

# List &chars that appear
#•Show ∨⌾(⌽˘) (⍷≍˘/⁼∘⊐) (7⌊≠)⊸↑¨ h ⊔˜ (1-˜>×⊐∘⊣)○(⌈`⊢×1+↕∘≠)˝ "&;"=⌜h

greek ← "alpha"‿"beta"‿"gamma"‿"Gamma"‿"delta"‿"epsilon"‿"theta"‿"lambda"‿"mu"‿"nu"‿"phi"‿"Phi"‿"sigma"‿"tau"‿"pi"

chars ← ("&"∾∾⟜";")⌾⊑¨ (⋈⟜("\"⊸∾)¨greek) ∾ ⟨
  "nbsp"  ‿"\ "
  "larr"  ‿"←"
  "rarr"  ‿"→"
  "harr"  ‿"\leftrightarrow"
  "darr"  ‿"↓"
  "uarr"  ‿"↑"
  "#133"  ‿"..."
  "ndash" ‿"-"
  "times" ‿"\times"
  "ldquo" ‿"``"
  "rdquo" ‿"''"
  "int"   ‿"\int"
  "ne"    ‿"\neq"
  "and"   ‿"\wedge"
  "or"    ‿"\vee"
  "gt"    ‿">"
  "lt"    ‿"<"
  "le"    ‿"\leq"
  "ge"    ‿"\geq"
  "rceil" ‿"⌉"
  "rfloor"‿"⌋"
  "#8971" ‿"\rfloor"
  "prime" ‿"'"
  "Prime" ‿"'"
  "#149"  ‿"•"
  "middot"‿"\cdot"
  "sube"  ‿"\subseteq"
  "supe"  ‿"\supseteq"
  "rsquo" ‿"'"
  "mdash" ‿"---"
  "sup2"  ‿"^2"
  "sup3"  ‿"^3"
  "notin" ‿"\notin"
  "uuml"  ‿"ü"
  "equiv" ‿"\equiv"
⟩

repl ← chars ∾ ⟨
  "&times"‿"\times"
  "&mu"   ‿"\mu"
  "<br>"  ‿"\\"
  "<p>"   ‿"\par ",    "</p>"    ‿""
  "<b><i>"‿"\mathbf{", "</i></b>"‿"}"
  "<i>"   ‿"\textit{", "</i>"    ‿"}"
  "<b>"   ‿"\textbf{", "</b>"    ‿"}"
  "<sub>" ‿"_{",       "</sub>"  ‿"}"
  "<sup>" ‿"^{",       "</sup>"  ‿"}"
  "<tt>"  ‿"",         "</tt>"   ‿""
  "<nobr>"‿"",         "</nobr>" ‿""
  "<table>"‿"\begin{tabularx}", "</table>"‿"\end{tabularx}"
  "<tr>"  ‿"",         "</tr>"   ‿"\\"
  "<td>"  ‿"",         "</td>"   ‿" & "
⟩

"APL1.tex" •file.Chars (»⊸∨' '⊸≠)⊸/ (<˘⍉>repl) ReplaceAll h
