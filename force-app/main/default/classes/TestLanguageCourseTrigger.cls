@isTest
private class TestLanguageCourseTrigger {
    @isTest 
    static void TestLanguageCourseTriggerOnInsert()
    {
        Language_Course_Instructor__c courseInstructor = new Language_Course_Instructor__c(Name='Juan');
        insert courseInstructor;
        Language_Course__c testLanguageCourse = new Language_Course__c(Name='English course', Course_Instructor__c=courseInstructor.Id);

        

        Test.startTest();
            Database.insert(testLanguageCourse);
        Test.stopTest();
    }

    @isTest 
    static void TestLanguageCourseTriggerOnUpdate()
    {
        Language_Course_Instructor__c courseInstructor = new Language_Course_Instructor__c(Name='Juan');
        insert courseInstructor;
        Language_Course__c testLanguageCourse = new Language_Course__c(Name= 'English course', Course_Instructor__c=courseInstructor.Id);
            
        insert testLanguageCourse;

        testLanguageCourse.Name = ('French course');

        Test.startTest();
        Database.update(testLanguageCourse);
        Test.stopTest();
    }

    @isTest 
    static void TestLanguageCourseTriggerOnDelete()
    {
        Language_Course_Instructor__c courseInstructor = new Language_Course_Instructor__c(Name='Juan');
        insert courseInstructor;
        Language_Course__c testLanguageCourse = new Language_Course__c(Name='English course', Course_Instructor__c=courseInstructor.Id);

        insert testLanguageCourse;

        Test.startTest();
            Database.delete(testLanguageCourse);
        Test.stopTest();
    }
}
