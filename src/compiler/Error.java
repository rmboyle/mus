//*Jonathan*//
	
package compiler;

public class Error
{
	/**
	 * Type mismatch output for an operator
	 * 
	 * @param op operator that is mismatch
	 * @param type
	 */
	public static void mismatched(String op, String type)
	{
		System.err.println("Error: The " + op
			+ " operator isn't defined for type " + type + ".");
	}

	/**
	 * Output for errors where a variable is not declared or initialized
	 * 
	 * @param code Error code
	 * @param vName Variable name
	 */
	public static void declaredOrInitialized(int code, String vName)
	{
		System.err.println("Error: Variable " + vName + errorMessages[code]);
	}

	/**
	 * Error for output when variables are not of the same type
	 * 
	 * @param vName1 Variable1
	 * @param vName2 Variable2
	 */
	public static void sameType(String vName1, String vName2)
	{
		System.err.println("Error: Variable " + vName1 + " and " + vName2
			+ " are not of the same type.");
	}

	/**
	 * Error for output when a variable has already been declared
	 * 
	 * @param name Variable name
	 * @param type Variable type
	 */
	public static void alreadyDeclared(String name, String type)
	{
		System.err.println("Error: " + type + " " + name
			+ " has already been declared.");
	}

	/**
	 * Error output for null point
	 */
	public static void nullPointer()
	{
		System.err.println("Error: Null Pointer Exception");
	}

	/**
	 * Error output for variable being of wrong type
	 * 
	 * @param name Variable name
	 * @param type Specified type
	 */
	public static void isNot(String name, String type)
	{
		System.err.println("Error: " + name + " is not of type " + type + ".");
	}

	public static final int NOT_DECLARED = 0, NOT_INITIALIZED = 1;
	private static final String[] errorMessages = { " has not been declared.",
			" has not been initialized." };
}
