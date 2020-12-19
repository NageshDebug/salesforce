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
