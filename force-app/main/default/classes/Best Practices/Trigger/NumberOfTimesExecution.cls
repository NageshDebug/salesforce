public with sharing class NumberOfTimesExecution {
  /**
     You may know order of execution but did you realize how many times your triggers calls? Let's wrap this up.

Here are some statistics how many times your trigger calls in different cases:
Scenario details	                                    # of trigger calls	                # of workflow calls	            # of process calls
Apex Trigger	                                            1	                                    0	                            0
Apex Trigger and one Workflow Rule	                        2	                                    1	                            0
Apex Trigger and two Workflow Rules	                        2	                                    1	                            0
Apex Trigger and Process Builder	                        2	                                    0	                            1
Apex Trigger and two Process Builders	                    3	                                    0	                            1
Apex Trigger, Workflow Rule and Process Builder	            3	                                    1	                            1
Apex Trigger, Workflow Rule and two Process Builders	    4	                                    1	                            1
Apex Trigger, two Workflow Rules and two Process Builders	4	                                    1	                            1

As you can see it is pretty critical to implement triggers efficiently. Here are some basic recommendation to implement trigger logic effectively:
Implementing the Trigger Factory pattern.

Use before trigger to update fields on the triggered object. You can modify the records in the before trigger without explicitly calling a DML operation.

If there is a way, run logic only if specific fields changed. For example, you implemented a custom rollup field that summarize price, it does not make sense 
to recalculate rollup if price is not changed.

If there is a way, update records only if recalculated value has changed. For example, you implemented a custom rollup field that summarize price, 
if total price is the same as stored value in the database then it does not make sense to update the record.
     */
}
