class Cabins {
  final int cabId;
  final String cabName;
  final String cabCode;
  final int cabCategory;
  final int cabMax;
  final String cabSize;
  final int cabType;
  final String decName;
  final String decDescription;
  final int decStatus;

  Cabins(
      {this.cabId,
      this.cabName,
      this.cabCode,
      this.cabCategory,
      this.cabMax,
      this.cabSize,
      this.cabType,
      this.decName,
      this.decDescription,
      this.decStatus});

  factory Cabins.fromJson(Map<String, dynamic> json) {
    return Cabins(
      cabId: json['cabId'],
      cabName: json['cabName'],
      cabCode: json['cabCode'],
      cabCategory: json['cabCategory'],
      cabMax: json['cabMax'],
      cabSize: json['cabSize'],
      cabType: json['cabType'],
      decName: json['decName'],
      decDescription: json['decDescription'],
      decStatus: json['decStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cabId'] = this.cabId;
    data['cabName'] = this.cabName;
    data['cabCode'] = this.cabCode;
    data['cabCategory'] = this.cabCategory;
    data['cabMax'] = this.cabMax;
    data['cabSize'] = this.cabSize;
    data['cabType'] = this.cabType;
    data['decName'] = this.decName;
    data['decDescription'] = this.decDescription;
    data['decStatus'] = this.decStatus;
    return data;
  }
}
