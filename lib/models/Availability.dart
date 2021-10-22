class Availability {
  final int depId;
  final String depStartDate;
  final String depEndDate;
  final String depStatus;
  final String cruName;
  final int cruPaxLimit;
  final String vslColor;
  final String itiCode;
  final int itiNights;
  //final String prices;

  Availability(
      {this.depId,
      this.depStartDate,
      this.depEndDate,
      this.depStatus,
      this.cruName,
      this.cruPaxLimit,
      this.vslColor,
      this.itiCode,
      this.itiNights
      //this.prices});
      });
  factory Availability.fromJson(Map<String, dynamic> json) {
    return Availability(
      depId: json['depId'],
      depStartDate: json['depStartDate'],
      depEndDate: json['depEndDate'],
      depStatus: json['depStatus'],
      cruName: json['cruName'],
      cruPaxLimit: json['cruPaxLimit'],
      vslColor: json['vslColor'],
      itiCode: json['itiCode'],
      itiNights: json['itiNights'],
      //prices: json['prices'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['depId'] = this.depId;
    data['depStartDate'] = this.depStartDate;
    data['depEndDate'] = this.depEndDate;
    data['depStatus'] = this.depStatus;
    data['cruName'] = this.cruName;
    data['cruPaxLimit'] = this.cruPaxLimit;
    data['vslColor'] = this.vslColor;
    data['itiCode'] = this.itiCode;
    data['itiNights'] = this.itiNights;
    //data['prices'] = this.prices;
    return data;
  }
}
