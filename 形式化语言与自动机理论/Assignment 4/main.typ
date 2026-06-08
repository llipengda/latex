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

#title(4)

#v(2em)
#set enum(indent: 0pt)
#set list(tight: true)

1. 给出接受以下语言的 PDA.

    $L subset.eq { a, b, c}^* $ and $|a| = |b| + |c|$ 

#ans[
  定义 PDA $M = (Q, Sigma, Gamma, delta, q_0, Z_0, F)$，其中

  $Q = { q_0, q_1 }$

  $Sigma = {a, b, c}$

  $Gamma = {Z_0, a, b, c}$  

  $F = { q_1 }$

  $delta(q_0, a, Z_0) = {(q_0, a Z_0)}$
  
  $delta(q_0, b, Z_0) = {(q_0, b Z_0)}$

  $delta(q_0, c, Z_0) = {(q_0, c Z_0)}$

  $delta(q_0, a, a) = {(q_0, a a)}$

  $delta(q_0, a, b) = {(q_0, epsilon)}$

  $delta(q_0, a, c) = {(q_0, epsilon)}$

  $delta(q_0, b, a) = {(q_0, epsilon)}$

  $delta(q_0, b, b) = {(q_0, b b)}$

  $delta(q_0, b, c) = {(q_0, b c)}$

  $delta(q_0, c, a) = {(q_0, epsilon)}$

  $delta(q_0, c, b) = {(q_0, c b)}$

  $delta(q_0, c, c) = {(q_0, c c)}$

  $delta(q_0, epsilon, Z_0) = {(q_1, epsilon)}$

  #image("1.svg", width: 100%)

]