//*Jonathan*//

package lexer;

import java.io.FileReader;
import java.io.IOException;
import java_cup.runtime.*;
import java.lang.Error ;


class Utility
{
	public static void check(boolean expr)
	{
		if (false == expr)
			throw (new java.lang.Error("Error: Assertion failed."));
	}

	private static final String[] errorMessage = {
			"Error: Unmatched end-of-comment punctuation.",
			"Error: Unmatched start-of-comment punctuation.",
			"Error: Unclosed string.", "Error: Illegal character." };
	public static final int E_ENDCOMMENT = 0;
	public static final int E_STARTCOMMENT = 1;
	public static final int E_UNCLOSEDSTR = 2;
	public static final int E_UNMATCHED = 3;

	public static void error(int code)
	{
		System.out.println(errorMessage[code]);
	}
}



%%
%{
  private int comment_counter = 0;
  
  
  class Symbol{
  Symbol(int consti, String text, Object value, int charBegin, int charEnd){
    this.value = value;
    this.text = text;
    this.charBegin = charBegin;
    this.charEnd = charEnd;
    this.consti = consti;
  }
    
    public String toString(){
       return "Token text:" + text + ". Value is:" + value + ".";
    }

    private int charBegin, charEnd;
    String text;
    Object value ;
    int consti ;
    
    public java_cup.runtime.Symbol returnSymbol()
    {
   	 java_cup.runtime.Symbol x = new java_cup.runtime.Symbol (consti, charBegin, charEnd, value ) ;
     return x ;
    }
}
  
  
%}

