/* Extensions are a programming model where functionality is defined as an addition
to existing objects and defines how they are different or modify the behavior of the
solution*/

/****************Main Objects****************
Table;Page;Report;CodeUnit;XmlPort;Query
*/

/*
   Tables are the core objects used to store data in Dynamics 365 Business Central. 
   No matter how data is registered in the product - from a web service to a finger
    swipe on the phone app, the results of that transaction will be recorded in a 
    table.

    Only tables with the Extensible Property set to true can be extended
*/

/*Pages

 In Dynamics 365 Business Central, pages are the main way to display and 
 organize data. Pages are the primary object that a user will interact 
 with and have 
 a different behavior based on the type of page that you choose. Pages are designed 
 independently of the device they are to be rendered on,
  and in this way the same page 
 can be reused across phone, tablet, and web clients.
 */
/*
Reports are used to print or display information from a database. 
You can use a report to structure and summarize information, 
and to print documents, such as sales quotes and invoices.

*/

/*

Queries

Business Central query objects enable you to retrieve records from one or more 
tables and then combine the data into rows and columns in a single dataset. 
Query objects can also perform calculations on data, such finding the sum or 
average of all values in a column of the dataset.


*/


/*XMLports are used to export and import data between an external source and
 Dynamics 365 Business Central. Sharing data between different computer systems
  is seamless when it is shared in an XML format. Working with XML files can be 
  tedious so the details of how the XML file is handled are encapsulated in XMLports.
*/

/*
A codeunit is a container for AL code that you can use in many application objects.
 You typically implement business logic in codeunits and call the codeunit 
 from the object that needs to perform that specific logic.

*/

//  TableExtension;TableKeys;Enums;PageExtension;PageCustomization;Profile;ControlAddin
//  Entitlement; PermissionSet;PermissionSetExtension
