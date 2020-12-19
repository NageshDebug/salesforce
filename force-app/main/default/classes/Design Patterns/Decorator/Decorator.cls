/**
 * 
Problem
we all faced some situations where we need to have some kind of temporary fields just for calculation or displaying in the UI, 
but we don't want to store that information in the database or more specific in object. 
To solve this type of problems, we have Decorator Design Pattern, which allows a user to add a new functionality to an existing 
object without modifying it's internal structure. 

Definition
The Decorator pattern attempts to solve the issue where you need temporary fields for processing (typically in Visualforce,Lightning components)
but do not need to add these fields to the sObject.

Common uses for this pattern include:
Selection Checkbox — a list of records that the user selects and applies behavior to; the selection checkbox is not saved
Calculated fields — a complex read-only value that cannot be easily done in a formula field (e.g. calculation of a check digit)
Proxy fields — a field, that when updated, converts to a different value on the record (e.g. temperature figures presented to the user in C, but stored as F)

Note: This pattern is primarily for Visualforce,Aura and LWC use cases.

Examples
1. Say in a table, we are displaying a list of records and want to perform some operations on selected records. 
   We can perform the same operation on each record, but from user interaction point of view, if we can provide some 
   check-boxes so that user can select multiple records inside the table and perform the same operation on all the selected 
   records. We can display check-box against each row, but that check-box information we will not store into the object level, 
   these are only for Visual Force pages,AURA and LWC.


2. Say when we are creating new accountss we are passing the same account information to some MDM (Master Data Management) system 
   via integration. Once the account information is getting stored into MDM (i.e. we received SUCCESS from MDM), 
   we need to display some information in the account SF page layout indicating that synchronization between SF and MDM is done. 
   In this case, we will just use a text message "Sync Done" / "Sync in progress" to be displayed in Visual Force page, but 
   no information need to be stored into SF.

Advantages
1. Helps not to create temporary fields in the database.
2. Helps to perform complex formulas before display in UI. No need to create formula fields.
3. Indicators in UI for toggle options. No need to create fields to handle those scenarios.

 */
public with sharing class Decorator {
  public List<ConvertedExpenses> allConvertedExpenses { get; set; }

  public Decorator() {
    List<Opportunity> allExpenses = [SELECT ID, Name, Amount FROM Opportunity];
    if (allExpenses.size() > 0) {
      allConvertedExpenses = new List<ConvertedExpenses>();
      for (Opportunity singleExpense : allExpenses) {
        allConvertedExpenses.add(new ConvertedExpenses(singleExpense));
      }
    }
  }

  public class ConvertedExpenses {
    //TODO - Below conversion rates should come either from custom settings or via integration from websites
    //like xe.com, but from simplicity purpose, I just made it hard-coded here.
    private Double DOLLAR_INR = 63.7847;
    private Double DOLLAR_EURO = 0.894601;
    private Double DOLLAR_CHF = 0.927985;

    public String expenseName { get; set; }
    public Double expenseInDollar { get; set; }
    public Double expenseInInr { get; set; }
    public Double expenseInEuro { get; set; }
    public Double expenseInChf { get; set; }

    public ConvertedExpenses(Opportunity singleExpense) {
      expenseName = singleExpense.Name;
      expenseInDollar = singleExpense.Amount;
      expenseInInr = expenseInDollar * DOLLAR_INR;
      expenseInEuro = expenseInDollar * DOLLAR_EURO;
      expenseInChf = expenseInDollar * DOLLAR_CHF;
    }
  }
}
