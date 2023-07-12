class Weather {
  String? cityName;
  double? temp;
  String? weatherLike;
  String? weatherDesc;
  String? weatherIcon;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  int? humidity;
  double? feelsLike;
  int? pressure;

  Weather({
    this.cityName,
    required this.temp,
    required this.weatherLike,
    this.weatherDesc,
    this.weatherIcon,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.humidity,
    this.feelsLike,
    this.pressure,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['name'];
    if (json['main']['temp'] == null) {
      temp = 0.0;
    } else {
      temp = json['main']['temp'] + 0.0;
    }
    weatherLike = json['weather'][0]['main'];
    weatherDesc = json['weather'][0]['description'];
    weatherIcon = json['weather'][0]['icon'];
    windSpeed = json['wind']['speed'] + 0.0;
    if (json['wind']['deg'] == null) {
      windDeg = 0;
    } else {
      windDeg = json['wind']['deg'];
    }
    if (json['wind']['gust'] == null) {
      windGust = 0.0;
    } else {
      windGust = json['wind']['gust'] + 0.0;
    }
    humidity = json['main']['humidity'];
    feelsLike = json['main']['feels_like'] + 0.0;
    if (json['main']['feels_like'] == null) {
      feelsLike = 0.0;
    } else {
      feelsLike = json['main']['feels_like'] + 0.0;
    }
    pressure = json['main']['pressure'];
  }
}
