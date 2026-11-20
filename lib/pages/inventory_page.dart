import 'package:flutter/material.dart';

class InventoryPage extends StatelessWidget {
  InventoryPage({super.key});

  final List<BahanItem> bahans = [
    BahanItem("Mango", 5),
    BahanItem("Avocado", 3),
    BahanItem("Strawberry", 10),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Inventory",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Color(0xFFE0835A),
          ),
        ),
        Container(
          padding: EdgeInsets.all(30),
          alignment: Alignment.center,
          child: SizedBox(
            width: 350,
            child: Card(
              color: Color(0xFF2E6B5E),
              child: Padding(
                padding: EdgeInsetsGeometry.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 210,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Ingredients", 
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold, 
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          width: 80,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Stock", 
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold, 
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    BahanCard(bahans[0]),
                    BahanCard(bahans[1]),
                    BahanCard(bahans[2]),
                  ],
                ),
              ),
            )
          )
        ),
        Text(
          "Recipe Recommendation",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Color(0xFFE0835A),
          ),
        ),
        Text("Coming Soon"),
      ],
    );
  }
}

class BahanItem {
  final String name;
  final int stock;

  BahanItem(this.name, this.stock);
}

class BahanCard extends StatelessWidget{
  final BahanItem item;
  const BahanCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Card (
          color: Colors.white,
          child: Container(
            width: 200,
            padding: EdgeInsets.all(10),
            child: Text(item.name, textAlign: TextAlign.center,),
          ),
        ),
        Card (
          color: Colors.white,
          child: Container(
            width: 70,
            padding: EdgeInsets.all(10),
            child: Text(item.stock.toString(), textAlign: TextAlign.center,),
          ),
        ),
      ],
    );
  }
}