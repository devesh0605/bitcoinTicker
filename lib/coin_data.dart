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
  CoinData({this.chosenCurrency});

  String chosenCurrency;

  Future getCoinData() async {
    var url = Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/BTC/$chosenCurrency?apikey=0CEA4FE5-1E57-4B8B-8298-393DBE7E15CE');
    http.Response response = await http.get(url);
    print(response.body);
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

  Future getCoinDataInETH() async {
    var url = Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/ETH/$chosenCurrency?apikey=0CEA4FE5-1E57-4B8B-8298-393DBE7E15CE');
    http.Response response = await http.get(url);
    print(response.body);
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

  Future getCoinDataInLTC() async {
    var url = Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/LTC/$chosenCurrency?apikey=0CEA4FE5-1E57-4B8B-8298-393DBE7E15CE');
    http.Response response = await http.get(url);
    print(response.body);
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
