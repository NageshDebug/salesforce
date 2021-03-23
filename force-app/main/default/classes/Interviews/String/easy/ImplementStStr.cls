@isTest
public with sharing class ImplementStStr {
    @isTest
    public static void testImplementStStr() {
        String haystack = 'hello', needle = 'll';
        system.debug('--------------->'+ haystack.indexOf(needle));
    }
}
