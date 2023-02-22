import 'package:flutter/material.dart';
import 'package:order/features/restaurant/data/model/restaurant_model.dart';
import 'package:order/features/restaurant/presentation/pages/get_menu_pages/get_menu_page.dart';

class AllRestaurantWidget extends StatelessWidget {
  final List<RestaurantModel> restaurantModel;
  const AllRestaurantWidget({
    super.key,
    required this.restaurantModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: restaurantModel.length,
      itemBuilder: (context, index) {
        return ListTile(
          trailing: const Icon(Icons.arrow_circle_right),
          title: Text(
            restaurantModel[index].restaurantName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            restaurantModel[index].restaurantDescription,
            style: const TextStyle(fontSize: 16),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AllMenuPage()));
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(thickness: 1);
      },
    );
  }
}
