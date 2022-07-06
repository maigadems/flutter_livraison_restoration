import 'package:flutter/material.dart';
import 'package:flutter_livraison_restoration/connection.dart';

class AffichageRestaurant extends StatefulWidget{
  @override
  AffichageRestaurantState createState() => AffichageRestaurantState();

}

class AffichageRestaurantState extends State <AffichageRestaurant> {
  TextEditingController search_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      /*appBar: AppBar(
        title: Text(
          'Salut'
        ),
      ),*/
      body:Container(
        //padding: EdgeInsets.only(top: 20),
        //margin: EdgeInsets.only(left: 18,right: 18, bottom: 18),
         child: GridView.count(crossAxisCount: 2,
             padding: EdgeInsets.only(top: 10),
             children: <Widget>[
               Container(
                 alignment: Alignment.topLeft,
                   child: Column(
                     //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     crossAxisAlignment: CrossAxisAlignment.stretch,
                     children: [
                       Padding(padding: EdgeInsets.only(top: 20)),
                       TextFormField(
                             decoration: InputDecoration(
                               border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
                             ),
                       ),
                       Padding(padding: EdgeInsets.only(top: 25)),

                       Text(" Veillez  Sélectionner \n votre type de \n restaurant",
                         style: TextStyle(
                           fontSize: 20,
                           color: Color.fromRGBO(252, 14, 14, 1),
                         ),


                       ),
                     ],
                   ),


               ),

         

               Padding(padding: EdgeInsets.only(top: 5)),
               Card(
                 color: Colors.red[100],
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(30)
                 ),
                 margin: EdgeInsets.all(8.0),
                 child: InkWell(
                   onTap: () {},
                   child: Center(
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       children: <Widget> [
                         Padding(padding: EdgeInsets.only(top: 15)),
                         Image(image: AssetImage("images/cheenese.jfif"),width:130,),
                         Text("chinois",style: new TextStyle(fontSize: 17),)
                       ],
                     ),
                   ),
                 ),
               ),
               Card(
                 color: Colors.red[100],
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(30)
                 ),
                 margin: EdgeInsets.all(8.0),
                 child: InkWell(
                   onTap: () {},
                   child: Center(
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       children: <Widget> [
                         Padding(padding: EdgeInsets.only(top: 15)),
                         Image(image: AssetImage("images/vegan.jfif"), width: 150,),
                         Text("Végétarien",style: new TextStyle(fontSize: 17),),
                       ],
                     ),
                   ),
                 ),
               ),
               Card(
                 color: Colors.red[100],
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(30)
                 ),
                 margin: EdgeInsets.all(8.0),
                 child: InkWell(
                   onTap: () {},
                   child: Center(
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       children: <Widget> [
                         Padding(padding: EdgeInsets.only(top: 15)),
                         Image(image: AssetImage("images/asianfood.jfif"),width:130,),
                         Text("Japonais",style: new TextStyle(fontSize: 17),)
                       ],
                     ),
                   ),
                 ),
               ),
               Card(
                 color: Colors.red[100],
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(30)
                 ),
                 margin: EdgeInsets.all(8.0),
                 child: InkWell(
                   onTap: () {},
                   child: Center(
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       children: <Widget> [
                         Padding(padding: EdgeInsets.only(top: 15)),
                         Image(image: AssetImage("images/maiga.jfif"),width: 100,),
                         Text("Maiga",style: new TextStyle(fontSize: 17),)
                       ],
                     ),
                   ),
                 ),
               ),
               Card(
                 color: Colors.red[100],
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(30)
                 ),
                 margin: EdgeInsets.all(8.0),
                 child: InkWell(
                   onTap: () {},
                   child: Center(
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       children: <Widget> [
                         Padding(padding: EdgeInsets.only(top: 15)),
                         Image(image: AssetImage("images/asian.jfif"),width: 125,),
                         Text("Indien",style: new TextStyle(fontSize: 17),)
                       ],
                     ),
                   ),
                 ),
               ),
               Card(
                 color: Colors.red[100],
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(30)
                 ),
                 margin: EdgeInsets.all(8.0),
                 child: InkWell(
                   onTap: () {},
                   child: Center(
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       children: <Widget> [
                         Padding(padding: EdgeInsets.only(top: 15)),
                         Image(image: AssetImage("images/français.jfif"),width: 125,),
                         Text("Français",style: new TextStyle(fontSize: 17),)
                       ],
                     ),
                   ),
                 ),
               ),
               Container(
                 //padding: EdgeInsets.only(left: 20),
                 /*decoration: ShapeDecoration(
                   shape: RoundedRectangleBorder()
                 )*/
                 alignment: Alignment.topCenter,
                 child:Row(
                   children: [
                     //Padding(padding: EdgeInsets.only(left: 30)),
                     Spacer(),
                     IconButton(onPressed: (){
                       Navigator.of(context).push(
                           MaterialPageRoute(builder: (BuildContext ctx) {
                             return Connection();
                           }
                           )
                       );
                     },
                       icon: Icon(Icons.home,
                         color: Color.fromRGBO(252, 14, 14, 1),
                         size: 30,

                       ),
                       //splashColor: Colors.pink,
                       //splashRadius: 20,

                     ),
                     //Padding(padding: EdgeInsets.only(right: 30)),
                     Spacer(),

                     IconButton(onPressed: (){
                       Navigator.of(context).push(
                           MaterialPageRoute(builder: (BuildContext ctx) {
                             return Connection();
                           }
                           )
                       );
                     },
                       icon: Icon(Icons.home,
                         color: Color.fromRGBO(252, 14, 14, 1),
                         size: 30,

                       ),
                       //splashColor: Colors.pink,
                       //splashRadius: 20,

                     ),
                     Spacer(),

                     IconButton(onPressed: (){
                       Navigator.of(context).push(
                           MaterialPageRoute(builder: (BuildContext ctx) {
                             return Connection();
                           }
                           )
                       );
                     },
                       icon: Icon(Icons.home,
                         color: Color.fromRGBO(252, 14, 14, 1),
                         size: 30,

                       ),
                       //splashColor: Colors.pink,
                       //splashRadius: 20,

                     ),
                  ]

                     ),
               )
                       ]
                       ),
      )
    );
  }
}