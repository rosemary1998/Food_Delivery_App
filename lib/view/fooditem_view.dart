import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/app_provider.dart';
import 'cart_view.dart';

class FoodItemsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(provider.selectedCategory,
            style: TextStyle(fontSize: 30,
            fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartView()),
              );
            },
          )
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemCount: provider.foodItems.length,
        itemBuilder: (context, index) {
          final food = provider.foodItems[index];
          return Card(
            child: Column(
              children: [
                Image.network(food.thumbnail, height: MediaQuery.of(context).size.height * .5),
                SizedBox(height: 10,),
                Text(food.name),
               SizedBox(height: 10,),
                ElevatedButton(
                  child: Text('Add to Cart'),
                  //onPressed: () => provider.addToCart(food),
                  onPressed: () {
                    provider.addToCart(food);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CartView(),
                      ),
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