%line
%state COMMENT, COMMENTLINE
%cupsym ParserCup
%cup
%eofval{
    return new java_cup.runtime.Symbol(ParserSym.EOF);
%eofval}
%char
WS = [ \n\r\t\b\012]
LETTER = [A-Za-z]
DIGIT = [0-9]
ID = {LETTER}({LETTER}|{DIGIT}|\#|_)*
NUMBER = {DIGIT}+(\.{DIGIT}*)?(E[-+]?{DIGIT}+)?
STRING_TEXT = (\\\"|[^\n\"\']|\\{WS}+\\)*
COMMENT_TEXT = ([^/*\n]|[^*\n]"/"[^*\n]|[^/\n]"*"[^/\n]|"*"[^/\n]|"/"[^*\n])*
%%




<YYINITIAL> "new" { return new Symbol(ParserSym.NEW, yytext(), null, yychar, yychar+3).returnSymbol();}
<YYINITIAL> "Color" { return new Symbol(ParserSym.COLOR, yytext(), null, yychar, yychar+5).returnSymbol();}
<YYINITIAL> "Instrument" { return new Symbol(ParserSym.INSTRUMENT, yytext(), null, yychar, yychar+10).returnSymbol();}
<YYINITIAL> "Shape" {return new Symbol(ParserSym.SHAPE, yytext(), null, yychar, yychar+5).returnSymbol();}
<YYINITIAL> "Note" { return new Symbol(ParserSym.NOTE, yytext(), null, yychar, yychar+4).returnSymbol();}
<YYINITIAL> "Chord" { return new Symbol(ParserSym.CHORD, yytext(), null, yychar, yychar+5).returnSymbol();}
<YYINITIAL> "Sequence" { return new Symbol(ParserSym.SEQUENCE, yytext(), null, yychar, yychar+8).returnSymbol();}
<YYINITIAL> "foreach" { return new Symbol(ParserSym.FOREACH, yytext(), null, yychar, yychar+7).returnSymbol();}
<YYINITIAL> "," { return new Symbol(ParserSym.COMMA, yytext(), null, yychar, yychar+1).returnSymbol();}
<YYINITIAL> ";" { return new Symbol(ParserSym.SEMICOLON, yytext(), null, yychar, yychar+4).returnSymbol();}
<YYINITIAL> "(" { return new Symbol(ParserSym.LPAREN, yytext(), null, yychar, yychar+1).returnSymbol();}
<YYINITIAL> ")" { return new Symbol(ParserSym.RPAREN, yytext(), null, yychar, yychar+1).returnSymbol();}
<YYINITIAL> "[" { return new Symbol(ParserSym.LBRACK, yytext(), null, yychar, yychar+1).returnSymbol();}
<YYINITIAL> "]" { return new Symbol(ParserSym.RBRACK, yytext(), null, yychar, yychar+1).returnSymbol();}
<YYINITIAL> "+" { return new Symbol(ParserSym.PLUS, yytext(), null, yychar, yychar+1).returnSymbol();}
<YYINITIAL> "=" { return new Symbol(ParserSym.ASSIGN, yytext(), null, yychar, yychar+1).returnSymbol();}
<YYINITIAL> ">" { return new Symbol(ParserSym.GTHAN, yytext(), null, yychar, yychar+1).returnSymbol();}
<YYINITIAL> "<<" { return new Symbol(ParserSym.ADD_TO_SEQUENCE, yytext(), null, yychar, yychar+2).returnSymbol();}
<YYINITIAL> "^" { return new Symbol(ParserSym.CHANGE_DURATION, yytext(), null, yychar, yychar+1).returnSymbol();}
<YYINITIAL> "<" { return new Symbol(ParserSym.LTHAN, yytext(), null, yychar, yychar+1).returnSymbol();}
<YYINITIAL> "display" { return new Symbol(ParserSym.DISPLAY, yytext(), null, yychar, yychar+7).returnSymbol();}
<YYINITIAL> ":" { return new Symbol(ParserSym.COLON, yytext(), null, yychar, yychar+1).returnSymbol();}


<YYINITIAL, COMMENT> {WS} { }
<YYINITIAL> "//" { yybegin(COMMENTLINE); }
<COMMENTLINE> [^\n] { }
<COMMENTLINE> [\n] { yybegin(YYINITIAL); }

<YYINITIAL> "/*" { yybegin(COMMENT); comment_counter++; }
<COMMENT> "/*" { comment_counter++; }
<COMMENT> "*/" {
     comment_counter--;
     Utility.check(comment_counter >= 0);
     if (comment_counter == 0) yybegin(YYINITIAL);
}
<COMMENT> {COMMENT_TEXT} { }

<YYINITIAL> \"{STRING_TEXT}\" {
	String str = yytext().substring(1, yytext().length() - 1);

	Utility.check(str.length() == yytext().length() - 2);
	return (new Symbol(ParserSym.STRING_TEXT, str, str, yychar, yychar + str.length()).returnSymbol());
}


<YYINITIAL> \"{STRING_TEXT} {
       String str = yytext().substring(1, yytext().length());

       Utility.error(Utility.E_UNCLOSEDSTR);
       Utility.check(str.length() == yytext().length() - 1);
       return (new Symbol(ParserSym.STRING_TEXT, str, str, yychar, yychar + str.length()).returnSymbol());
}


<YYINITIAL> \'{STRING_TEXT}\' {
       String str = yytext().substring(1, yytext().length() - 1);
		
       Utility.check(str.length() == yytext().length() - 2);
       return (new Symbol(ParserSym.STRING_TEXT, str, str, yychar, yychar + str.length()).returnSymbol());
}


<YYINITIAL> \'{STRING_TEXT} {
        String str = yytext().substring(1, yytext().length());		

        Utility.error(Utility.E_UNCLOSEDSTR);
	Utility.check(str.length() == yytext().length() - 1);
        return (new Symbol(ParserSym.STRING_TEXT, str, str, yychar, yychar + str.length()).returnSymbol());
}


<YYINITIAL> {NUMBER} {
       return (new Symbol(ParserSym.DIGIT, yytext(), new Integer(yytext()), yychar, yychar + yytext().length()).returnSymbol());
}
<YYINITIAL> {ID} {
        return (new Symbol(ParserSym.ID, yytext(), yytext(), yychar, yychar + yytext().length()).returnSymbol());
}
<YYINITIAL, COMMENT> . {
	    System.out.println("Illegal character: <" + yytext() + ">");
	    Utility.error(Utility.E_UNMATCHED);
}



