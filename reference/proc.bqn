h ← •file.Chars "APL1.htm" # https://www.jsoftware.com/papers/APL1.htm

# Adapted from bqn-libs
lf ← @+10
Find ← ∧⟜«˝=⌜  # ≠∘⊢↑⍷ is slow currently
ReplaceAll ← { ⟨old,new⟩ 𝕊 str:
  ! (≠new) ≡ l ← ≠old
  match ← 1-˜ (l+1)|⌊´ (↕⊸-l) × old Find¨ <str
  cont ← (-⟜1⌈≤⟜1×⊢)` match ⊏ (≠¨old)∾0
  keep ← ⋈⟜(⊏⟜str) / 0=cont
  insert ← (new⊏˜⊏⟜match)⊸(≠¨⊸/⋈∾∘⊣) / (0⊸<∧»⊸≤) cont
  ⍋⊸⊏´ keep ∾¨ insert
}

h (@+13)⊸≠⊸/↩
lc ← (∨´Find⟜h¨"<i>"‿"<b>"‿"<tt>"‿"<nobr>")∨'<'≠h  # If line can continue paragraph
h +↩ (' '-lf) × ((»∨«)⊸<lf=h) ∧ «lc

# List &chars that appear
#•Show ∨⌾(⌽˘) (⍷≍˘/⁼∘⊐) (7⌊≠)⊸↑¨ h ⊔˜ (1-˜>×⊐∘⊣)○(⌈`⊢×1+↕∘≠)˝ "&;"=⌜h

greek ← ⟨"αalpha","βbeta","γgamma","ΓGamma","δdelta","ϵepsilon","θtheta"
         "λlambda","μmu","νnu","φphi","ΦPhi","σsigma","τtau","πpi"⟩
apl ← "⍳∊⍴⍵⍺" ⋈○⋈¨ "ιϵρωα"

