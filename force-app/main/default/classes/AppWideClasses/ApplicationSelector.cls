/**
 * @description Abstract class for selecting SObject records with common functionality.
 */
public with sharing abstract class ApplicationSelector extends fflib_SObjectSelector{
    /**
     * @description Default constructor for ApplicationSelector class.
     * Initializes the selector with default settings.
     */
    public ApplicationSelector() {
        this(false);
    }

    /**
     * @description Constructor for ApplicationSelector class with option to include field set fields.
     * @param includeFieldSetFields Boolean indicating whether to include fields from field sets.
     */
    public ApplicationSelector(Boolean includeFieldSetFields){
        //Application follows the pattern of least privileged execution, so user mode is defaulted on
        this(includeFieldSetFields, fflib_SObjectSelector.DataAccess.USER_MODE);
    }

    /**
     * @description Constructor for ApplicationSelector class with options to include field set fields and specify data access mode.
     * @param includeFieldSetFields Boolean indicating whether to include fields from field sets.
     * @param dataAccessMode Enum specifying the data access mode (USER_MODE or SYSTEM_MODE).
     */
    public ApplicationSelector(Boolean includeFieldSetFields, fflib_SObjectSelector.DataAccess dataAccessMode){
       //Allow override of default user mode by passing in data access mode
        super(includeFieldSetFields, dataAccessMode);
        //Disable sorting of select fields in the resulting SOQL improvements performance
        unsortedSelectFields();
    }

    /**
     * @description Abstract method to get the list of SObject fields to be queried.
     * @return List of SObject fields to be queried.
     */
    public abstract List<Schema.SObjectField> getSObjectFieldList();

    /**
     * @description Abstract method to get the SObject type to be queried.
     * @return Schema.SObjectType to be queried.
     */
    public abstract Schema.SObjectType getSObjectType();
}