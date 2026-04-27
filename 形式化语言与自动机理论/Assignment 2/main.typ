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


#title(2)

#v(2em)
#set enum(indent: 0pt)
#set list(tight: true)

1. 设计一个NFA，使其能够识别含有deep或者seek的字符串；然后将该NFA转换为一个等价的DFA.


#ans[
  NFA 如图所示：
    #image("1.svg")
  转换为 DFA：
  #let q(num) = $q_#num$
  #table(
    columns: 7,
    [], [d], [e], [p], [s], [k], [Others],
    [$-> q_0$], ..(1, 0, 0, 5, 0, 0).map(q),
    [$q_1$],    ..(1, 2, 0, 5, 0, 0).map(q),
    [$q_2$],    ..(1, 3, 0, 5, 0, 0).map(q),
    [$q_3$],    ..(1, 0, 4, 5, 0, 0).map(q),
    [\* $q_4$], ..(4, 4, 4, 4, 4, 4).map(q),
    [$q_5$],    ..(1, 6, 0, 5, 0, 0).map(q),
    [$q_6$],    ..(1, 7, 0, 5, 0, 0).map(q),
    [$q_7$],    ..(1, 0, 0, 5, 8, 0).map(q),
    [\* $q_8$], ..(8, 8, 8, 8, 8, 8).map(q),
  )
    DFA 如图所示：
  #image("2.svg")
]

2. 把以下正则表达式 $(a + b)^* a b^*$转换成 $epsilon$-NFA，然后再将其转换为等价的DFA.

#ans[
  $epsilon$-NFA 如图所示：
  #image("3.svg", width: 80% )
  转换为 DFA：
  #let s(num) = $S_#num$

  记 $S_0 = {1}$, $S_1={3,6,7,8,1,2,4,9,10,12}$,$S_2={5,6,7,1,2,4}$,$S_3={5,6,7,1,2,4,11,10,12}$.
  #table(
    columns: 3,
    [], [a], [b],
    [$-> S_0$], ..(1, 2).map(s),
    [\* $S_1$], ..(1, 3).map(s),
    [$S_2$],    ..(1, 2).map(s),
    [\* $S_3$], ..(1, 3).map(s),
  )

  DFA 如图所示：
  #image("4.svg", width: 100% )
]

