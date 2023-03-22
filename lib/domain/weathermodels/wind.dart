class Wind {
  dynamic? speed;
  dynamic? deg;
  Wind({this.speed, this.deg});
  factory Wind.fromjson(Map<String, dynamic> json) {
    return Wind(speed: json["speed"], deg: json["deg"]);
  }
}
