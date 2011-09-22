/**
 * Class to store information about available note shapes, colors, octaves, pitch, and durations
 */

//*Irene*//
package lilypond;

import java.util.HashMap;
import java.util.Map;

public class Reference
{
	/**
	 * A list of all note shape types
	 */
	public static String[] shapeTable = { "default", "altdefault", "baroque",
			"neomensural", "mensural", "petrucci", "harmonic", "harmonic-black",
			"harmonic-mixed", "diamond", "cross", "xcircle", "triangle", "slash" };
	
	/**
	 * A list of all instruments in midi
	 */
	public static String[] instrumentTable = { "acoustic grand", "contrabass",
			"lead 7 (fifths)", "bright acoustic", "tremolo strings",
			"lead 8 (bass+lead)", "electric grand", "pizzicato strings",
			"pad 1 (new age)", "honky-tonk", "orchestral harp", "pad 2 (warm)",
			"electric piano 1", "timpani", "pad 3 (polysynth)",
			"electric piano 2", "string ensemble 1", "pad 4 (choir)",
			"harpsichord", "string ensemble 2", "pad 5 (bowed)", "clav",
			"synthstrings 1", "pad 6 (metallic)", "celesta", "synthstrings 2",
			"pad 7 (halo)", "glockenspiel", "choir aahs", "pad 8 (sweep)",
			"music box", "voice oohs", "fx 1 (rain)", "vibraphone", "synth voice",
			"fx 2 (soundtrack)", "marimba", "orchestra hit", "fx 3 (crystal)",
			"xylophone", "trumpet", "fx 4 (atmosphere)", "tubular bells",
			"trombone", "fx 5 (brightness)", "dulcimer", "tuba", "fx 6 (goblins)",
			"drawbar organ", "muted trumpet", "fx 7 (echoes)", "percussive organ",
			"french horn", "fx 8 (sci-fi)", "rock organ", "brass section",
			"sitar", "church organ", "synthbrass 1", "banjo", "reed organ",
			"synthbrass 2", "shamisen", "accordion", "soprano sax", "koto",
			"harmonica", "alto sax", "kalimba", "concertina", "tenor sax",
			"bagpipe", "acoustic guitar (nylon)", "baritone sax", "fiddle",
			"acoustic guitar (steel)", "oboe", "shanai", "electric guitar (jazz)",
			"english horn", "tinkle bell", "electric guitar (clean)", "bassoon",
			"agogo", "electric guitar (muted)", "clarinet", "steel drums",
			"overdriven guitar", "piccolo", "woodblock", "distorted guitar",
			"flute", "taiko drum", "guitar harmonics", "recorder", "melodic tom",
			"acoustic bass", "pan flute", "synth drum", "electric bass (finger)",
			"blown bottle", "reverse cymbal", "electric bass (pick)",
			"shakuhachi", "guitar fret noise", "fretless bass", "whistle",
			"breath noise", "slap bass 1", "ocarina", "seashore", "slap bass 2",
			"lead 1 (square)", "bird tweet", "synth bass 1", "lead 2 (sawtooth)",
			"telephone ring", "synth bass 2", "lead 3 (calliope)", "helicopter",
			"violin", "lead 4 (chiff)", "applause", "viola", "lead 5 (charang)",
			"gunshot", "cello", "lead 6 (voice)" };
	
	/**
	 * A list of all colors available to color notes
	 */
	public static String[] colorTable = { "black", "darkyellow",
			"green", "red", "white", "yellow", "darkred", "darkgreen",
			"grey", "cyan", "blue", "darkblue", "darkmagenta", "darkcyan",
			"magenta" };	
	
	/**
	 * A list of all available note durations
	 */
	public static String[] durationTable = { "1", "2", "4", "8", "16", "32", "64", "128" };
	
	/**
	 * A list of all the octaves that can be represented
	 */
	public static int[] octaveTable = { -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
	
	/**
	 * A list of all available note pitches
	 */
	public static String[] noteTable = { "a", "b", "c", "d", "e", "f", "g" };
	
	/**
	 * A list of all note accidentals
	 */
	public static String[] noteAccidentals = { "is", "es", "isis", "eses" };
	
	
	/**
	 * Represents a Hash Map that will store the mapping of an octave in correct
	 * lilypond syntax
	 */
	public static Map<Integer, String> octaveMap = new HashMap<Integer, String>();

	/**
	 * Constructor for class. Available to make for easy access to storage tables
	 */
	public Reference()
	{
		populateOctaveMap();
	}

	/**
	 * Functions to add keys and values to the Octave Hash Map Maps a pitch
	 * octave to correct lilypond syntax
	 */
	public void populateOctaveMap()
	{
		octaveMap.put(-1, ",,,,");
		octaveMap.put(0, ",,,");
		octaveMap.put(1, ",,");
		octaveMap.put(2, ",");
		octaveMap.put(3, "");
		octaveMap.put(4, "'");
		octaveMap.put(5, "''");
		octaveMap.put(6, "'''");
		octaveMap.put(7, "''''");
		octaveMap.put(8, "'''''");
		octaveMap.put(9, "''''''");
	}

	/**
	 * Function to check a correct shape has been chosen
	 * 
	 * @param shape shape string to check
	 * @param tag 1: represents a note object is initialized for the first time.
	 *           0: represents its an additional change to a note object
	 * @return the shape if it is correct or a default
	 */
	public String checkShape(String shape, int tag)
	{
		for (int i = 0; i < shapeTable.length; i++)
		{
			if (shape.equals(shapeTable[i]))
			{
				return shape;
			}
		}
		if (tag == 1)
		{
			System.err.println("Warning: shape " + shape
				+ " is not a valid shape. System has defaulted to 'default' shape");
		}
		return shapeTable[0];
	}

	/**
	 * Function to check a correct instrument has been chosen
	 * 
	 * @param instrument instrument string to check
	 * @param tag 1: represents a note object is initialized for the first time.
	 *           0: represents its an additional change to a note object
	 * @return the instrument if it is correct or a default
	 */
	public String checkInstrument(String instrument, int tag)
	{
		for (int i = 0; i < instrumentTable.length; i++)
		{
			if (instrument.equals(instrumentTable[i]))
			{
				return instrument;
			}
		}
		if (tag == 1)
		{
			System.err
				.println("Warning: instrument "
					+ instrument
					+ " is not a valid instrument. System has defaulted to 'acoustic grand' instrument");
		}
		return instrumentTable[0];
	}

	/**
	 * Function to check a correct color has been chosen
	 * 
	 * @param color color string to check
	 * @param tag 1: represents a note object is initialized for the first time.
	 *           0: represents its an additional change to a note object
	 * @return the color if it is correct or a default
	 */
	public String checkColor(String color, int tag)
	{
		for (int i = 0; i < colorTable.length; i++)
		{
			if (color.equals(colorTable[i]))
			{
				return color;
			}
		}
		if (tag == 1)
		{
			System.err.println("Warning: color " + color
				+ " is not a valid color. System has defaulted to 'black' color");
		}
		return colorTable[0];
	}

	/**
	 * Function to check a correct octave has been chosen
	 * 
	 * @param octave octave to check
	 * @return the octave if it is correct or a default
	 */
	public int checkOctave(int octave)
	{
		for (int i = 0; i < octaveTable.length; i++)
		{
			if (octave == octaveTable[i])
			{
				return octave;
			}
		}
		System.err.println("Warning: octave " + octave
			+ " is not a valid octave. System has defaulted to '4' octave");
		return 4;
	}
}