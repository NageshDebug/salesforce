public interface PaymentRepository {
  PaymentResponse processPayment(PaymentRequest request);
}
