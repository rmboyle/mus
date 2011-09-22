/**
 * Class that represents a chord
 */
//*Richard*//
package lilypond;

public class Chord
{
	public Note[] Notes;
	public boolean initialized;

	/**
	 * Constructor for chord
	 * 
	 * @param notes array of notes
	 */
	public Chord(Note[] notes)
	{
		Notes = notes;
	}

	/**
	 * Empty constructor for chord
	 */
	public Chord()
	{
	}

	/**
	 * Adds a note to the chord
	 * 
	 * @param newNote note being added
	 */
	public void addNote(Note newNote)
	{
		Note[] newNotes = new Note[Notes.length + 1];
		newNotes[0] = newNote;
		for (int i = 1; i < Notes.length + 1; i++)
		{
			newNotes[i] = Notes[i - 1];
		}
		Notes = newNotes;
	}

	/**
	 * Writes the lilypond code for each chord
	 * 
	 * @return returning a string with lilypond code
	 */
	public String write()
	{
		String returnMe = "\n\\set Staff.midiInstrument = #\""
			+ Notes[0].Instrument + "\"\n" + "\\override NoteHead #'color = #"
			+ Notes[0].Color + "\n" + "\\override NoteHead #'style = #'"
			+ Notes[0].Shape + "\n" + "<";
		for (int i = 0; i < Notes.length; i++)
		{
			returnMe = returnMe.concat(Notes[i].Pitch
				+ Reference.octaveMap.get(Notes[i].Octave) + " ");
		}
		returnMe = returnMe.concat(">" + Notes[0].Duration + "\n");
		return returnMe;
	}

	/**
	 * Chord function that converts a note to a chord
	 * 
	 * @param note input a Note
	 * @return returns a Chord
	 */
	static public Chord convertNote(Note note)
	{
		Note[] oneNote = { note };
		Chord chord = new Chord(oneNote);
		return chord;
	}

	/**
	 * noteAt will return a note at a specified location in the chord
	 * 
	 * @param loc Note location
	 * @return returns a Note at specified location
	 */
	public Note noteAt(int loc)
	{
		try
		{
			return Notes[loc];
		}
		catch (ArrayIndexOutOfBoundsException e)
		{
			System.err.println("Warning: Note " + loc
				+ " not found in specified chord.");
		}
		return null;
	}

	/**
	 * Size of chord function, number of notes
	 * 
	 * @return integer size
	 */
	public int returnSize()
	{
		return Notes.length;
	}

	/**
	 * Prints the chord as standard output to check the memory location
	 * 
	 * @return returns a String of the chord data
	 */
	public String printChord()
	{
		String chord = "{ ";
		for (int i = 0; i < Notes.length; i++)
		{
			chord = chord + "\n\t\t" + Notes[i].printNote();
		}
		chord = chord + "\n\t}\t[ " + this + " ]";
		return chord;
	}

	/**
	 * Clones data in chord
	 * 
	 * @return cloned chord
	 */
	public Chord cloneChord()
	{
		Note[] cloneNotes = new Note[Notes.length];
		for (int i = 0; i < Notes.length; i++)
		{
			cloneNotes[i] = Notes[i].cloneNote();
		}
		Chord cloneChord = new Chord(cloneNotes);
		return cloneChord;
	}
}
