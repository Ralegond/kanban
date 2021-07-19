class CardData {
  int id;
  String row;
  int seqNum;
  String text;

  CardData(
      {required this.id,
      required this.row,
      required this.seqNum,
      required this.text});

  factory CardData.fromJson(Map<String, dynamic> json) {
    return CardData(
      id: json['id'],
      row: json['row'],
      seqNum: json['seq_num'],
      text: json['text'],
    );
  }
}
