class HistoryMedicalModel{
  final String month;
  final String  docname;
  final String  content;
  final String day;

  HistoryMedicalModel({
    required this.month,
    required this.docname,
    required this.day,
    required this.content,



  });


  set content(String value) {
    content = value;
  }


}