import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  final String CoinName;
  final String CoinSymbol;
  final String ImageURL;
  num CurrentPrice;
  num IncDesc;
  num Percentage;
  CoinCard(
      {super.key,
      required this.CoinName,
      required this.CoinSymbol,
      required this.CurrentPrice,
      required this.ImageURL,
      required this.IncDesc,
      required this.Percentage});

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 10.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100.0,
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                offset: const Offset(4, 4),
                blurRadius: 10,
                spreadRadius: 1,
              ),
              const BoxShadow(
                color: Colors.white,
                offset: Offset(-4, -4),
                blurRadius: 10,
                spreadRadius: 1,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade500,
                            offset: const Offset(4, 4),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4, -4),
                            blurRadius: 10,
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      height: 70,
                      width: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(ImageURL),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //coin name
                      Text(
                        CoinName,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        CoinSymbol.toUpperCase(),
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //current value
                    Text(
                      "\$${CurrentPrice}",
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //profit/loss
                    Text(
                      IncDesc < 0
                          ? IncDesc.toStringAsFixed(3)
                          : '+' + IncDesc.toStringAsFixed(3),
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.w500,
                        color: IncDesc < 0 ? Colors.red : Colors.green,
                      ),
                    ),
                    //percentage
                    Text(
                      Percentage < 0
                          ? Percentage.toStringAsFixed(3)
                          : '+' + Percentage.toStringAsFixed(3),
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.w500,
                        color: Percentage < 0 ? Colors.red : Colors.green,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
