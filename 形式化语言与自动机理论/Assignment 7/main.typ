#set page(paper: "a4")
#set text(font: ("New Computer Modern", "SimSun"), size: 11pt)
#show strong: set text(stroke: 0.3pt)

#let title(id) = [
  #align(center)[
    #block(text(size: 1.8em)[形式化语言与自动机理论 - 作业 #id])
    #v(0.5em)
    #text(size: 1.2em)[李鹏达 10225101460]
  ]
]

#let ans(body) = [
  #v(0.5em)
  #text(font: "SimHei")[*答案：*]
  #pad(left: 1.5em)[
    #body
  ]
  #v(0.5em)
]

#title(7)

#v(2em)
#set enum(indent: 0pt)
#set list(tight: true)

设计一个图灵机接受以下语言：

  $L = { a^i b^j c^k | i, j, k >= 1, i = j + k }$

使用瞬时描述验证字符串 $a a a b b c$ 的接受过程.


#ans[
构造图灵机

$
M=(Q,Sigma,Gamma,delta,q_0,B,F)
$

其中

$
Sigma={a,b,c}
$

$
Gamma={a,b,c,X,Y,Z,B}
$

状态集合

$
Q={q_0,q_1,q_2,q_3,q_4,q_5,q_6,q_7,q_8}
$

初态为$q_0$，
接受状态集
$F={q_8}
$.

其中，$X$ 表示已匹配的 $a$；$Y$ 表示已匹配的 $b$；$Z$ 表示已匹配的 $c$.

在最左侧找到一个未处理的 $a$，将其改写为 $X$；
向右移动，找到一个未处理的 $b$，将其改写为 $Y$；
返回左侧，继续执行步骤 1、2，直到所有 $b$ 均被改写为 $Y$；
当遇到第一个 $c$ 时，将其改写为 $Z$；
向左寻找一个尚未匹配的 $a$，并改写为 $X$；
重复步骤 4、5，直到所有 $c$ 均被改写为 $Z$；
若最终所有 $a,b,c$ 分别被改写为 $X,Y,Z$，则接受.


#table(
  columns: 8,
  align: center,
  table.header(
    [$delta$], [$a$], [$b$], [$c$], [$X$], [$Y$], [$Z$], [$B$]
  ),

  [$→ q_0$], [$(q_1,X,R)$], [-], [-], [-], [$(q_6,Y,R)$], [-], [-],

  [$q_1$], [$(q_1,a,R)$], [$(q_2,Y,L)$], [-], [-], [$(q_3,Y,R)$], [-], [-],

  [$q_2$], [$(q_2,a,L)$], [-], [-], [$(q_0,X,R)$], [$(q_2,Y,L)$], [-], [-],

  [$q_3$], [-], [$(q_2,Y,L)$], [$(q_4,Z,L)$], [-], [$(q_3,Y,R)$], [$(q_5,Z,R)$], [-],

  [$q_4$], [$(q_4,a,L)$], [-], [-], [$(q_0,X,R)$], [$(q_4,Y,L)$], [$(q_4,Z,L)$], [-],

  [$q_5$], [-], [-], [$(q_4,Z,L)$], [-], [-], [$(q_5,Z,R)$], [-],

  [$q_6$], [-], [-], [-], [-], [$(q_6,Y,R)$], [$(q_7,Z,R)$], [-],

  [$q_7$], [-], [-], [-], [-], [-], [$(q_7,Z,R)$], [$(q_8,B,R)$],

  [$*q_8$], [-], [-], [-], [-], [-], [-], [-],
)

对于输入串

$
a a a b b c
$

有：

#align(center)[
  q₀ a a a b b c \
  ⊢ X q₁ a a b b c \
  ⊢ X a q₁ a b b c \
  ⊢ X a a q₁ b b c \
  ⊢ X a q₂ a Y b c \
  ⊢ X q₂ a a Y b c \
  ⊢ q₂ X a a Y b c \
  ⊢ X q₀ a a Y b c \
  ⊢ X X q₁ a Y b c \
  ⊢ X X a q₁ Y b c \
  ⊢ X X a Y q₃ b c \
  ⊢ X X q₂ a Y Y c \
  ⊢ X q₂ X a Y Y c \
  ⊢ X X q₀ a Y Y c \
  ⊢ X X X q₁ Y Y c \
  ⊢ X X X Y q₃ Y c \
  ⊢ X X X Y Y q₃ c \
  ⊢ X X X Y q₄ Y Z \
  ⊢ X X X q₄ Y Y Z \
  ⊢ X X q₄ X Y Y Z \
  ⊢ X X X q₀ Y Y Z \
  ⊢ X X X Y q₆ Y Z \
  ⊢ X X X Y Y q₆ Z \
  ⊢ X X X Y Y Z q₇ B \
  ⊢ X X X Y Y Z B q₈
]
]
