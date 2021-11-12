class Boats {
  final int vslId;
  final String vslName;
  final String vslAlias;
  final String vslDescription;
  final String vslColor;

  final int vslCapacity;
  //final String vslCategory;
  final String vslModel;
  final String vslYear;
  final String vslPower;
  final String vslSpeed;
  final String vslLength;
  final String vslWidth;

  Boats({
    this.vslId,
    this.vslName,
    this.vslAlias,
    this.vslDescription,
    this.vslColor,
    this.vslCapacity,
    //this.vslCategory,
    this.vslModel,
    this.vslYear,
    this.vslPower,
    this.vslSpeed,
    this.vslLength,
    this.vslWidth,
  });

  factory Boats.fromJson(Map<String, dynamic> json) {
    return Boats(
      vslId: json['vslId'],
      vslName: json['vslName'],
      vslAlias: json['vslAlias'],
      vslDescription: json['vslDescription'],
      vslColor: json['vslColor'],
      vslCapacity: json['vslCapacity'],
      // vslCategory: json['vslCategory'],
      vslModel: json['vslModel'],
      vslYear: json['vslYear'],
      vslPower: json['vslPower'],
      vslSpeed: json['vslSpeed'],
      vslLength: json['vslLength'],
      vslWidth: json['vslWidth'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['vslId'] = this.vslId;
    data['vslName'] = this.vslName;
    data['vslAlias'] = this.vslAlias;
    data['vslDescription'] = this.vslDescription;
    data['vslColor'] = this.vslColor;
    data['vslCapacity'] = this.vslCapacity;
    //data['vslCategory'] = this.vslCategory;
    data['vslModel'] = this.vslModel;
    data['vslYear'] = this.vslYear;
    data['vslPower'] = this.vslPower;
    data['vslSpeed'] = this.vslSpeed;
    data['vslLength'] = this.vslLength;
    data['vslWidth'] = this.vslWidth;
    return data;
  }
}
