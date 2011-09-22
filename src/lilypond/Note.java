/**
 * Class that represents a note
 */
//*Irene*//
package lilypond;

public class Note
{
	public String Color, Shape, Pitch, Instrument;
	public int Duration;
	public int Octave;
	public boolean initialized;

	/**
	 * A note object constructor Also adds the correct syntax for accidentals to
	 * later be outputed in lilypond 'is' represents a sharp, 'isis' two sharps,
	 * 'es' a flat, 'eses' two flats
	 * 
	 * @param color the color assigned to the note
	 * @param shape the shape assigned to the note
	 * @param pitch the pitch of the note
	 * @param duration the duration of the note
	 * @param instrument the instrument assigned to the note
	 * @param octave the octave of the note
	 */
	public Note(String color, String shape, String pitch, int duration,
		String instrument, int octave)
	{
		// color
		Color = color;
		// shape
		Shape = shape;
		// pitch
		Pitch = pitch.toLowerCase();
		if (correctFormat() != true)
		{
			String newPitch = "";
			if (pitch.endsWith("#"))
			{
				newPitch = pitch.subSequence(0, 1) + "is";
			}
			if (pitch.endsWith("##"))
			{
				newPitch = pitch.subSequence(0, 1) + "isis";
			}
			if (pitch.endsWith("b"))
			{
				newPitch = pitch.subSequence(0, 1) + "es";
			}
			if (pitch.endsWith("bb"))
			{
				newPitch = pitch.subSequence(0, 1) + "es";
			}
			Pitch = newPitch.toLowerCase();
		}
		else
		{
			Pitch = pitch.toLowerCase();
		}
		// duration
		Duration = duration;
		// instrument
		Instrument = instrument;
		Octave = octave;
	}

	/**
	 * Dummy note constructor to check for errors
	 */
	public Note()
	{
	}

	/**
	 * Function to return duration of the note
	 * 
	 * @return the duration of the note
	 */
	public int length()
	{
		return Duration;
	}

	/**
	 * Checks if the pitch of the note is represented with a string in the
	 * correct format
	 * 
	 * @return true: pitch in correct format; false: pitch in wrong format
	 */
	public boolean correctFormat()
	{
		if (Pitch.endsWith("is") || Pitch.endsWith("isis")
			|| Pitch.endsWith("es") || Pitch.endsWith("eses")
			|| Pitch.length() == 1)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	/**
	 * Clones a note object. Meaning it creates a new object with the same
	 * attributes as 'this'
	 * 
	 * @return a new note object
	 */
	public Note cloneNote()
	{
		String cColor = this.Color;
		String cShape = this.Shape;
		String cPitch = this.Pitch;
		int cDuration = this.Duration;
		String cInstrument = this.Instrument;
		int cOctave = this.Octave;
		Note clone = new Note(cColor, cShape, cPitch, cDuration, cInstrument,
			cOctave);
		return clone;
	}

	/**
	 * Prints the note, used in error checking. Prints out the memory address of
	 * the note object
	 * 
	 * @return a string representing all the information in the note
	 */
	public String printNote()
	{
		String note = "";
		note = Pitch + Octave + "-" + Duration + " i:" + Instrument + " c:"
			+ Color + " :s" + Shape;
		note = note + "\t[ " + this + " ]";
		return note;
	}
}
