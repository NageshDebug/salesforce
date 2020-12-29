public class ValidationHandler {
     
    private list <IReceiver> receivers;
     
    public ValidationHandler(IReceiver[] receivers){
        this.receivers = receivers;
    }
     
    public void Handle (object request) {
        for (IReceiver receiver : this.receivers) {
            receiver.Handle(request);
        }
    }
     
    public void SetNext (IReceiver next){
        this.receivers.Add(next);
    }
}