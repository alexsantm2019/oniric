class Boats {
  final int vslId;
  final String vslName;
  final String vslAlias;
  final String vslDescription;
  final String vslColor;

  Boats({
    this.vslId,
    this.vslName,
    this.vslAlias,
    this.vslDescription,
    this.vslColor,
  });

  factory Boats.fromJson(Map<String, dynamic> json) {
    return Boats(
      vslId: json['vslId'],
      vslName: json['vslName'],
      vslAlias: json['vslAlias'],
      vslDescription: json['vslDescription'],
      vslColor: json['vslColor'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['vslId'] = this.vslId;
    data['vslName'] = this.vslName;
    data['vslAlias'] = this.vslAlias;
    data['vslDescription'] = this.vslDescription;
    data['vslColor'] = this.vslColor;
    return data;
  }
}
