import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomeAppbarDetails extends StatelessWidget {
  const CustomeAppbarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24,),
      child: Row(
        children: [
         IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined,size: 30,),


         ),Spacer()
         , IconButton(
            onPressed: () {Navigator.pop(context);},
            icon: const Icon(FontAwesomeIcons.remove, size: 22),
          ),
        ],
      ),
    );
  }
}
