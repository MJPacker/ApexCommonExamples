/**
 * @description Application specific domain base class, customize fflib_SObjectDomain as needed. 
 */
public inherited sharing abstract class ApplicationDomain extends fflib_SObjectDomain{
    
    /**
     * @description Default constructor for ApplicationDomain class.
     * required for Test.createStub
     */
    public ApplicationDomain() {
        super();
    }
}