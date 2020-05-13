import 'package:http/http.dart' as http;

class Service {

  static final String _appID = '94a3cc5f37a96a37469cbf6f607f7c59';
  static final String _url = 'https://api.openweathermap.org';

  static Future<http.Response> getWeather(String city) async {
    String endpoint = '$_url/data/2.5/weather?q=$city&APPID=$_appID&units=metric';
    return await http.get(endpoint); // .then((r) => json.decode(r.body));
  }
}