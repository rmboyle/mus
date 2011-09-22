/**
 * Class that represents a sequence of notes and chords
 */
//*Richard*//
package lilypond;

import java.util.ArrayList;

public class Sequence
{
	public ArrayList<Chord> s;
	public boolean initialized;
	int count = 0;

	/**
	 * Constructor for Sequence, creates new ArrayList of Chords
	 */
	public Sequence()
	{
		s = new ArrayList<Chord>();
	}
	
	//*Jonathan*//
	
	/**
	 * Constructor to create a null Sequence
	 * 
	 * @param i tag i
	 */
	public Sequence(int i)
	{
	}
	
	//*Richard*//


	/**
	 * Adds a new Chord to the Sequence
	 * 
	 * @param newChord new Chord to be added
	 */
	public void add(Chord newChord)
	{
		s.add(newChord);
	}

	/**
	 * Gives a chord at a specified location.
	 * 
	 * @param loc integer location
	 * @return the Chord at the location
	 */
	public Chord chordAt(int loc)
	{
		try
		{
			return s.get(loc);
		}
		catch (IndexOutOfBoundsException e)
		{
			System.err.println("Warning: Chord " + loc
				+ " not found in specified sequence.");
		}
		return null;
	}
	
	/**
	 * Function to return the size of the sequence, number of chords.
	 * 
	 * @return integer size
	 */
	public int returnSize()
	{
		return s.size();
	}

	/**
	 * Function to return the note within a specified chord
	 * 
	 * @param chordLoc Chord location in sequence
	 * @param noteLoc Note location in specified sequence
	 * @return specified Note
	 */
	public Note noteAt(int chordLoc, int noteLoc)
	{
		return chordAt(chordLoc).noteAt(noteLoc);
	}

	/**
	 * Adds to sequence specified chords to be returned
	 * 
	 * @param chords integer array of chords to be returned
	 * @return returns new sequence
	 */
	public Sequence sequenceFrom(int[] chords)
	{
		Sequence seq = new Sequence();
		for (int i = chords.length - 1; i >= 0; i--)
		{
			seq.add(this.chordAt(chords[i]));
		}
		return seq;
	}

	/**
	 * Creates a subsequence from two specified start and end indices.
	 * 
	 * @param index1 start index
	 * @param index2 end index
	 * @return returns a Sequence subsequence
	 */
	public Sequence subsequence(int index1, int index2) // subsequence(5,0)
	{
		Sequence subsequence = new Sequence();
		for (int i = index1; i <= index2; i++)
		{
			if (this.chordAt(i) != null)
			{
				subsequence.add(this.chordAt(i));
			}
		}
		return subsequence;
	}

	//*Irene*//
	
	/**
	 * Creates a subsequence from a specified starting location
	 * 
	 * @param index1 start location
	 * @return returns a Sequence subsequence
	 */
	public Sequence subsequence(int index1) // subsequence(5)
	{
		if (index1 >= this.returnSize())
		{
			System.err.println("Warning: Index is out of bounds");
		}
		Sequence subsequence = new Sequence();
		for (int i = index1; i < this.returnSize(); i++)
		{
			if (this.chordAt(i) != null)
			{
				subsequence.add(this.chordAt(i));
			}
		}
		return subsequence;
	}

	/**
	 * Prints to standard out to check for memory locations of sequence
	 * 
	 * @return string of sequence data
	 */
	public String printSequence()
	{
		String sequence = "";
		try
		{
			for (int i = 0; i < this.returnSize(); i++)
			{
				sequence = sequence + this.chordAt(i).printChord() + " ";
			}
		}
		catch (NullPointerException e)
		{
			System.err.println("Warning: Index is out of bounds");
		}
		sequence = sequence + "\t[ " + this + " ]";
		return sequence;
	}

	/**
	 * Function to concatenate two specified sequence and return that sequence
	 * 
	 * @param sequence1 Sequence 1
	 * @param sequence2 Sequence 2
	 * @return new Sequence containing sequence1 and sequence2, in that order.
	 */
	static public Sequence concatenateSequences(Sequence sequence1,
		Sequence sequence2)
	{
		Sequence concatenation = new Sequence();
		for (int i = 0; i < sequence1.returnSize(); i++)
		{
			concatenation.add(sequence1.chordAt(i).cloneChord());
		}
		for (int i = 0; i < sequence2.returnSize(); i++)
		{
			concatenation.add(sequence2.chordAt(i).cloneChord());
		}
		return concatenation;
	}

	/**
	 * Clones data in sequence
	 * 
	 * @return cloned data
	 */
	public Sequence cloneSequence()
	{
		Sequence cloneSequence = new Sequence();
		for (int i = 0; i < this.returnSize(); i++)
		{
			cloneSequence.add(this.chordAt(i).cloneChord());
		}
		return cloneSequence;
	}
}
