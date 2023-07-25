import 'dart:convert';
import '4-util.dart';

Future<double> calculateTotal() async {
  try {
    double totalPrice = 0;
    
    final userData = await fetchUserData();
    final Map<String, dynamic> userDataMap = json.decode(userData);
    final String userId = userDataMap['id'];
    final userOrders = await fetchUserOrders(userId);

    for (var product in userOrders) {
      final productPrice = await fetchProductPrice(product);
      final double price = json.decode(productPrice);
      totalPrice += price;
    }

    return totalPrice;
  } catch (err) {
    print('error caught: $err');
    return -1;
  }
}

