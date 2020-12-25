/**
 * Advantages:
    1. Decouples the sender of the request and its receivers.
    2. Simplifies your object as it doesn’t have to know about the chain structure and keep direct references to its members.
    3. Allows you to add or remove responsibilities dynamically by changing the members or order of the chain.

    Disadvantage:
    1. Hard to observe the run-time characteristics and debug.

    Note: there is not much discussion about the disadvantage of COR. Whenever we can use it, use it.

    Examples
    1. HTTP Filters and interceptors in web applications
    2. Handling for exceptional conditions and process rollback/compensation
    3. Event logging and reporting
    4. in an organization, there are some customer care executives who handle feedback/issues from customers.
            they will forward those customer issues/escalations to the appropriate department in the organization
            not all departments will start fixing an issue.
            the department that seems to be responsible will take a look first, and if the department staff beleive that the issue should be forwarded to another department, he/she will do that

    
 * 
 */
public interface LoggingHandler {
  void logMessage(String message, String logLevel);
}
