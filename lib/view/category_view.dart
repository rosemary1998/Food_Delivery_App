import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/app_provider.dart';
import 'fooditem_view.dart';


class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(' What\'s on your mind?',
            style: TextStyle(fontSize: 30,
            fontWeight: FontWeight.bold),)),
      body: FutureBuilder(
        future: provider.loadCategories(),
        builder: (context, snapshot) {

          return ListView.builder(
            itemCount: provider.categories.length,
            itemBuilder: (context, index) {
              final category = provider.categories[index];
              return ListTile(

                title: Text(category.name),
               leading: Image.network(category.thumbnail),
                onTap: () {
                  provider.loadFoodItems(category.name);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FoodItemsView(),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

