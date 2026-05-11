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

#title(5)

#v(2em)
#set enum(indent: 0pt)
#set list(tight: true)

将如下下推自动机 $P = ( {p, q}, {0, 1}, {X, Z}, delta, p, Z )$
转化为一个等价的上下文无关文法。

将该文法化简。

将该文法转化为Chomsky范式形式。

#table(
  columns: 7,
  [], [ $0,Z$ ],[ $0,X$ ],[ $1, Z$ ],[ $1, X$ ],[ $epsilon, Z$ ],[ $epsilon, X$ ],
  [$-> p$], [--], [$q,X$],[$p,X Z$], [$p, X X$], [$p, epsilon$], [--],
  [$q$], [$p,Z$], [--], [--], [$q, epsilon$], [--], [--]
)


#ans[
  $S -> [p Z p] | [p Z q]$

  $[p X p] -> 0 [q X p]$

  $[p X q] -> 0 [q X q]$

  $[p Z p] -> 1 [p X p] [p Z p] | 1 [p X q] [q Z p]$

  $[p Z q] -> 1 [p X p] [p Z q] | 1 [p X q] [q Z q]$

  $[p X p] -> 1 [p X p] [p X p] | 1 [p X q] [q X p]$

  $[p X q] -> 1 [p X p] [p X q] | 1 [p X q] [q X q]$

  $[p Z p] -> epsilon$

  $[q Z p] -> 0 [p Z p]$

  $[q Z q] -> 0 [p Z q]$

  $[q X q] -> 1$

  令 $A = [p Z p], B = [p Z q], C = [p X p], D = [p X q], E = [q Z p], F = [q Z q], G = [q X p], H = [q X q]$，则CFG为：

  $S -> A | B$

  $A -> 1 C A | 1 D E | epsilon$

  $B -> 1 C B | 1 D F$

  $C -> 0 G | 1 C C | 1 D G$

  $D -> 0 H | 1 C D | 1 D H$

  $E -> 0 A$

  $F -> 0 E$

  $H -> 1$

  删除无用符号 $C, G$:

  $S -> A | B$

  $A -> 1 D E | epsilon$

  $B -> 1 D F$

  $D -> 0 H | 1 D H$

  $E -> 0 A$

  $F -> 0 E$

  $H -> 1$

  删除 $A -> epsilon$:

  $S -> A | B $

  $A -> 1 D E$

  $B -> 1 D F$

  $D -> 0 H | 1 D H$

  $E -> 0 A | 0$
  
  $F -> 0 E$

  $H -> 1$

  删除 $S -> A, S -> B$:

  $S -> 1 D E | 1 D F$

  $A -> 1 D E$

  $B -> 1 D F$

  $D -> 0 H | 1 D H$

  $E -> 0 A | 0$

  $F -> 0 E$

  $H -> 1$

  删除 $B$, *化简结果为*：

  $S -> 1 D E | 1 D F$

  $A -> 1 D E$

  $D -> 0 H | 1 D H$

  $E -> 0 A | 0$

  $F -> 0 E$

  $H -> 1$

  将 1 替换为 $H$,  0 替换为 $E$:

  $S -> H D E | H D F$

  $A -> H D E$

  $D -> E H | H D H$

  $E -> E A | 0$

  $F -> E E $

  $H -> 1$

  拆分长度大于2的产生式：

  $S -> H C_1 | H C_2$

  $A -> H C_1$

  $C_1 -> D E$

  $C_2 -> D F$

  $D -> E H | H C_3$

  $C_3 -> D H$

  $E -> E A | 0$

  $F -> E E$

  $H -> 1$
]
