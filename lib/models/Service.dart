class Service {
  final int serId;
  final String serName;
  final String serDescription;

  Service({this.serId, this.serName, this.serDescription});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      serId: json['serId'],
      serName: json['serName'],
      serDescription: json['serDescription'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serId'] = this.serId;
    data['serName'] = this.serName;
    data['serDescription'] = this.serDescription;
    return data;
  }

  @override
  String toString() {
    return 'Servicio: {servicio: ${serName}, descripcion: ${serDescription}}';
  }
}
