Interview Exercise



User story:



As a Salesforce user (any user), I want to be able to search for all person account records that match a search string and view the results of my search as a list of records.



Requirements:



Only person account records should be displayed.
Matching is done based on the presence of the search string on the first or last name fields.
All matching accounts should be returned irrespective of ownership.
The UI should have a search text box and a search button.
All matching records should be listed below the search box displaying basic account information: e.g. first and last name.


Technical Notes:



You can use any choice/mix of Lightning Web Components, Lightning Aura Components, Lightning page.
The results view should display the fields "first name" and "last name" of all person account records, irrespective of record ownership.
Code and full solution should be production ready, but the UI does NOT need to look professional, simply functional is enough.
The exercise is simple by design to allow you to focus on quality.
You can use any documentation resources to provide the solution.


Submitting your solution:



You should present the solution in 3 different formats:



Update this home page (the home page in this scratch org) and add a new section to display the solution components.
Add a new custom tab to display the same solution components.
Create a zip file with all the code necessary to install the solution in a different org and upload it as a file in this scratch org. Then update this home page to include the instructions on how to deploy the solution using the Salesforce CLI (command-line interface).




Solution Components:

Lightning Web Component - FetchAndFilterAccounts
Apex Class - AccountController
Solution Explanation:

I am using the LWC component and apex class using the wire property to fetch and filter ther records based on the search string for faster performance whenever there is a change in the search input box - solution 1.
I am using the LWC Component and apex class using the standard imperative apex method calling when the search button is clicked - solution 2.
Apex Logic - Contains a method (getAccounts) which queries on the recordtype of person account and filters the account records based on the search string using like operator and person account record type.
Deployment Commands Salesforce CLI:

Download the file (EducationFirstExam) and unzip the folder / files content to the path : force-app\main\default.
in case if already existing path, override the contents to the path :  force-app\main\default
copy the command : sfdx force:source:deploy -p force-app\main\default\lwc\fetchAndFilterAccounts , force-app\main\default\classes\AccountController.cls, force-app\main\default\classes\AccountControllerTest.cls, force-app\main\default\tabs\Solution_Page.tab-meta.xml, force-app\main\default\flexipages\Home_Page_Default.flexipage-meta.xml, force-app\main\default\flexipages\Solution_Page.flexipage-meta.xml
paste the command in the terminal and you should see below message in the terminal window:
 C:\Users\STK\Downloads\EducationFirstExam> sfdx force:source:deploy -p force-app\main\default\lwc\fetchAndFilterAccounts , force-app\main\default\classes\AccountController.cls, force-app\main\default\classes\AccountControllerTest.cls, force-app\main\default\tabs\Solution_Page.tab-meta.xml, force-app\main\default\flexipages\Home_Page_Default.flexipage-meta.xml, force-app\main\default\flexipages\Solution_Page.flexipage-meta.xml
Warning: We plan to deprecate this command in the future. Try using the "project deploy start" command instead.

Deploying v58.0 metadata to 1698649318332_test-jeoqybtwe2yr@example.com using the v59.0 SOAP API.

Deploy ID: 0Af7Y00002EC19MSAT

DEPLOY PROGRESS | ████████████████████████████████████████ | 6/6 Components



=== Deployed Source



 FULL NAME       TYPE           PROJECT PATH

 ────────────────────── ──────────────────────── ──────────────────────────────────────────────────────────────────────────────────── 

 AccountController   ApexClass        force-app\main\default\classes\AccountController.cls

 AccountController   ApexClass        force-app\main\default\classes\AccountController.cls-meta.xml

 AccountControllerTest ApexClass        force-app\main\default\classes\AccountControllerTest.cls

 AccountControllerTest ApexClass        force-app\main\default\classes\AccountControllerTest.cls-meta.xml

 Solution_Page     CustomTab        force-app\main\default\tabs\Solution_Page.tab-meta.xml

 Home_Page_Default   FlexiPage        force-app\main\default\flexipages\Home_Page_Default.flexipage-meta.xml

 Solution_Page     FlexiPage        force-app\main\default\flexipages\Solution_Page.flexipage-meta.xml

 fetchAndFilterAccounts LightningComponentBundle force-app\main\default\lwc\fetchAndFilterAccounts\fetchAndFilterAccounts.html

 fetchAndFilterAccounts LightningComponentBundle force-app\main\default\lwc\fetchAndFilterAccounts\fetchAndFilterAccounts.js

 fetchAndFilterAccounts LightningComponentBundle force-app\main\default\lwc\fetchAndFilterAccounts\fetchAndFilterAccounts.js-meta.xml

Deploy Succeeded.

PS C:\Users\STK\Downloads\EducationFirstExam> 


Tool: https://githubsfdeploy.herokuapp.com/
Deployment:

<a href="https://githubsfdeploy.herokuapp.com?owner=Sudhir Kumar Thanna&repo=EducationFirstExam&ref=main">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>
