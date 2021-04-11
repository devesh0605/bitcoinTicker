import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getCoinData() async {
    var url = Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=1276A669-F9A8-46C8-B4E8-7C221795E09D');
    http.Response response = await http.get(url);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);
      return (decodeData['rate']);
    } else {
      print(response.statusCode);
    }
  }
}
