class Images {
  final int boxId;
  final String boxType;
  final String boxName;
  final String arcTitle;
  final String arcPath;

  Images({this.boxId, this.boxType, this.boxName, this.arcTitle, this.arcPath});

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      boxId: json['boxId'],
      boxType: json['boxType'],
      boxName: json['boxName'],
      arcTitle: json['arcTitle'],
      arcPath: json['arcPath'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['boxId'] = this.boxId;
    data['boxType'] = this.boxType;
    data['boxName'] = this.boxName;
    data['arcTitle'] = this.arcTitle;
    data['arcPath'] = this.arcPath;
    return data;
  }
}
