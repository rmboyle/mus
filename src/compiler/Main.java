//*Taylor*//

package compiler;

import java.io.*;

import java_cup.runtime.*;

public class Main
{
	public static void main(String[] args) throws java.lang.Exception
	{
		Symbol sym;
		try
		{
			/*// Uncomment to check the tokens the lexical analyzer produces
			Yylex lexer = new Yylex(new FileReader("test.txt"));
			for (sym = lexer.next_token(); sym.sym != 0; sym = lexer.next_token())
			{
				System.out.println("Token " + sym + ", with value = " + sym.value
					+ "; at line " + sym.left + ", column " + sym.right);
			}
			System.out.println("Lexer has finished\n\n");
			*/
			
			// open input file
			FileReader inFile = null;
			try
			{
				inFile = new FileReader("src/testfiles/BuiltinFunctions.mus");
			}
			catch (FileNotFoundException ex)
			{
				System.err.println("File " + "test" + " not found.");
				System.exit(-1);
			}
			
			
			Yylex lexer2;
		
			try
			{
				lexer2 = new Yylex(inFile);
				ParserCup p = new ParserCup(lexer2);
				p.parse();
			}
			catch (Exception lex)
			{
				// lex.printStackTrace() ;
				System.err.println("Error in your code");
			}
		}
		catch (Exception e)
		{
			// e.printStackTrace() ;
			System.err.println("Error in your code");
		}
	}
}