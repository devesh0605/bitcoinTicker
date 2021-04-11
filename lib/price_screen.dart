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
  CoinData coinData = CoinData();
  String bitcoinValueInUSD = '?';
  String selectedCurrency = 'INR';
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
        print(selectedIndex);
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

  void getData() async {
    try {
      double data = await CoinData().getCoinData();
      setState(() {
        bitcoinValueInUSD = data.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
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
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $bitcoinValueInUSD USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
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
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
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
