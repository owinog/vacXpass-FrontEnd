class VaccineModel {
  String vaccineId;
  String vaccineDate;
  String batchNumber;
  String dateIssue;

  VaccineModel(
      {required this.vaccineId,
      required this.vaccineDate,
      required this.batchNumber,
      required this.dateIssue});

  Map<String, dynamic> toMap() {
    return {
      'name': vaccineId,
      'date': vaccineDate,
      'batchNo': batchNumber,
      'dateIssue': dateIssue
    };
  }
}
