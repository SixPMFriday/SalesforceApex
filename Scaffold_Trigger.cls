trigger Sobject_Trigger_Main on SObject (
  before insert,
  before update,
  before delete,
  after insert,
  after update,
  after delete,
  after undelete 
) {
    if (Trigger.isBefore) // trigger runs before record is saved
    {
      if (Trigger.isInsert) // trigger was fired due to an insert operation
      { }
      else if (Trigger.isUpdate) // trigger was fired due to an update operation
      { }
      else if (Trigger.isDelete) // trigger was fired due to a delete operation
      { }
    }
    else if (Trigger.isAfter) // trigger runs after record is saved
    {
      if (Trigger.isInsert) // trigger was fired due to an insert operation
      { }
      else if (Trigger.isUpdate) // trigger was fired due to an update operation
      { }
      else if (Trigger.isDelete) // trigger was fired due to a delete operation
      { }
      else if (Trigger.isUndelete) //  trigger was fired after a record was recovered from the Recycle Bin, which can occur after an undelete operation
      { }
    }
}  
