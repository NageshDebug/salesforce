public interface PaymentService {
    void debitCard(Order discountedOrder, Card card);
    void validateCard(Card card);
}
