@isTest
private class RunOnInstall
{
    @isTest(OnInstall=true)
    static void testValidationCorrect()
    {
        Account acc=new Account(Name='Create Account Challenge',
                                    Type='Prospect');
        insert acc;

        Contact cont=new Contact(FirstName='Bob',
                                 LastName='Buzzard',
                                 AccountId=acc.Id);
        insert cont;                                 
    }
}