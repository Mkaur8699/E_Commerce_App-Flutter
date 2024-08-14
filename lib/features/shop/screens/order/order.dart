import 'package:e_commerce_app/features/shop/screens/order/widgets/orders_list.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark? TColors.black : TColors.white,
        title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: const Padding(padding: EdgeInsets.all(TSizes.defaultSpace),

      ///Orders
      child: TOrderListItems(),
      ),
    );
  }
}
