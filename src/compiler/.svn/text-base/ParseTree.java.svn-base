package compiler;

import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.StringTokenizer;
import lilypond.*;

//*Irene*//

public class ParseTree {

	static Variable variables = new Variable();
	static Reference reference = new Reference()  ;
	/**
	 * Constructor for Parse Tree
	 * Populates the reference table
	 */
	public ParseTree()
	{

		reference.populateOctaveMap() ;
	}
	/**
	 * Creates new note with attributes
	 * @param var_name Note variable name
	 * @param pitch Pitch value as a String
	 * @param octave Octave value
	 * @param duration Duration value
	 */
	public void NOTE(String var_name, String pitch, int octave, int duration)
	{//declares a new note
		if (variables.contains(var_name)){ //checks to see if variable is declared
			Object o = variables.returnVariable(var_name);
			Error.alreadyDeclared(var_name, o.getClass().getName());
		}
		//declare variable as Note
		else{
			Note note = new Note(reference.checkColor("",0), reference.checkShape("",0), pitch, duration,reference.checkInstrument("",0), octave);
			variables.addVariable(var_name, note) ;
			note.initialized = true;
			//System.out.println(var_name + " == " + note.printNote() + "\n");
		}
	}
	/**
	 * Creates new note with no attributes, null note, called from note
	 * @param name Note variable name
	 */
	public void NOTE(String name)
	{//declaring a Note without initializing it ->  Note a;
		if (variables.contains(name)){ //checks to see if variable is already declared
			Object o = variables.returnVariable(name);
			Error.alreadyDeclared(name, o.getClass().getName());
		}
		else { //adds a blank Note
			Note note = new Note();
			note.initialized = false;
			variables.addVariable(name, note);
		}
	}
	/**
	 * Re-initializes note that was already declared, called from note
	 * @param var_name Note variable name
	 * @param pitch Pitch String value
	 * @param octave Octave value
	 * @param duration Duration value
	 */
	public void INITIALIZE_NOTE(String var_name, String pitch, int octave, int duration)
	{//reinitializes a note
		if (variables.contains(var_name)){
			Object o = variables.returnVariable(var_name);
			//if variable is a Note, reinitialize it
			if (o instanceof lilypond.Note){
				variables.removeVariable(var_name);
				Note note = new Note(reference.checkColor("",0), reference.checkShape("",0), pitch, duration,reference.checkInstrument("",0), octave);
				variables.addVariable(var_name, note);
				note.initialized = true;
				//System.out.println(var_name + " == " + note.printNote() + "\n") ;
			}
			//if variable is of another type
			else
				Error.alreadyDeclared(var_name, o.getClass().getName());
		}
		//variable has not been declared
		else
			Error.declaredOrInitialized(Error.NOT_DECLARED, var_name);
	}
	/**
	 * Multiple Note function adding a new note variable to a chord, called from list_notes
	 * @param note Note variable name
	 * @param chord Chord variable name
	 * @return returns specified Chord with new note
	 */
	public Chord MULT_NOTES(String note, Chord chord)
	{//adding multiple notes to a chord. Called form list_notes
		//checking to see if variable note is a Note
		if(!variables.contains(note))
			Error.declaredOrInitialized(Error.NOT_DECLARED, note);
		else{//variable note is declared
			Object o = variables.returnVariable(note);
			if(o instanceof lilypond.Note){ //variable note is a Note
				Note n = (Note) o;
				if (chord != null){
					if (n.initialized == true) { //variable note is initialized
						Note addNote = n.cloneNote();
						chord.addNote(addNote);
						return chord;
					}
					else //variable note is not initialized
						Error.declaredOrInitialized(Error.NOT_INITIALIZED, note);
				}
				else
					Error.nullPointer();
			}
			else
				Error.isNot(note, "lilypond.Note");
		}
		return null;

	}
	/**
	 * Single Note addition to a chord function, called from list_notes
	 * @param note Note variable name
	 * @return returns new Chord with note
	 */
	public Chord ONE_NOTE(String note)
	{//Adding one note to a chord. Called from list_notes
		//checking to see if variable note is a Note
		if(!variables.contains(note))
			Error.declaredOrInitialized(Error.NOT_DECLARED, note);
		else {//variable note is declared
			Object o = variables.returnVariable(note);
			if (o instanceof lilypond.Note){
				Note n = (lilypond.Note) o;
				if (n.initialized == true){
					Note addNote = n.cloneNote();
					Chord chord = new Chord(new Note[]{addNote});
					return chord;
				}
				else
					Error.declaredOrInitialized(Error.NOT_INITIALIZED, note);
			}
			else
				Error.isNot(note, "lilypond.Note");
		}
		return null;
	}
	/**
	 * Creates new Chord containing a list_notes called from chord
	 * @param var_name Chord variable name
	 * @param list_notes List of notes
	 */
	public void CHORD(String var_name, Chord list_notes)
	{// declaring and initializing a chord. called from chord
		if (variables.contains(var_name)){ //variable is declared
			Object o = variables.returnVariable(var_name);
			Error.alreadyDeclared(var_name, o.getClass().getName());
		}
		else if (list_notes != null){ //variable is not declared
			Chord chord = list_notes;
			chord.initialized = true;
			variables.addVariable(var_name, chord);
			//System.out.println(var_name + " == " + chord.printChord() + "\n");
		}
	}
	/**
	 * Creates a new null Chord, called from chord
	 * @param var_name Chord variable name
	 */
	public void CHORD(String var_name)
	{//declaring a chord without initializing it
		if (variables.contains(var_name)){ //variable is declared
			Object o = variables.returnVariable(var_name);
			Error.alreadyDeclared(var_name, o.getClass().getName());
		}
		else {//variable isn't already declared
			Chord chord = new Chord();
			chord.initialized = false;
			variables.addVariable(var_name, chord);
		}
	}
	/**
	 * Re-initializes chord that was already declared, called from chord
	 * @param var_name Chord variable name
	 * @param list_notes List of notes
	 */
	public void INITIALIZE_CHORD(String var_name,  Chord list_notes){
		
		if (variables.contains(var_name)){ //variable is declared
			Object o = variables.returnVariable(var_name);
			if(o instanceof lilypond.Chord){
				if(list_notes!=null){
					Chord chord = list_notes;
					chord.initialized = true;
					variables.addVariable(var_name, chord);
					//System.out.println(var_name + " == " + chord.printChord() + "\n");
				}
			}
			else
				Error.alreadyDeclared(var_name, o.getClass().getName());
		}
		else
			Error.declaredOrInitialized(Error.NOT_DECLARED, var_name);
		
	}
	/**
	 *  Adds to a list of chords by concatenating the name to the current list, called from list_chords
	 * @param name1 New name to add
	 * @param name2 Current list of names
	 * @return Returns concatenated list
	 */
	public String MULT_CHORDS(int name1, String name2) {
		// TODO Auto-generated method stub
		return name2.concat(","+name1);
	}
	/**
	 * Adds to a list of chords one chord, called from list_chords
	 * @param name Chord name
	 * @return list
	 */
	public String ONE_CHORDS(int name) {
		// TODO Auto-generated method stub
		return Integer.toString(name);
	}
	/**
	 * Creates a new sequence, called from sequence
	 * @param var_name Sequence variable name
	 */
	public void SEQUENCE(String var_name)
	{//declaring and initializing a sequence
		if (variables.contains(var_name)) {
			Object o = variables.returnVariable(var_name);
			Error.alreadyDeclared(var_name, o.getClass().getName());
		}
		else {
			Sequence sequence = new Sequence();
			variables.addVariable(var_name, sequence);
			sequence.initialized = true;
			//System.out.println(var_name +" == " + sequence.printSequence() +"\n");
		}
	}
	/**
	 * Creates a new null sequence, called from sequence
	 * @param name Sequence variable name
	 */
	public void SEQ(String name)
	{//declaring without initializing
		if (variables.contains(name)){
			Object o = variables.returnVariable(name);
			Error.alreadyDeclared(name, o.getClass().getName());
		}
		else {
			Sequence seq = new Sequence(1);
			seq.initialized = false;
			variables.addVariable(name,seq);
			System.err.println(seq + " has been declared but not initialized.");
		}
	}
	/**
	 * Adds to a sequence a list of variables (chords, notes, sequences), called from add_to_sequence
	 * @param sequence_name Sequence variable name
	 * @param variableList Variable list
	 */
	public void ADD_TO_SEQUENCE(String sequence_name, ArrayList<Object> variableList)
	{
		Object o = variables.returnVariable(sequence_name);
		if(variables.contains(sequence_name)){

			if(o instanceof lilypond.Sequence){
				Sequence sequence = (Sequence) variables.returnVariable(sequence_name) ;
				if(sequence.initialized){
					if(variableList!=null){
						for(int i = variableList.size() - 1 ; i >= 0 ; i--)
						{
							Object object = variableList.get(i) ;

							if(object instanceof lilypond.Note)
							{
								Note note = (Note) object ;
								Note inputNote = note.cloneNote() ;

								sequence.add(Chord.convertNote(inputNote)) ; 
							}
							if(object instanceof lilypond.Chord)
							{
								Chord chord = (Chord) object ;
								Chord inputChord = chord.cloneChord() ;

								sequence.add(inputChord) ;
							}
							if(object instanceof lilypond.Sequence)
							{
								Sequence sequencetoAdd = (Sequence) object ;
								sequence = Sequence.concatenateSequences(sequence, sequencetoAdd) ;
								sequence.initialized=true;
								variables.removeVariable(sequence_name) ;
								variables.addVariable(sequence_name, sequence) ;
							}
						}
					}
				}
				else
					Error.declaredOrInitialized(Error.NOT_INITIALIZED, sequence_name);
				//System.out.println(sequence_name + " == " + sequence.printSequence() + "\n") ;
			}
			else if(o==null){
				Error.declaredOrInitialized(Error.NOT_DECLARED, sequence_name);
			}
			else{
				Error.mismatched("Add to sequence", o.getClass().getName());
			}

		}
		else{
			Error.declaredOrInitialized(Error.NOT_DECLARED, sequence_name);
		}

//*Richard*//

	}
	/**
	 * Returns a chord in a specified sequence, called from chord_to_sequence
	 * @param name1 Sequence variable name
	 * @param num Chord number in specified sequence
	 * @return Returns specified chord
	 */
	public Chord CHORD_IN_SEQ(String name1, int num) {
		// TODO Auto-generated method stub
		Object o = variables.returnVariable(name1);

		if(o instanceof lilypond.Sequence){
			Sequence s = (Sequence) o;
			if(s.initialized)
				return s.chordAt(num);
			else{
				Error.declaredOrInitialized(Error.NOT_INITIALIZED, name1);
				return null;
			}
		}
		else{
			if(!variables.contains(name1))
				Error.declaredOrInitialized(Error.NOT_DECLARED, name1);
			else
				Error.mismatched("Chord In Sequence", o.getClass().getName());
			return null;
		}
	}
	/**
	 * Returns a note in a specified sequence, called from note_in_seq
	 * @param name1 Sequence variable name
	 * @param num_chord Chord number in specified sequence
	 * @param num_note Note number in specified chord
	 * @return Returns specified note
	 */
	public Note NOTE_IN_SEQ(String name1, int num_chord, int num_note) {
		// TODO Auto-generated method stub
		Object o = variables.returnVariable(name1);
		if(o instanceof lilypond.Sequence){
			Sequence s = (Sequence) o;
			if(s.initialized)
				return s.chordAt(num_chord).noteAt(num_note);
			else{
				Error.declaredOrInitialized(Error.NOT_INITIALIZED, name1);
				return null;
			}
		}
		else
		{
			if(!variables.contains(name1))
				Error.declaredOrInitialized(Error.NOT_DECLARED, name1);
			else
				Error.mismatched("Note In Sequence",o.getClass().getName());
			return null;
		}
	}
	/**
	 * Subsequence function to return a subsequence of a specified sequence with a start and end index, called from sub_seq
	 * @param name Sequence variable name
	 * @param num1 Start index
	 * @param num2 End index
	 * @return Returns a sequence subsequence
	 */
	public Sequence SUB_SEQ(String name, int num1,int num2) {
		Object o = variables.returnVariable(name);
		if(variables.contains(name)){
			if(o instanceof lilypond.Sequence){
				Sequence s = (Sequence) variables.returnVariable(name);
				if(s.initialized){
					return s.subsequence(num1, num2);
				}
				else
				{
					Error.declaredOrInitialized(Error.NOT_INITIALIZED, name);
					return null;
				}
			}
			else{
				Error.mismatched("Subsequence", o.getClass().getName());
				return null;
			}
		}
		else{
			Error.declaredOrInitialized(Error.NOT_DECLARED, name);
			return null;
		}
	}
	/**
	 * Subset function to return a sequence of a specified list of chords, called from sub_seq
	 * @param name Sequence variable name
	 * @param chordlist List of chords to add to the sequence
	 * @return Returns a sequence subset
	 */
	public Sequence SUB_SET(String name, String chordlist) {
		// TODO Auto-generated method stub
		Object o = variables.returnVariable(name);
		if(variables.contains(name)){
			if(o instanceof lilypond.Sequence){
				Sequence s = (Sequence) variables.returnVariable(name);
				if(s.initialized){
					StringTokenizer toke = new StringTokenizer(chordlist,","); 
					int num = toke.countTokens();
					int[]chordslist = new int[num];
					for(int i = 0;i<num;i++){
						chordslist[i] = Integer.parseInt(toke.nextToken());
					}
					return s.sequenceFrom(chordslist);
				}
				else{
					Error.declaredOrInitialized(Error.NOT_INITIALIZED, name);
					return null;
				}
			}
			else{
				Error.mismatched("Subset", o.getClass().getName());
				return null;
			}
		}
		else{
			Error.declaredOrInitialized(Error.NOT_DECLARED, name);
			return null;
		}
	}
	/**
	 * Concatenation function of two specified sequences, called from concat_seq
	 * @param s1 Sequence variable name 1
	 * @param s2 Sequence variable name 2
	 * @return Concatenation sequence of s1 and s2
	 */
	public Sequence CONCAT_SEQ(String s1, String s2){

		Object o1 = variables.returnVariable(s1);
		Object o2 = variables.returnVariable(s2);
		if(variables.contains(s1) && variables.contains(s2)){

			if(o1 instanceof lilypond.Sequence && o2 instanceof lilypond.Sequence){
				Sequence newS, sequence1, sequence2;
				sequence1 = (Sequence) variables.returnVariable(s1);
				sequence2 = (Sequence) variables.returnVariable(s2);
				if(sequence1.initialized || sequence2.initialized){
					newS = Sequence.concatenateSequences(sequence1, sequence2);

					//System.out.println(newS.printSequence());


					return newS ;
				}
				else
				{
					if(!sequence1.initialized)
						Error.declaredOrInitialized(Error.NOT_INITIALIZED, s1);
					if(!sequence2.initialized)
						Error.declaredOrInitialized(Error.NOT_INITIALIZED,s2);
					return null;
				}
			}
			else{
				if(!(o1 instanceof lilypond.Sequence)){
					Error.mismatched("Concatenated Sequence", o1.getClass().toString());
				}
				if(!(o2 instanceof lilypond.Sequence)){
					Error.mismatched("Concatenated Sequence", o2.getClass().toString());
				}
				return null;
			}
		}
		else{
			if(!variables.contains(s1)){
				Error.declaredOrInitialized(Error.NOT_DECLARED, s1);
			}
			if(!variables.contains(s2)){
				Error.declaredOrInitialized(Error.NOT_DECLARED, s2);
			}
			return null;
		}


	}
	/**
	 * Adds one variable to the ArrayList for adding to a sequence in add_to_sequence, called from list_variables
	 * @param name Variable name to be added to list
	 * @return Returns the list
	 */
	public ArrayList<Object> ONE_VARIABLE(String name)
	{

		ArrayList<Object> variableList = new ArrayList<Object>() ;

		Object object = variables.returnVariable(name) ;
		if(object!=null){
			variableList.add(object) ;
			return variableList ;
		}
		else{
			Error.declaredOrInitialized(Error.NOT_DECLARED, name);
			return null;
		}

	}
	/**
	 * Adds a variable to an ArrayList that has already been created in add_to_sequence, called from list_variables
	 * @param var_left Variable name to be added to list
	 * @param variableList Current variable list
	 * @return Returns the list
	 */
	public ArrayList<Object> MULT_VARIABLES(String var_left, ArrayList<Object> variableList)
	{
		Object object = variables.returnVariable(var_left) ;
		if(object!=null){
			variableList.add(object) ;

			return variableList ;
		}
		else{
			Error.declaredOrInitialized(Error.NOT_DECLARED, var_left);
			return null;
		}
	}
	/**
	 * Adds an object to an ArrayList for adding to a sequence in add_to_sequence, called from list_variables
	 * @param object Variable object name to be added
	 * @return Returns the list
	 */
	public ArrayList<Object> ONE_VARIABLE_N(Object object)
	{		
		ArrayList<Object> variableList = new ArrayList<Object>() ;

		variableList.add(object) ;
		return variableList ;


	}
	/**
	 * Adds an object to an ArrayList that has already been created in add_to_sequence, called from list_variables
	 * @param object Variable object name to be added
	 * @param variableList Current variable list
	 * @return Returns the list
	 */
	public ArrayList<Object> MULT_VARIABLE_N(Object object, ArrayList<Object> variableList)
	{
		variableList.add(object) ;
		return variableList ;


//*Jonathan*//
		
	}
	/**
	 * Changes the attribute color of a specified note, called from assign
	 * @param var_name Note variable name
	 * @param attribute Color attribute name
	 */
	public void ATTRIBUTE_COLOR(String var_name, String attribute)
	{
		if (variables.contains(var_name)){
			Object o = variables.returnVariable(var_name);
			if(o instanceof lilypond.Note){
				Note note = (lilypond.Note) o;
				if (note.initialized == true){
					note.Color = reference.checkColor(attribute,1);
					//System.out.println(note.printNote());
				}
				else
					Error.declaredOrInitialized(Error.NOT_INITIALIZED, var_name);
			}
			else
				Error.mismatched("<", o.getClass().getName());
		}
		else
			Error.declaredOrInitialized(Error.NOT_DECLARED, var_name);
	}
	/**
	 * Changes the attribute instrument of a specified note, called from assign
	 * @param var_name Note variable name
	 * @param attribute Instrument attribute name
	 */
	public void ATTRIBUTE_INSTRUMENT(String var_name, String attribute)
	{
		if (variables.contains(var_name)){
			Object o = variables.returnVariable(var_name);
			if(o instanceof lilypond.Note){
				Note note = (lilypond.Note) o;
				if (note.initialized == true){
					note.Instrument = reference.checkInstrument(attribute,1);
					//System.out.println(note.printNote());
				}
				else
					Error.declaredOrInitialized(Error.NOT_INITIALIZED, var_name);
			}
			else
				Error.mismatched("<", o.getClass().getName());
		}
		else
			Error.declaredOrInitialized(Error.NOT_DECLARED, var_name);
	}
	/**
	 * Changes the attribute shape of a specfied note, called from assign
	 * @param var_name Note variable name
	 * @param attribute Shape attribute name
	 */
	public void ATTRIBUTE_SHAPE(String var_name, String attribute)
	{
		if (variables.contains(var_name)){
			Object o = variables.returnVariable(var_name);
			if(o instanceof lilypond.Note){
				Note note = (lilypond.Note) o;
				if (note.initialized == true){
					note.Shape = reference.checkShape(attribute,1);
					//System.out.println(note.printNote());
				}
				else
					Error.declaredOrInitialized(Error.NOT_INITIALIZED, var_name);
			}
			else
				Error.mismatched("<", o.getClass().getName());
		}
		else
			Error.declaredOrInitialized(Error.NOT_DECLARED, var_name);
	}
	/**
	 * Assigns a note to a note, called from var
	 * @param name1 String Note variable name 1
	 * @param name2 String Note variable name 2
	 * @param create Boolean tag if name1 needs to be created
	 */
	public void ASSIGN_VAR_NOTE(String name1, String name2, boolean create){
		Object o2 = variables.returnVariable(name2);
		Object o1 = variables.returnVariable(name1);
		if(o2 instanceof lilypond.Note){
			if(create){
				if(!variables.contains(name1)){
					Note v1 ;

					Note v2 =(Note) variables.returnVariable(name2);
					if(v2.initialized){
						v1 = v2.cloneNote();
						variables.addVariable(name1, v1);
						//System.out.println(v1.printNote()+ "=="+ v2.printNote());
					}
					else
						Error.declaredOrInitialized(Error.NOT_INITIALIZED, name2);
				}
				else
					Error.alreadyDeclared(name1,o1.getClass().getName());
			}
			else{
				if(o1 instanceof lilypond.Note){
					Note v1 ;
					Note v2 =(Note) variables.returnVariable(name2);
					if(v2.initialized){
						v1 = v2.cloneNote();
						variables.removeVariable(name1);
						variables.addVariable(name1, v1);
						//System.out.println(v1.printNote()+ "=="+ v2.printNote());
					}
					else
						Error.declaredOrInitialized(Error.NOT_INITIALIZED, name2);
				}
				else
					Error.mismatched("Assign note", o1.getClass().getName());
			}
		}
		else
		{
			if(!variables.contains(name2)){
				Error.declaredOrInitialized(Error.NOT_DECLARED, name2);
			}
			else
				Error.mismatched("Assign note", o2.getClass().getName());
		}
	}
	/**
	 * Assigns a note to a note, called from var
	 * @param name1 String Note variable name 1
	 * @param name2 Note variable name 2
	 * @param create Boolean tag if name1 needs to be created
	 */
	public void ASSIGN_VAR_NOTE(String name1, Note name2, boolean create) {
		// TODO Auto-generated method stub
		Object o1 = variables.returnVariable(name1);

		if(create){
			if(!variables.contains(name1)){
				if(name2.initialized){
					Note v1 = name2.cloneNote();
					variables.addVariable(name1, v1);
					//System.out.println(v1.printNote()+ "=="+ name2.printNote());
				}
				else
					Error.nullPointer();
			}
			else{
				Error.alreadyDeclared(name1,o1.getClass().getName());
			}
		}
		else{
			if(o1 instanceof lilypond.Note){
				Note v1 = name2.cloneNote();
				if(name2.initialized){
					variables.removeVariable(name1);
					variables.addVariable(name1, v1);
					//System.out.println(v1.printNote()+ "=="+ name2.printNote());
				}
				else
					Error.nullPointer();
			}
			else{
				Error.mismatched("Assign note", o1.getClass().getName());
			}
		}
	}
	/**
	 * Assigns a chord to a chord, called from var
	 * @param name1 String Chord variable name 1
	 * @param name2 String Chord variable name 2
	 * @param create Boolean tag if name1 needs to be created
	 */
	public void ASSIGN_VAR_CHORD(String name1, String name2, boolean create){
		Object o2 = variables.returnVariable(name2);
		Object o1 = variables.returnVariable(name1);
		if(o2 instanceof lilypond.Chord){
			if(create){
				if(!variables.contains(name1)){
					Chord v1;
					Chord v2 =(Chord) variables.returnVariable(name2);
					if(v2.initialized){
						v1 = v2.cloneChord();
						variables.addVariable(name1, v1);
						//System.out.println(v1.printChord()+ "=="+ v2.printChord());
					}
					else
						Error.declaredOrInitialized(Error.NOT_INITIALIZED, name2);
				}
				else
				{
					Error.alreadyDeclared(name1,o1.getClass().getName());
				}
			}
			else{
				if(o1 instanceof lilypond.Note){
					Chord v1;
					Chord v2 =(Chord) variables.returnVariable(name2);
					if(v2.initialized){
						v1 = v2.cloneChord();
						variables.removeVariable(name1);
						variables.addVariable(name1, v1);
						//System.out.println(v1.printChord()+ "=="+ v2.printChord());
					}
					else{
						Error.declaredOrInitialized(Error.NOT_INITIALIZED, name2);
					}
				}
				else{
					Error.mismatched("Assign chord", o1.getClass().getName());
				}

			}
		}
		else
		{
			if(!variables.contains(name2)){
				Error.declaredOrInitialized(Error.NOT_DECLARED, name2);
			}
			else{
				Error.mismatched("Assign chord", o2.getClass().getName());
			}
		}
	}
	/**
	 * Assigns a chord to a chord, called from var
	 * @param name1 String Chord variable name 1
	 * @param name2 Chord variable name 2
	 * @param create Boolean tag if name1 needs to be created
	 */
	public void ASSIGN_VAR_CHORD(String name1, Chord name2, boolean create) {
		// TODO Auto-generated method stub
		Object o1 = variables.returnVariable(name1);
		if(create){
			if(!variables.contains(name1)){
				Chord v1;
				if(name2.initialized){
					v1 = name2.cloneChord();
					variables.addVariable(name1, v1);
					//System.out.println(v1.printChord()+ "=="+ name2.printChord());
				}
				else
					Error.nullPointer();
			}
			else{
				Error.alreadyDeclared(name1,o1.getClass().getName());
			}
		}
		else{
			if(o1 instanceof lilypond.Chord){
				Chord v1;
				if(name2.initialized){
					v1 = name2.cloneChord();
					variables.removeVariable(name1);
					variables.addVariable(name1, v1);
					//System.out.println(v1.printChord()+ "=="+ name2.printChord());
				}
				else{
					Error.nullPointer();
				}
			}
			else
				Error.mismatched("Assign chord", o1.getClass().getName());
		}
	}
	
