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
    return Container(
      padding: EdgeInsets.all(30),
      alignment: Alignment.center,
      child: SizedBox(
        width: 300,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 210,
                  padding: EdgeInsets.all(10),
                  child: Text("Ingredients", textAlign: TextAlign.center,),
                ),
                Container(
                  width: 80,
                  padding: EdgeInsets.all(10),
                  child: Text("Stock", textAlign: TextAlign.center,),
                ),
              ],
            ),
            BahanCard(bahans[0]),
            BahanCard(bahans[1]),
            BahanCard(bahans[2]),
          ],
        ),
      )
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
            child: Container(
              width: 200,
              padding: EdgeInsets.all(10),
              child: Text(item.name, textAlign: TextAlign.center,),
            ),
          ),
          Card (
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