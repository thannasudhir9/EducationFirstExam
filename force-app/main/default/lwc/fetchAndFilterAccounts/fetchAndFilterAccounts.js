import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';

export default class FetchAndFilterAccounts extends LightningElement {
    
    columns = [
        { label: 'FirstName', fieldName: 'FirstName' },
        { label: 'LastName', fieldName: 'LastName'}
    ];
   accountList;
   accountList2;

   ////////////////////////////////////////////////////////////////////////////// - Solution 1
    searchString;
    handleSearchName(event) {
        this.searchString = event.target.value;
    }

    recordsSize = 0;
   //For Faster Performace using wire instead of below function - handleSearchBtn
   //When typing in the search box, call the Apex method to search and filter for accounts
    @wire(getAccounts, { searchString : '$searchString' })
    records({data,error}){
        if (data) {
             // Handling the account search results here and passing them to the datatable
            this.accountList = data;
            this.recordsSize = data.length;
            console.log('accList : ' + data); 
        } else if (error) {
           console.log(error);
        }
   } ;
    
    
    ////////////////////////////////////////////////////////////////////////////// - Solution 2
    
    searchString2;
    handleSearchName2(event) {
        this.searchString2 = event.target.value;
    }
   
    recordsSize2 = 0;
   //When Clicking on the search button, call the Apex method to search and filter for accounts
   //Imperative Apex Method -  invoke the apex method in an imperative fashion.
   handleSearchBtn() {
        // Call the Apex method to search for accounts
        getAccounts({ searchString : this.searchString2 })
            .then(result => {
                // Handling the account search results here and passing them to the datatable
                console.log(result);
                this.accountList2 = result;
                this.recordsSize2 = result.length;
            })
            .catch(error => {
                // Handle any errors
                console.error(error);
            });
    }

}