import 'dart:async';
import 'dart:convert';

import 'package:crypto_tracker/coinModel.dart';
import 'package:crypto_tracker/coin_card.dart';
import 'package:crypto_tracker/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    final respone = await http.get(
      Uri.parse(
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'),
    );
    if (respone.statusCode == 200) {
      List<dynamic> values = [];
      values = jsonDecode(respone.body);
      if (values.isNotEmpty) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
        setState(() {
          coinList;
        });
      }
      return coinList;
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchCoin();
    // Timer.periodic(const Duration(seconds: 2), (timer) => fetchCoin());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cryptoose",
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              print("test");
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Loginpage()));
            },
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: coinList.length,
        itemBuilder: (context, index) => CoinCard(
            CoinName: coinList[index].name,
            CoinSymbol: coinList[index].symbol,
            CurrentPrice: coinList[index].price,
            ImageURL: coinList[index].ImageURL,
            IncDesc: coinList[index].change,
            Percentage: coinList[index].percentage),
      ),
    );
  }
}
