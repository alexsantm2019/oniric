class Cabins {
  final int cabId;
  final String cabName;
  final String cabCode;
  final String cabDescription;
  final int cabCategory;
  final int cabMax;
  final String cabSize;
  final int cabType;
  final String decName;
  final String decDescription;
  final int decStatus;
  final String cabCategoryName;
  final String cabTypeName;

  Cabins(
      {this.cabId,
      this.cabName,
      this.cabCode,
      this.cabDescription,
      this.cabCategory,
      this.cabMax,
      this.cabSize,
      this.cabType,
      this.decName,
      this.decDescription,
      this.decStatus,
      this.cabCategoryName,
      this.cabTypeName});

  factory Cabins.fromJson(Map<String, dynamic> json) {
    return Cabins(
      cabId: json['cabId'],
      cabName: json['cabName'],
      cabCode: json['cabCode'],
      cabDescription: json['cabDescription'],
      cabCategory: json['cabCategory'],
      cabMax: json['cabMax'],
      cabSize: json['cabSize'],
      cabType: json['cabType'],
      decName: json['decName'],
      decDescription: json['decDescription'],
      decStatus: json['decStatus'],
      cabCategoryName: json['cabCategoryName'],
      cabTypeName: json['cabTypeName'],
    );
  }

  factory Cabins.createPostResult(Map<String, dynamic> object) {
    return Cabins(
        cabId: object['cabId'],
        cabName: object['cabName'],
        cabCode: object['cabCode'],
        cabDescription: object['cabDescription'],
        cabCategory: object['cabCategory'],
        cabMax: object['cabMax'],
        cabSize: object['cabSize'],
        cabType: object['cabType'],
        decName: object['decName'],
        decDescription: object['decDescription'],
        decStatus: object['decStatus']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cabId'] = this.cabId;
    data['cabName'] = this.cabName;
    data['cabCode'] = this.cabCode;
    data['cabDescription'] = this.cabDescription;
    data['cabCategory'] = this.cabCategory;
    data['cabMax'] = this.cabMax;
    data['cabSize'] = this.cabSize;
    data['cabType'] = this.cabType;
    data['decName'] = this.decName;
    data['decDescription'] = this.decDescription;
    data['decStatus'] = this.decStatus;
    data['cabCategoryName'] = this.cabCategoryName;
    data['cabTypeName'] = this.cabTypeName;
    return data;
  }
}
