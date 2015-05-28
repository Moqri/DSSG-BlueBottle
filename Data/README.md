#####Building Violations
  - Violations issued by the Department of Buildings in the City of Chicago from 2006 to the present. 
  - The dataset contains more than 1 million records/rows of data.
  - Violations are always associated to an inspection and there can be multiple violation records to one(1) inspection record. 
  - Data fields requiring description are detailed below. 
  - VIOLATION DATE: The date the violation was cited. 
  INSPECTION CATEGORY: Inspections are categorized by one of the following: 
    - COMPLAINT – Inspection is a result of a 311 Complaint 
    - PERIODIC – Inspection is a result of recurring inspection (typically on an annual cycle) 
    - PERMIT – Inspection is a result of a Permit 
    - REGISTRATION – Inspection is a result of a Registration (typically Vacant Building Registration) 
  - PROPERTY GROUP: Properties (lots) in the City of Chicago can typically have multiple point addresses, range addresses and buildings. 
  Examples are corner lots, large lots, lots with front and rear buildings, etc.. 
  As a result, inspections (and their associated violations), permits and complaints related to a single property could have different addresses. 
  This problem can be reconciled by using Property Group. 
  All point and range addresses for a property are assigned the same Property Group key. 
  - Frequency: Data is updated daily.
