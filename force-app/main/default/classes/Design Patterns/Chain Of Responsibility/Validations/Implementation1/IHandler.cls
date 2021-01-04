public interface IHandler {
  IHandler SetNext(IHandler next);
  void Handle(object request);
}