public abstract class Handler implements IHandler{
    private IHandler Next {get; set;}
     
    // any boilerplate code goes here
    public virtual void Handle(object request) {
        if( Next!= null ) {
            Next.Handle(request);
        }
    }
     
    public IHandler SetNext(IHandler next){ 
        this.Next = next;
        return this.Next;
    }
}