trigger AccountsTrigger on Account(before insert, after insert, before update, after update, before delete, after delete) {
  Accounts.newInstance().handleTrigger();

}