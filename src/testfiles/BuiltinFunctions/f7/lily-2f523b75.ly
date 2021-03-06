%% Generated by lilypond-book
%% Options: [alt=[image of music],indent=0\mm]
\include "lilypond-book-preamble.ly"


% ****************************************************************
% Start cut-&-pastable-section
% ****************************************************************



\paper {
  #(define dump-extents #t)
  
  indent = 0\mm
  force-assignment = #""
  line-width = #(- line-width (* mm  3.000000))
}

\layout {
  
}



% ****************************************************************
% ly snippet:
% ****************************************************************
\sourcefileline 5

\score 
 { 
\new Staff 
<< 
\new Voice
 {

\set Staff.midiInstrument = #"acoustic grand"
\override NoteHead #'color = #black
\override NoteHead #'style = #'default
<a' >4

\set Staff.midiInstrument = #"acoustic grand"
\override NoteHead #'color = #black
\override NoteHead #'style = #'default
<b' >4

\set Staff.midiInstrument = #"acoustic grand"
\override NoteHead #'color = #black
\override NoteHead #'style = #'default
<c' >4

\set Staff.midiInstrument = #"acoustic grand"
\override NoteHead #'color = #black
\override NoteHead #'style = #'default
<a' b' c' >4

\set Staff.midiInstrument = #"acoustic grand"
\override NoteHead #'color = #black
\override NoteHead #'style = #'default
<a' >4

\set Staff.midiInstrument = #"acoustic grand"
\override NoteHead #'color = #black
\override NoteHead #'style = #'default
<a' b' c' >4

\set Staff.midiInstrument = #"acoustic grand"
\override NoteHead #'color = #black
\override NoteHead #'style = #'default
<a' >4

\set Staff.midiInstrument = #"acoustic grand"
\override NoteHead #'color = #black
\override NoteHead #'style = #'default
<b' >4

\set Staff.midiInstrument = #"acoustic grand"
\override NoteHead #'color = #black
\override NoteHead #'style = #'default
<c' >4

\set Staff.midiInstrument = #"acoustic grand"
\override NoteHead #'color = #black
\override NoteHead #'style = #'default
<b' >4

\set Staff.midiInstrument = #"acoustic grand"
\override NoteHead #'color = #black
\override NoteHead #'style = #'default
<c' >4

\set Staff.midiInstrument = #"acoustic grand"
\override NoteHead #'color = #black
\override NoteHead #'style = #'default
<a' >4

}
>>
\layout {}
\midi {
	\context {
	\Score
	tempoWholesPerMinute = #(ly:make-moment 100 4) 
}
}
}	
\version "2.12.3"



% ****************************************************************
% end ly snippet
% ****************************************************************
