trigger LanguageCourseTrigger on Language_Course__c (after insert, after update, after delete) {


    if(Trigger.isInsert)
    {
        Language_Course__c languageCourse = [SELECT Name FROM Language_Course__c WHERE Id IN :Trigger.New];
        //Mandamos un email a Sales diciendo que hay un nuevo curso de idiomas
        EmailManager.sendMail('deimianyeah@gmail.com', 'Curso de idiomas', 'Se ha creado un nuevo curso de idiomas llamado ' + languageCourse.Name);
    }
    else if(Trigger.isUpdate)
    {
        Language_Course__c languageCourseNew = [SELECT Name FROM Language_Course__c WHERE Id IN :Trigger.New];
        for (Language_Course__c languageCourseOld : Trigger.old)
        {
            //Mandamos un email a Sales diciendo que se ha modificado un curso de idiomas
            EmailManager.sendMail('deimianyeah@gmail.com', 'Curso de idiomas', 'Se ha modificado el curso de idiomas llamado ' + languageCourseOld.Name +  ', ahora se llama ' +  languageCourseNew.Name);
        }
    }
    else if(Trigger.isDelete)
    {
        for (Language_Course__c languageCourse  : Trigger.old)
        {
            //Mandamos un email a Sales diciendo que se ha eliminado un curso de idiomas
            EmailManager.sendMail('deimianyeah@gmail.com', 'Curso de idiomas', 'Se ha eliminado el curso de idiomas llamado ' + languageCourse.Name);
        }
    }
}