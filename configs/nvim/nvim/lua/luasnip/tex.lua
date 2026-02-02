return {
	s({trig=";a", snippetType="autosnippet", desc="alpha",wordTrig=false},
	    {t("\\alpha"),}
	),
  s({trig="env", snippetType="snippet", dscr="Begin and end an arbitrary environment"},
      fmta(
          [[
          \begin{<>}
              <>
          \end{<>}
          ]],
          {i(1),i(2),rep(1),}
      )
  ),
  s({trig="\"", snippetType="autosnippet", desc="quotation marks"},
    fmta(
        [[``<>'' ]],
        {i(1, "text"),}
    )
  ),

-- Figures
  s({trig="fig", snippetType="snippet", dscr="A basic figure environment"},
      fmta(
          [[
          \begin{figure}
          \centering
          \includegraphics[width=0.9\linewidth]{<>}
          \caption{
              \textbf{<>}
              <>
              }
          \label{fig:<>}
          \end{figure}
  
          ]],
          { i(1,"filename"),
            i(2, "captionBold"),
            i(3, "captionText"),
            i(4,"figureLabel"),}
      )
  ),


  -- \texttt
  s({trig="tt", dscr="Expands 'tt' into '\texttt{}'"},
    fmta(
      "\\texttt{<>}",
      { i(1) }
    )
  ),

  -- \textbf
  s({trig="bf", dscr="Expands 'bf' into '\textbf{}'"},
    fmta(
      "\\textbf{<>}",
      { i(1) }
    )
  ),

  -- Using a zero-index insert node to exit snippet in equation body
  s({trig="eq", dscr=""},
    fmta(
      [[
        \begin{equation}
            <>
        \end{equation}
      ]],
      { i(0) }
    )
  ),

  -- Example use of insert node placeholder text
  s({trig="hr", dscr="The hyperref package's href{}{} command (for url links)"},
    fmta(
      [[\href{<>}{<>}]],
      {
        i(1, "url"),
        i(2, "display name"),
      }
    )
  ),

}
