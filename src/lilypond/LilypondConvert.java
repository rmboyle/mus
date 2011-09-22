/**
 * Class to write output into correct lilypond format
 */
//*Richard*//
package lilypond;

import java.io.*;

public class LilypondConvert
{
	/**
	 * Writes out the sequence to display in the format for lilypond and
	 * lilypond-book. Will generate .ly and .html files
	 * 
	 * @param masterS the sequence to write the display for
	 * @param header a header for the html file
	 * @throws IOException if it cannot write to a .html or .ly file
	 */
	public static void writeFiles(Sequence masterS, String header)
		throws IOException
	{
		FileWriter fstreamHTML = new FileWriter("test.html");
		FileWriter fstream = new FileWriter("test.ly");
		BufferedWriter outHTML = new BufferedWriter(fstreamHTML);
		BufferedWriter out = new BufferedWriter(fstream);
		outHTML
			.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\n"
				+ "<!-- header_tag -->\n <html>\n <body> \n ");
		outHTML.write(header);
		outHTML.write("\n<lilypond>\n");
		out.write("\\score \n { \n\\new Staff \n<< \n\\new Voice\n {\n");
		outHTML.write("\\score \n { \n\\new Staff \n<< \n\\new Voice\n {\n");
		for (int i = 0; i < masterS.returnSize(); i++)
		{
			out.write(masterS.chordAt(i).write());
			outHTML.write(masterS.chordAt(i).write());
		}
		outHTML
			.write("\n}\n>>\n\\layout {}\n\\midi {\n\t\\context {\n\t\\Score\n\ttempoWholesPerMinute = #(ly:make-moment 100 4) \n}\n}\n}"
				+ "	\n\\version \"2.12.3\"");
		out.write("\n}\n>>\n\\layout {}\n\\midi {\n\t\\context {\n\t\\Score\n\ttempoWholesPerMinute = #(ly:make-moment 100 4) \n}\n}\n}"
			+ "	\n\\version \"2.12.3\"");
		outHTML.write("\n</lilypond>\n");
		outHTML
			.write("<embed src=\"../test.midi\" width=\"140\" height=\"40\" autostart=\"false\" loop=\"FALSE\"> </embed>");
		outHTML.write("\n\n</body>\n</html>");
		out.close();
		outHTML.close();
	}

	//*Irene*//
	
	/**
	 * Executes a script to call on the 'lilypond' and 'lilypond-book' program
	 * lilypond: converts a .ly file into a .midi .pdf and .ps file
	 * lilypond-book: converts a .html file without the graphics to a .html with
	 * the graphic sheet music
	 * 
	 * @throws IOException
	 */
	public static void executeLilypond() throws IOException
	{
		Process p = Runtime.getRuntime().exec("./lilypond.sh");
		BufferedReader stdInput = new BufferedReader(new InputStreamReader(
			p.getInputStream()));
		BufferedReader stdError = new BufferedReader(new InputStreamReader(
			p.getErrorStream()));
		String s = null;
		while ((s = stdInput.readLine()) != null)
		{
			System.out.println(s);
		}
		while ((s = stdError.readLine()) != null)
		{
			System.out.println(s);
		}
		System.out.println("Done!");
	}
}
