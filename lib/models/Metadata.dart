class Metadata {
  final int metId;
  final int metGroup;
  final String metName;
  final int metCodigo;

  Metadata({this.metId, this.metGroup, this.metName, this.metCodigo});

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      metId: json['metId'],
      metGroup: json['metGroup'],
      metName: json['metName'],
      metCodigo: json['metCodigo'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['metId'] = this.metId;
    data['metGroup'] = this.metGroup;
    data['metName'] = this.metName;
    data['cabDemetCodigoscription'] = this.metCodigo;
    return data;
  }
}
