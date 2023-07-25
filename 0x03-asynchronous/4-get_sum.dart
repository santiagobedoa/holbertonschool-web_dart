import 'dart:convert';
import '4-util.dart';

Future<double> calculateTotal() async {
  try {
    double totalPrice = 0;
    
    final Map<String, dynamic> userData = json.decode(await fetchUserData());
    final String userId = userData['id'];
    final List<dynamic> userOrders = json.decode(await fetchUserOrders(userId));

    for (int idx = 0; idx < userOrders.length; idx++) {
      double productPrice = await fetchProductPrice(userOrders[idx]);
      totalPrice += json.decode(productPrice);
    }

    return totalPrice;
  } catch (err) {
    print('error caught: $err');
    return -1;
  }
}