	//*Taylor*//
	
	/**
	 * Assigns a sequence to a sequence, called from var
	 * @param name1 String Sequence variable name 1
	 * @param name2 String Sequence variable name 2
	 * @param create Boolean tag if name1 needs to be created
	 */
	public void ASSIGN_VAR_SEQ(String name1, String name2, boolean create){
		Object o2 = variables.returnVariable(name2);
		Object o1 = variables.returnVariable(name1);
		if(o2 instanceof lilypond.Sequence){
			if(create){
				if(!variables.contains(name1)){
					Sequence v1;

					Sequence v2 =(Sequence) variables.returnVariable(name2);
					if(v2.initialized){
						v1 = v2.cloneSequence();
						variables.addVariable(name1, v1);
						//System.out.println(v1.printSequence()+ "=="+ v2.printSequence());
					}
					else
						Error.declaredOrInitialized(Error.NOT_INITIALIZED, name2);
				}
				else
					Error.alreadyDeclared(name1,o1.getClass().getName());
			}
			else{
				if(o1 instanceof lilypond.Sequence){
					Sequence v1;
					Sequence v2 =(Sequence) variables.returnVariable(name2);
					if(v2.initialized){
						v1 = v2.cloneSequence();
						variables.addVariable(name1, v1);
						//System.out.println(v1.printSequence()+ "=="+ v2.printSequence());
					}
					else
						Error.declaredOrInitialized(Error.NOT_INITIALIZED, name2);
				}
				else
					Error.mismatched("Assign sequence", o1.getClass().getName());	
			}
		}
		else{
			if(!variables.contains(name2)){
				Error.declaredOrInitialized(Error.NOT_DECLARED, name2);
			}
			else
				Error.mismatched("Assign sequence", o2.getClass().getName());
		}
	}
	/**
	 * Assigns a sequence to a sequence, called from var
	 * @param name1 String Sequence variable name 1
	 * @param name2 Sequence variable name 2
	 * @param create Boolean tag if name1 needs to be created
	 */
	public void ASSIGN_VAR_SEQ(String name1, Sequence name2, boolean create) {
		// TODO Auto-generated method stub
		Object o1 = variables.returnVariable(name1);
		if(create){
			if(!variables.contains(name1)){
				if(name2.initialized){
					Sequence v1 = name2.cloneSequence();

					variables.addVariable(name1, v1);
					//System.out.println(v1.printSequence()+ "=="+ name2.printSequence());
				}
				else
					Error.nullPointer();
			}
			else
				Error.alreadyDeclared(name1,o1.getClass().getName());
		}
		else{
			if(o1 instanceof lilypond.Sequence){
				if(name2.initialized){
					Sequence v1 = name2.cloneSequence();
					variables.removeVariable(name1);
					variables.addVariable(name1, v1);
					//System.out.println(v1.printSequence()+ "=="+ name2.printSequence());
				}
				else
					Error.nullPointer();
			}
			else
				Error.mismatched("Assign sequence", o1.getClass().getName());
		}
	}
	/**
	 * Assigns a variable to a variable, checks to see which type is being assigned, called from var
	 * @param name1 String var name 1
	 * @param name2 String var name 2
	 */
	public void ASSIGN_VAR(String name1, String name2){ // ADD error of "a=ASSIGN"

		//check to see if they are of the same type
		Object o1 = variables.returnVariable(name1);
		Object o2 = variables.returnVariable(name2);
		if(variables.contains(name1)&&variables.contains(name2)){
			if(o1 instanceof lilypond.Note && o2 instanceof lilypond.Note)
			{
				Note v2 =(Note) o2 ;
				if(v2.initialized){
					Note v1 = v2.cloneNote();

					variables.removeVariable(name1) ; //add error here
					variables.addVariable(name1, v1) ;
					//System.out.println(v1.printNote()+ "=="+ v2.printNote());
				}
				else
					Error.declaredOrInitialized(Error.NOT_INITIALIZED, name2);
			}
			else if(o1 instanceof lilypond.Chord&& o2 instanceof lilypond.Chord)
			{
				Chord v2 =(Chord) o2 ;
				if(v2.initialized){
					Chord v1 = v2.cloneChord();

					variables.removeVariable(name1) ;
					variables.addVariable(name1, v1) ;
					//System.out.println(v1.printChord()+ "=="+ v2.printChord());
				}
				else
					Error.declaredOrInitialized(Error.NOT_INITIALIZED, name2);
			}
			else if(o1 instanceof lilypond.Sequence&& o2 instanceof lilypond.Sequence)
			{
				Sequence v2 =(Sequence) o2 ;
				if(v2.initialized){
					Sequence v1 = v2.cloneSequence();

					variables.removeVariable(name1) ;
					variables.addVariable(name1, v1) ;
					//System.out.println(v1.printSequence()+ "=="+ v2.printSequence());
				}
				else
					Error.declaredOrInitialized(Error.NOT_INITIALIZED, name2);
			}
			else if(o1 instanceof Integer) ///ERROR CHECKING!
			{
				int v1 = (Integer) o1;

				variables.removeVariable(name1);
				variables.addVariable(name1, v1);
			}
			else if(o1 instanceof Boolean)
			{
				boolean v1 = (Boolean) o1;

				variables.removeVariable(name1);
				variables.addVariable(name1, v1);
			}
			else{
				Error.sameType(name1, name2);
			}

		}
		else
		{
			if(!variables.contains(name1)){
				Error.declaredOrInitialized(Error.NOT_DECLARED, name1);
				if(!variables.contains(name2)){
					Error.declaredOrInitialized(Error.NOT_DECLARED, name2);
				}
			}
			else if(!variables.contains(name2)){
				if(!variables.contains(name1))
					Error.declaredOrInitialized(Error.NOT_DECLARED, name1);
				Error.declaredOrInitialized(Error.NOT_DECLARED, name2);
			}
			else{
				Error.sameType(name1, name2);
			}
		}


	}

