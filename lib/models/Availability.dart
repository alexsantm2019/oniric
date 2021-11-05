class Availability {
  final int depId;
  final String depStartDate;
  final String depEndDate;
  final String depStatus;
  final String cruName;
  final int cruPaxLimit;
  final String vslColor;
  final String itiCode;
  final int itiId;
  final int itiNights;
  final Map prices;
  final List<dynamic> cabins;
  // List<Prices> prices = [];
  //List<Map<String, dynamic>> prices;

  Availability(
      {this.depId,
      this.depStartDate,
      this.depEndDate,
      this.depStatus,
      this.cruName,
      this.cruPaxLimit,
      this.vslColor,
      this.itiCode,
      this.itiId,
      this.itiNights,
      this.prices,
      this.cabins
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
      itiId: json['itiId'],
      itiNights: json['itiNights'],
      prices: json['prices'],
      cabins: json['cabins'],
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
    data['itiId'] = this.itiId;
    data['itiNights'] = this.itiNights;
    data['prices'] = this.prices;

    data['cabins'] = this.cabins;

    return data;
  }
}

class Prices {
  double rate;
  double promotion;
  Prices({this.rate, this.promotion});
  factory Prices.fromJson(Map<String, dynamic> json) {
    return Prices(
      rate: json['rate'],
      promotion: json['promotion'] as double,
    );
  }
}
