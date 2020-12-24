public interface CustomerService {
    void validateAccount(CustomerAccount account);
    void isEligible(Order order);
    void applyCashBack(Order order);
    void applyOrder(Order order);
}
