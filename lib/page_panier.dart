/*import 'package:flutter/material.dart';
import 'package:flutter_livraison_restoration/gestion_donnees'
    '/cart_controller2.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'gestion_donnees/plats.dart';

class PagePanier extends StatelessWidget {
   PagePanier({Key? key}) : super(key: key);

  //final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
      height: 600,
      child: ListView.builder(
          itemCount: controller.produits.length,
          itemBuilder: (context, index){
            return CartPlat(
              controller: controller,
              plat: controller.produits.keys.toList()[index],
              quantite: controller.produits.values.toList()[index],
              index: index,
            );
          }
      ),
    ),
    );
  }
}


class CartPlat extends StatelessWidget {
  final CartController controller;
  final Plats plat;
  final int quantite;
  final int index;


  const CartPlat({
    Key? key,
    required this.controller,
    required this.plat,
    required this.quantite,
    required this.index
  }
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          CircleAvatar(radius: 20, backgroundImage: NetworkImage(plat.photo),),
          Text(plat.nomPlat, style: TextStyle(fontSize: 15),),
         IconButton(onPressed: (){
          // controller.addPlat(plat);
          }, icon:Icon(Icons.add_circle, size: 1,)),



        ],
      ),
    );
  }
}

*/

