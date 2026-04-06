%dw 2.0
output application/json
var patientAllergies = vars.allergiesCamelized map $.allergenName
var medsMatchingPatientAllergies = vars.medications filter ((med) -> patientAllergies contains med.active_substance) map $.brand_name
var prescriptions = splitBy(vars.consultation.prescriptionsList, ", ")
---
prescriptions map ((prescription) -> 
	isEmpty(medsMatchingPatientAllergies filter((med) -> prescription contains med))
) contains false
