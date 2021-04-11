import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';

GlobalKey globalKey = GlobalKey();

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'INR';

  List<DropdownMenuItem> getDropdownItems() {
    List<DropdownMenuItem<String>> currencies = [];
    for (String currency in currenciesList) {
      currencies.add(
        DropdownMenuItem(
          child: Text(currency),
          value: currency,
        ),
      );
    }
    return currencies;
  }

  List<Widget> getSliderItems() {
    List<Widget> currencies = [];
    for (String currency in currenciesList) {
      currencies.add(
        Text(currency),
      );
    }
    return currencies;
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

  @override
  Widget build(BuildContext context) {
    getDropdownItems();
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
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
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
            child: CupertinoPicker(
              backgroundColor: Colors.lightBlueAccent,
              itemExtent: 32.0,
              onSelectedItemChanged: (selectedIndex) {
                print(selectedIndex);
              },
              children: getSliderItems(),
            ),
          ),
        ],
      ),
    );
  }
}
// DropdownButton<String>(
// value: selectedCurrency,
// items: getDropdownItems(),
// onChanged: (value) {
// setState(
// () {
// selectedCurrency = value;
// },
// );
// },
// ),

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
