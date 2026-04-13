%dw 2.0
output application/json
var patientAllergies = vars.allergiesCamelized map $.allergenName //Patient allergies names
var medsMatchingPatientAllergies = vars.medications filter ((med) -> patientAllergies contains med.active_substance) map $.brand_name //Medications containing substances to which the patient is allergic
var prescriptions = splitBy(vars.consultation.prescriptionsList, ", ") //Array of prescriptions
---
prescriptions map ((prescription) -> 
	isEmpty(medsMatchingPatientAllergies filter((med) -> prescription contains med)) //Check if the prescription contains a medication to which the patient is allergic
) contains false
