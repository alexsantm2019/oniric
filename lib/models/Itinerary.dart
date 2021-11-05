class Itinerary {
  final int itiId;
  final String itiName;
  final String itiCode;
  final int itiNights;
  final String Difficulty;
  final String Type;
  final String cruName;
  final List<dynamic> summary;

  Itinerary({
    this.itiId,
    this.itiName,
    this.itiCode,
    this.itiNights,
    this.Difficulty,
    this.Type,
    this.cruName,
    this.summary,
  });

  factory Itinerary.fromJson(Map<String, dynamic> json) {
    return Itinerary(
      itiId: json['itiId'],
      itiName: json['itiName'],
      itiCode: json['itiCode'],
      itiNights: json['itiNights'],
      Difficulty: json['Difficulty'],
      Type: json['Type'],
      cruName: json['cruName'],
      summary: json['summary'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['itiId'] = this.itiId;
    data['itiName'] = this.itiName;
    data['itiCode'] = this.itiCode;
    data['itiNights'] = this.itiNights;
    data['Difficulty'] = this.Difficulty;
    data['Type'] = this.Type;
    data['cruName'] = this.cruName;
    data['summary'] = this.summary;
    return data;
  }
}