chars ← ("&"∾∾⟜";")⌾⊑¨ (⋈⟜("\"⊸∾)¨1↓¨greek) ∾ ⟨
  "nbsp"  ‿" "
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

repl ← chars ∾ apl ∾ ⟨
  "\"     ‿"\backslash"
  "&times"‿"\times"
  "&mu"   ‿"\mu"
  " sin " ‿" \sin "
  "<br>"  ‿("\\"∾lf)
  "<p align=center>"‿"\par "
  "<p>"   ‿"\par ",    "</p>"    ‿""
  "<b><i>"‿"\vect{",   "</i></b>"‿"}"
  "<i>"   ‿"\textit{", "</i>"    ‿"}"
  "<b>"   ‿"\textbf{", "</b>"    ‿"}"
  "<sub>" ‿"_{",       "</sub>"  ‿"}"
  "<sup>" ‿"^{",       "</sup>"  ‿"}"
  "<tt>"  ‿"",         "</tt>"   ‿""
  "<nobr>"‿"",         "</nobr>" ‿""
  "<table>"‿"\begin{tabularx}", "</table>"‿"\end{tabularx}"
  "<tr>"  ‿"",         "</tr>"   ‿"\\"
  "<td>"  ‿"",         "</td>"   ‿" & "
  "<font face=""Script"">R</font>"‿"\mathcal{R}"
  "<font face=Script>R</font>"‿"\mathcal{R}"
  "<font face=""Arial"">"‿"\mathsf{"
  "<font face=Arial>"‿"\mathsf{"
  "<font size=+1>"‿"\large{", "<font size=-1>"‿"\small{"
  "</font>"‿"}"
  "<img src=""APLimg/alphaboscore.bmp"">"               ‿"\overbar{\vect{\alpha}}"
  "<img src=""APLimg/omegaboscore.bmp"">"               ‿"\overbar{\vect{\omega}}"
  "<img src=""APLimg/uoscore.bmp"">"                    ‿"\overbar{u}"
  "<img src=""APLimg/xoscore.bmp"">"                    ‿"\overbar{x}"
  "<img src=""APLimg/fboscore.bmp"">"                   ‿"\overbar{\vect{f}}"
  "<img src=""APLimg/uboscore.bmp"">"                   ‿"\overbar{\vect{u}}"
  "<img src=""APLimg/vboscore.bmp"">"                   ‿"\overbar{\vect{v}}"
  "<img src=""APLimg/epsboscore.bmp"">"                 ‿"\overbar{\textbf{ϵ}}"
  "<img src=""APLimg/ecapboscore.bmp"">"                ‿"\overbar{\mathsf{\mat{E}}}"
  "<img src=""APLimg/uarr.bmp"">"                       ‿"\Uparrow"
  "<img src=""APLimg/circleplus.bmp"">"                 ‿"\oplus"
  "<img src=""APLimg/circledot.bmp"">"                  ‿"\odot"
  "<img src=""APLimg/plustimes.bmp"">"                  ‿"{+ \atop \times}"
  "<img src=""APLimg/timesslash.bmp"">"                 ‿"{\times \atop /}"
  "<img src=""APLimg/orand.bmp"">"                      ‿"{\vee \atop \wedge}"
  "<img src=""APLimg/circle1circle2.bmp"">"             ‿"{\odot_1 \atop \odot_2}"
  "<img align=middle src=""APLimg/circle1circle2.bmp"">"‿"{\odot_1 \atop \odot_2}"
  "<img src=""APLimg/jotcircle.bmp"">"                  ‿"{\circ \atop \odot_2}"
  "<img src=""APLimg/jottimes.bmp"">"                   ‿"{\circ \atop \times}"
  "<img src=""APLimg/jotand.bmp"">"                     ‿"{\circ \atop \wedge}"
  "<img src=""APLimg/jotbase.bmp"">"                    ‿"{\circ \atop ⊥}"
⟩
repl ∾˜↩ ⟨ "<sup><i>&nbsp;"‿"^{\textit{", "<sub><i>&nbsp;"‿"_{\textit{" ⟩

h ↩ " }"‿"}" ⋈¨⊸ReplaceAll (<˘⍉>repl) ReplaceAll h
h (»⊸∨' '⊸≠)⊸/↩
h (1 (("\"∾↓)¨⋈↑¨) greek)⊸ReplaceAll↩

# Split into lines
l ← (⊢-˜+`×¬)∘=⟜lf⊸⊔ h
l (∨´¬∘∊⟜" \&")⊸/¨↩
l /˜↩ »⊸∨ 0<≠¨l

Math ← {
  p ← 𝕩∊".,;:"
  s ← 𝕩=' '
  m ← 0⌾⊑(𝕩='\')∨((@+128)≤𝕩)∨(𝕩∊"}"∾∾"0aA"+⟜↕¨10‿26‿26)<(»∧«)' '=𝕩
  i‿b ← ∨`Find⟜𝕩¨ "\textbf{"⋈˜ti←"\textit{"
  m >↩ b
  m ∨↩ i ↩ i ∧ (1+≠ti)⥊⟜0⊸««⊸∨'}'=𝕩
  PF← +`∘⊣⊏1(¬∾/∾˜)(∨/⊣)  # Fill partitions 𝕨 based on 𝕩
  e ← ((p∧1⊸«)⊸∨s) (>⟜(»∧«)<⊢) s PF m
  f ← ¬ (≠`(0¨ti)⊸»⊸∨i) ∨ (≠𝕩)↑/⁼('}'≠⊏⟜𝕩)⊸+(1+≠ti)+/i∧↩e
  (∾⟜(/f) ⍋⊸⊏ '$'¨∾(f/𝕩)˙) /0(∾≠∾˜)e
}⍟(0<≠)
l Math⍟("$"⊸(⊑¬∘∊)∧("<a "≡3⊸↑)∨"\par"≡4⊸↑)¨↩

Combs ← <˘∘⍉{∾"\"‿𝕨‿"{"‿𝕩‿"}"}⌜
post ← ("$"⊸(∾˜⋈∾)¨ "th"‿"-origin"‿"-index"‿"-residue"‿"-reduction") ∾ ⟨
  "\mathsf{\textbf{E}}"‿"\mat{E}"
  "//"‿"/\!/"
⟩ ∾ (∾"mat"‿"mathbf"‿"tree" "textbf"⊸⋈⊸Combs¨⟨'A'+↕26,"αλμνπρ","ΦΓ"⟩)∾("vect"‿"mat"Combs'A'+↕26)
SimpSub ← (¬·»⍟2⊸∨∊⟜"^_"»⊸∧'{'⊸=∧·«⍟2'}'⊸=)⊸/

"APL1.tex" •file.Chars SimpSub (<˘⍉>post) ReplaceAll ∾∾⟜lf¨ l
