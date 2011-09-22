#!/bin/bash
#//*Irene*//

rm test.midi
rm test.pdf
rm test.ps

/Applications/LilyPond.app/Contents/Resources/bin/lilypond test.ly

rm -fr out

/Applications/LilyPond.app/Contents/Resources/bin/lilypond-book --output=out test.html

#open test.pdf
open out/test.html