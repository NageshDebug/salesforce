public with sharing class ContactsSelector1 extends fflib_SObjectSelector implements IContactsSelector1
{
	private static IContactsSelector1 selectorImpl = null;

	public ContactsSelector1() {
		super(false);
	}

	public static IContactsSelector1 newInstance()
	{
		if(selectorImpl == null)
		{
			return new ContactsSelector1();
		}

		return selectorImpl;
	}

	public static void setImpl(IContactsSelector1 impl)
	{
		selectorImpl = impl;
	}

	public List<Schema.SObjectField> getSObjectFieldList() {
		return new List<Schema.SObjectField> {
			 };
	}

	public Schema.SObjectType getSObjectType() {
		return Contact.sObjectType;
	}

	public List<Contact> selectById(Set<Id> idSet) {
		return (List<Contact>) selectSObjectsById(idSet);
	}
}