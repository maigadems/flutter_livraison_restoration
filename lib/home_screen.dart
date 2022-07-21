import 'package:flutter/material.dart';
import 'package:flutter_livraison_restoration/current_location.dart';
import 'package:flutter_livraison_restoration/simple_map_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Location'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: size.width,
        child: Column(
          children: [
            ElevatedButton(
                child: Text('Simple Map'),
                onPressed: (){
                  Get.  to(() =>  SimpleMapScreen());
                }
            ),
            ElevatedButton(
                child: Text('User current Location'),
                onPressed: (){
                  Get.to(() => CurrentLocation());
                }
            ),
          ],
        ),
      ),
    );
  }
}