	//*Farbound*//

	/**
	 * Foreach function to change all the shapes in a specified sequence, called from foreach
	 * @param name Sequence variable name
	 * @param attribute Shape attribute name
	 */
	public void FOREACH_SHAPE(String name, String attribute) {
		// TODO Auto-generated method stub
		Object o = variables.returnVariable(name);
		if(o instanceof lilypond.Sequence){
			Sequence s = (Sequence) o;
			if(s.initialized){
				Iterator<Chord> it = s.s.iterator();
				while(it.hasNext()){
					Chord temp = it.next();
					for(int j = 0; j< temp.Notes.length;j++){
						temp.Notes[j].Shape = reference.checkShape(attribute, 1);
					}
				}
			}
			else
				Error.declaredOrInitialized(Error.NOT_INITIALIZED, name);
		}

		else{
			Error.mismatched("foreach", o.getClass().getName());
		}
	}
	/**
	 * Foreach function to change all the colors in a specified sequence, called from foreach
	 * @param name Sequence variable name
	 * @param attribute Color attribute name
	 */
	public void FOREACH_COLOR(String name, String attribute) {
		// TODO Auto-generated method stub
		Object o = variables.returnVariable(name);
		if(o instanceof lilypond.Sequence){
			Sequence s = (Sequence) o;
			if(s.initialized){
				Iterator<Chord> it = s.s.iterator();
				while(it.hasNext()){
					Chord temp = it.next();
					for(int j = 0; j< temp.Notes.length;j++){
						temp.Notes[j].Color = reference.checkColor(attribute, 1);
					}
				}
			}
			else
				Error.declaredOrInitialized(Error.NOT_INITIALIZED, name);
		}

		else{
			Error.mismatched("foreach", o.getClass().getName());
		}
	}	
	/**
	 * Foreach function to change all the instruments in a specified sequence, called from foreach
	 * @param name Sequence variable name
	 * @param attribute Instrument attribute name
	 */
	public void FOREACH_INSTRUMENT(String name, String attribute) {
		// TODO Auto-generated method stub
		Object o = variables.returnVariable(name);
		if(o instanceof lilypond.Sequence){
			Sequence s = (Sequence) o;
			if(s.initialized){
				Iterator<Chord> it = s.s.iterator();
				while(it.hasNext()){
					Chord temp = it.next();
					for(int j = 0; j< temp.Notes.length;j++){
						temp.Notes[j].Instrument = reference.checkInstrument(attribute, 1);
					}
				}
			}
			else
				Error.declaredOrInitialized(Error.NOT_INITIALIZED, name);
		}

		else{
			Error.mismatched("foreach", o.getClass().getName());
		}
	}
	/**
	 * Changes the duration of a specified note, called from change_duration
	 * @param name Note variable name
	 * @param num Duration change integer
	 */
	public void CHANGE_DURATION(String name, int num)
	{
		if(!variables.contains(name)) //variable name is not declared
			Error.declaredOrInitialized(Error.NOT_DECLARED, name);
		else{ //variable is declared
			Object o = variables.returnVariable(name);
			if (o instanceof lilypond.Note){ //checks if variable is a note
				Note note = (lilypond.Note) o;
				if (note.initialized == false) //variable has not been initialized
					Error.declaredOrInitialized(Error.NOT_INITIALIZED, name);
				else{ //variable has been initialized
					note.Duration = num;
				}
			}
			else //variable is not of type lilypond.Note
				Error.mismatched("^", o.getClass().getName());
		}
	}
	/**
	 * Displays the specified sequence, called from display
	 * @param var_name Sequence variable name
	 * @param header Header string to be displayed
	 * @throws IOException
	 */
	public void DISPLAY(String var_name, String header) throws IOException
	{
		Object o = variables.returnVariable(var_name);

		if(o instanceof lilypond.Sequence && header instanceof String){
			Sequence outputS = (Sequence) o ;
			if(outputS.initialized){
				LilypondConvert.writeFiles(outputS,header) ;

				LilypondConvert.executeLilypond() ;
			}
			else
				Error.declaredOrInitialized(Error.NOT_INITIALIZED, var_name);
		}
		else
		{
			if(o==null)//checks if variable is null
				Error.declaredOrInitialized(Error.NOT_DECLARED, var_name);
			else
				Error.mismatched("display", o.getClass().getName());
		}
	}

	public static class Variable
	{
		LinkedHashMap<String, Object> variables ;

		/**
		 * Constructor for Variable table, creates LinkedHashMap of variables
		 */
		public Variable()
		{
			variables = new LinkedHashMap<String, Object>() ;
		}
		/**
		 * Adds a variable to the variable table
		 * @param name Variable name
		 * @param object Object type
		 */
		public void addVariable(String name, Object object)
		{
			variables.put(name, object) ;	
		}
		/**
		 * Removes specified variable from the variable table
		 * @param name Variable name
		 */
		public void removeVariable(String name)
		{
			variables.remove(name) ;
		}
		/**
		 * Returns specified variable from variable table
		 * @param name Variable name
		 * @return specified variable
		 */
		public Object returnVariable(String name)
		{
			Object variable = variables.get(name) ;						
			return variable ;
		}	
		/**
		 * Boolean function that returns true if the specified variable is in the the variable list
		 * @param name Variable name
		 * @return true/false
		 */
		public boolean contains(String name){
			return variables.containsKey(name);
		}
	}


}
