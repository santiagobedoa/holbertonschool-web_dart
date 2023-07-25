import 'dart:convert';
import '4-util.dart';

Future<String> fetchUserOrders(String id) async {
  var orders = {
    "7ee9a243-01ca-47c9-aa14-0149789764c3": ["pizza", "orange"]
  };
  try {
    return Future.delayed(
        const Duration(seconds: 2), () => json.encode(orders[id]));
  } catch (err) {
    return "error caught : $err";
  }
}

Future<String> fetchUserData() => Future.delayed(
      const Duration(seconds: 2),
      () =>
          '{"id" : "7ee9a243-01ca-47c9-aa14-0149789764c3", "username" : "admin"}',
    );

Future<String> fetchProductPrice(String product) async {
  var products = {"pizza": 20.30, "orange": 10, "water": 5, "soda": 8.5};
  try {
    return Future.delayed(
        const Duration(seconds: 2), () => json.encode(products[product]));
  } catch (err) {
    return "error caught : $err";
  }
}

Future<double> calculateTotal() async {
  try {
    double totalPrice = 0;
    
    final userData = await fetchUserData();
    final Map<String, dynamic> userDataMap = json.decode(userData);
    final String userId = userDataMap['id'];
    final userOrdersData = await fetchUserOrders(userId);
    final List<dynamic> userOrders = json.decode(userOrdersData);

    for (var product in userOrders) {
      final productPriceData = await fetchProductPrice(product);
      final double productPrice = json.decode(productPriceData);
      totalPrice += productPrice;
    }

    return totalPrice;
  } catch (err) {
    print('error caught: $err');
    return -1;
  }
}
