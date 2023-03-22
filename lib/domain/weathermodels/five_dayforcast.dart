class FiveDayForcast {
  String? dateTime;
  int? temp;
  FiveDayForcast({this.temp, this.dateTime});
  factory FiveDayForcast.fromjson(Map<String, dynamic> json) {
    var f = json['dt_txt'].split(' ')[0].split('-')[2];
    var l = json['dt_txt'].split(' ')[1].split(':')[0];
    var fandl = '$f-$l';
    return FiveDayForcast(
      dateTime: '$fandl',
      temp: (double.parse(json['main']['temp'].toString()) - 273.15).round(),
    );
  }
}
