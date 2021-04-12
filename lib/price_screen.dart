import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
//import 'dart:io' hide Platform;

GlobalKey globalKey = GlobalKey();

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String bitcoinValueForBTC = '?';
  String bitcoinValueForETH = '?';
  String bitcoinValueForLTC = '?';
  String selectedCurrency = 'AUD';
  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> currencies = [];
    for (String currency in currenciesList) {
      currencies.add(
        DropdownMenuItem(
          child: Text(currency),
          value: currency,
        ),
      );
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: currencies,
      onChanged: (value) {
        setState(
          () {
            selectedCurrency = value;
            getDataInBTC(selectedCurrency);
            getDataInETH(selectedCurrency);
            getDataInLTC(selectedCurrency);
          },
        );
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Widget> currencies = [];
    for (String currency in currenciesList) {
      currencies.add(
        Text(currency),
      );
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlueAccent,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          getDataInBTC(selectedCurrency);
          getDataInETH(selectedCurrency);
          getDataInLTC(selectedCurrency);
        });
      },
      children: currencies,
    );
  }

  Widget getPicker() {
    if (Platform.isIOS) {
      return iOSPicker();
    } else if (Platform.isAndroid) {
      return androidDropdown();
    }
  }

  void toastShow() {
    Fluttertoast.showToast(
        msg: "This Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void getDataInBTC(String currencyNow) async {
    try {
      double data = await CoinData(chosenCurrency: currencyNow).getCoinData();
      setState(() {
        bitcoinValueForBTC = data.toStringAsFixed(0).toString();
      });
    } catch (e) {
      print(e);
    }
  }

  void getDataInETH(String currencyNow) async {
    try {
      double data =
          await CoinData(chosenCurrency: currencyNow).getCoinDataInETH();
      setState(() {
        bitcoinValueForETH = data.toStringAsFixed(0).toString();
      });
    } catch (e) {
      print(e);
    }
  }

  void getDataInLTC(String currencyNow) async {
    try {
      double data =
          await CoinData(chosenCurrency: currencyNow).getCoinDataInLTC();
      setState(() {
        bitcoinValueForLTC = data.toStringAsFixed(0).toString();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getDataInBTC(selectedCurrency);
    getDataInETH(selectedCurrency);
    getDataInLTC(selectedCurrency);
  }

  @override
  Widget build(BuildContext context) {
    //getDropdownItems();
    //getSliderItems();
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = $bitcoinValueForBTC $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ETH = $bitcoinValueForETH $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 LTC = $bitcoinValueForLTC $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Expanded(
          //   child: Center(
          //     child: Text(
          //       bitcoinValueInUSD,
          //       style: TextStyle(color: Colors.black),
          //     ),
          //   ),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     print('sjdgfhsdf');
          //     toastShow();
          //   },
          //   child: Text('For Toast'),
          // ),
          //192.168.43.1
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlueAccent,
            //child: Platform.isIOS ? iOSPicker() : androidDropdown(),
            child: androidDropdown(),
          ),
        ],
      ),
    );
  }
}

// items: [
//   DropdownMenuItem(
//     child: Text('USD'),
//     value: 'USD',
//   ),
//   DropdownMenuItem(
//     child: Text('EUR'),
//     value: 'EUR',
//   ),
//   DropdownMenuItem(
//     child: Text('GBP'),
//     value: 'GBP',
//   ),
// ],
