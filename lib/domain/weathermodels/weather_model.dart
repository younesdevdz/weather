


class Weather {
  int? id ;
  String? main , description , icon ;
  Weather({this.id , this.main ,this.description ,this.icon});
  factory Weather.fromjson(Map<String, dynamic> json){
    return Weather(
      id :json["id"], 
      main:json["main"], 
      description:json["description"], 
      icon:json["icon"]
      );
  }

}
