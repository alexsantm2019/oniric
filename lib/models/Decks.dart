class Decks {
  final int decId;
  final String decName;
  final String decDescription;
  final int decOrder;
  final int decStatus;

  Decks(
      {this.decId,
      this.decName,
      this.decDescription,
      this.decOrder,
      this.decStatus});

  factory Decks.fromJson(Map<String, dynamic> json) {
    return Decks(
      decId: json['decId'],
      decName: json['decName'],
      decDescription: json['decDescription'],
      decOrder: json['decOrder'],
      decStatus: json['decStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['decId'] = this.decId;
    data['decName'] = this.decName;
    data['decDescription'] = this.decDescription;
    data['decOrder'] = this.decOrder;
    data['decStatus'] = this.decStatus;
    return data;
  }
}
