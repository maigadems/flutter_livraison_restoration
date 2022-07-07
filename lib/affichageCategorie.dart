import 'package:flutter/material.dart';
import 'package:flutter_livraison_restoration/affichageRestaurant.dart';
import 'package:flutter_livraison_restoration/connection.dart';

class AffichageCategorie extends StatefulWidget{
  @override
  AffichageCategorieState createState() => AffichageCategorieState();

}

class AffichageCategorieState extends State <AffichageCategorie> {
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


         child: GridView.count(crossAxisCount: 2,
             padding: EdgeInsets.only(top: 10),
             children: <Widget>[
               Container(

                 alignment: Alignment.topCenter,
                   child: Column(

                     crossAxisAlignment: CrossAxisAlignment.stretch,
                     children: [

                       Padding(padding: EdgeInsets.only(top: 30)),
                       Expanded(
                         child: TextFormField(

                           decoration: InputDecoration(
                               prefixIcon: Icon(Icons.search),

                               border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
                           ),
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
                         Image(image: NetworkImage("https://tse3.mm.bing.net/th?id=OIP.OF0NF2ya3Yz3dv43NOtsfQHaHa&pid=Api&P=0&w=154&h=154"),width:130),
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
                         Image(image: NetworkImage("https://tse2.mm.bing.net/th?id=OIP.hyXEFe_klq5jdCqLFpwpyAHaFj&pid=Api&P=0&w=217&h=162"), width: 150,),
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
                         Image(image: NetworkImage("https://st2.depositphotos.com/1864489/6577/v/950/depositphotos_65775759-stock-illustration-asian-food-logo.jpg"),width:130,),
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
                         Image(image: NetworkImage("https://img.freepik.com/vecteurs-premium/creation-logo-bonne-nourriture_79169-10.jpg?size=338&ext=jpg&ga=GA1.2.822310589.1656094796"),width: 130,),
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
                         Image(image: NetworkImage("https://tse2.mm.bing.net/th?id=OIP.9lqhj5bSACjNRQAqacBcHgHaHa&pid=Api&P=0&w=171&h=171"),width: 125,),
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
                         Image(image: NetworkImage("https://tse1.mm.bing.net/th?id=OIP.yEnPSd0zQBaBEdMSClV79wHaHa&pid=Api&P=0&w=154&h=154"),width: 125,),
                         Text("Français",style: new TextStyle(fontSize: 17),)
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
                   onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>AffichageRestaurant()));
                   },
                   child: Center(
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       children: <Widget> [
                         Padding(padding: EdgeInsets.only(top: 15)),
                         Image(image: NetworkImage("https://tse3.mm.bing.net/th?id=OIP.F4AcheHeZjx6GIf8zyiONQAAAA&pid=Api&P=0&w=218&h=186"),width: 125,),
                         Text("Sénégalais",style: new TextStyle(fontSize: 17),)
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
                   onTap: () {

                   },
                   child: Center(
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       children: <Widget> [
                         Padding(padding: EdgeInsets.only(top: 20)),
                         Image(image: NetworkImage("https://tse1.mm.bing.net/th?id=OIP.gk3K7MUi4ZFe2g621uB64AHaFV&pid=Api&P=0&w=234&h=168"),width: 145,),
                         Text("Américain",style: new TextStyle(fontSize: 17),)
                       ],
                     ),
                   ),
                 ),
               ),

               Spacer(),
                       ]
                       ),
      //),

      ),
        floatingActionButton:
        Container(

          margin: EdgeInsets.only(left: 35),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.white),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
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
              IconButton(onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext ctx) {
                      return Connection();
                    }
                    )
                );
              },
                icon: Icon(Icons.shopping_cart_outlined,
                  //color: Color.fromRGBO(252, 14, 14, 1),
                  size: 30,

                ),
                //splashColor: Colors.pink,
                //splashRadius: 20,

              ),
              IconButton(onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext ctx) {
                      return AffichageRestaurant();
                    }
                    )
                );
              },
                icon: Icon(Icons.output,
                  color: Colors.grey,
                  size: 30,

                ),
                //splashColor: Colors.pink,
                //splashRadius: 20,

              ),
              Divider(),

            ],
          ),
        ),
    );
  }
}