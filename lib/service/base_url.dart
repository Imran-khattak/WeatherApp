class ApiURLforecast {
  late String _Location;

  String get Location => _Location;

  set Location(String value) {
    _Location = value;
  }

  String getLocation(String Location) =>
      'https://api.openweathermap.org/data/2.5/forecast?q=$Location&appid=776745ec8bd02ca7e84c1fec3b94c889';
}

class ApiURLupdate {
  late String _Location;

  String get Location => _Location;

  set Location(String value) {
    _Location = value;
  }

  String getLocation(String Location) =>
      'https://api.openweathermap.org/data/2.5/weather?q=$Location&appid=776745ec8bd02ca7e84c1fec3b94c889';
}
