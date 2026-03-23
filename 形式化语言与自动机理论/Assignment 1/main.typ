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

#title(1)

#v(2em)
#set enum(indent: 0pt)
#set list(tight: true)

1. 给出语言 ${a^n b^(2m) | n >= 1, m >= 1}$ 的一个正则文法（3 型文法），并在以下示例中演示其最左推导过程。
  - $a a b b b b$
  - $a a a b b$

#ans[
  $S -> a A$\
  $A -> a A | B$\
  $B -> b b B | b b$

  - $a a b b b b$\
    $S => a A => a a A => a a B => a a b b B => a a b b b b$
  - $a a a b b$\
    $S => a A => a a A => a a a A => a a a B => a a a b b$
]

2. 给出一个上下文无关文法（2 型文法）描述如下语言 ${0^n 1^(2n) | n >= 1}$，并在以下示例中演示其最右推导过程。
  - $0 0 1 1 1 1$
  - $0 1 1$

#ans[
  $S -> 0 S 1 1 | 0 1 1$

  - $0 0 1 1 1 1$\
    $S => 0 S 11 => 001111$
  - $0 1 1$\
    $S => 0 1 1$
]

3. 给出接受以下语言的 DFA ：所有以 1 开头，能被 4 整除的二进制串，如1000, 1100, 10100。

#ans[
  #image("1.svg", width: 55%)
]

