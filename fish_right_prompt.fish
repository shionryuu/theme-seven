
set -g rp_last_bg normal
set right_segment_separator \uE0B2

# ===========================
# Segments functions
# ===========================

function right_prompt_segment -d "Function to draw a segment"
  set -l bg
  set -l fg

  if [ -n "$argv[1]" ]
    set bg $argv[1]
  else
    set bg normal
  end

  if [ -n "$argv[2]" ]
    set fg $argv[2]
  else
    set fg normal
  end

  set_color -b $rp_last_bg
  set_color $bg
  echo -n "$right_segment_separator"
  set_color -b $bg
  set_color $fg

  set rp_last_bg $argv[1]
  if [ -n "$argv[3]" ]
    echo -n -s " " $argv[3] " "
  end
end

function right_prompt_finish -d "End open segments"
  set_color -b normal
  set_color normal
  set -g rp_last_bg normal
end

set KIRA \
  "(ゝ∀ ･)" \
  "(＾o＾)ﾉ" \
  "⊂ 彡☆ ))д\`)" \
  "(つ д ⊂)" \
  "|∀\` )" \
  "(*ﾟ∇ ﾟ)" \
  "(〃∀ 〃)" \
  "(\`ヮ´ )" \
  "σ\`∀ ´)" \
  "ヾ(´ω ﾟ｀)" \
  "( ´・ω)" \
  "(\`・ω・´)" \
  "(^ω^)" \
  "(ノﾟ∀ ﾟ)ノ" \
  "(σﾟ∀ﾟ)σ" \
  "(´∀((☆ ミつ" \
  "(ノへ￣、)" \
  "Σ(っ°Д °;)っ" \
  "┳G┻┳F┳┻W┫" \
  "(_　_)。゜zｚＺ" \
  "┗|*｀0′*|┛" \
  "＞▽＜" \
  "ヾ(≧ へ ≦)〃" \
  "ヾ(′▽｀* )ノ~" \
  "╮(╯-╰)╭" \
  "o(〃'▽'〃)o" \
  "o((>ω< ))o" \
  "σ(-_-メ)" \
  "(°ー°〃)" \
  "_(:3ゝ∠)_" \
  "ε=ε=┏( >_<)┛" \
  "(﹁\"﹁)" \
  "ヽ(￣ω￣(￣ω￣〃)ゝ" \
  "(°°)～　(°°)～" \
  "▄︻┻┳═一…… ☆（>○<）" \
  "･ﾟ( ﾉд\`ﾟ)" \
  "(╬ﾟдﾟ)" \
  "(／‵Д′)／~ ╧╧" \
  "٩(ŏ﹏ŏ、)۶" \
  "(╯•̀ὤ•́)╯" \
  "(☄◣ω◢)☄" \
  "눈言눈" \
  "( ﾟ∀ﾟ)o彡ﾟ" \
  "_(√ ζ ε:)_" \
  "(╬▼дﾟ)▄︻┻┳═一" \
  "ξ( ✿＞◡❛)▄︻▇▇〓▄︻┻┳═一" \
  "(≧∀≦)ゞ" \
  "(」・ω・)」うー！(／・ω・)／にゃー！" \
  "＼(・ω・＼)SAN値！(／・ω・)／ピンチ！" \
  "(:3[___]=" \
  "(っ﹏-) .｡o" \
  "ε=ε=ヾ(;ﾟдﾟ)/" \
  "┗( T﹏T )┛" \
  "( ﹁ ﹁ ) ~→" \
  "✧(≖ ◡ ≖✿)" \
  "(ノω<。)ノ))☆.。" \
  "☆⌒(*＾-゜)v THX!!" \
  "※=○☆(＿＿*)Ｚｚｚ" \
  "_〆(´Д｀ )" \
  "( *・ω・)✄╰ひ╯" \
  "｡ﾟ(ﾟ∩´﹏\`∩ﾟ)ﾟ｡\`)" \
  "(ﾉ> ◇ <)ﾉ" \
  "┐('～\`；)┌\`')" \
  "┬─┬ノ( º _ ºノ )" \
  "ㅍㅅㅍ" \
  "⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄" \
  "(σ′▽‵)′▽‵)σ"

function fish_kira -d 'emoji'
  set -l KIRA_LEN (count $KIRA)
  set -l KIRA_CUR (math (random)%$KIRA_LEN+1)
  right_prompt_segment black blue $KIRA[$KIRA_CUR]
end

function fish_date -d 'date'
  right_prompt_segment green black (date +"%H:%k:%M")
end

function fish_right_prompt -d 'bobthefish is all about the right prompt'
  fish_kira
  fish_date
  right_prompt_finish
end