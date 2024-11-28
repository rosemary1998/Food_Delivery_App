import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/app_provider.dart';


class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: provider.cart.isEmpty
      //  body:provider.cartItems.isEmpty
          ? Center(child: Text('Your cart is empty!'))
          : ListView.builder(
        itemCount: provider.cart.length,
        //  itemCount: provider.cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = provider.cart[index];
        //  final cartItem = provider.cartItems[index];
          return ListTile(

            title: Text(cartItem.item.name),
            subtitle: Text('Quantity: ${cartItem.quantity}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => provider.addToCart(cartItem.item),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => provider.removeFromCart(cartItem.item),
                ),
              ],
            ),

          );
        },
      ),
      bottomNavigationBar: provider.cart.isNotEmpty
     // bottomNavigationBar: provider.cartItems.isNotEmpty
          ? ElevatedButton(
        child: Text('Clear Cart'),
        onPressed: provider.clearCart,
      )
          : null,
    );
  }
}
