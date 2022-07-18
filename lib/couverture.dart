import 'dart:ffi';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'accueil.dart';
class Couverture extends StatefulWidget {
  const Couverture({Key? key}) : super(key: key);
  State<Couverture>  createState() => CouvertureState();
}

class CouvertureState extends State<Couverture> {
  int _currentindex = 0;

  final  PageController _pageController = PageController();

    @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CustomPaint(
            painter: ArcPainter(),
            child: SizedBox(
              height: size.height / 1.4,
              width: size.width,
            ),
          ),
          Positioned(
            right: 5,
              left: 5,
              top: 100,
              child:Lottie.asset(
                  tabs[_currentindex].chemin,
                  key: Key('${Random().nextInt(999999999)}'),
                  width: 600,
                  alignment: Alignment.topCenter
              ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 270,
              child: Column(
                children: [
                  Flexible(child:
                  PageView.builder(
                    itemBuilder: (BuildContext context, int index){
                      OnboardingModel tab = tabs[index];
                      return Column(
                        children: [
                          Text(
                            tab.title,
                            style: GoogleFonts.viga(
                                fontSize: 25,
                              color: Colors.white
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            tab.subtitle,
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: Colors.white70,
                              fontWeight: FontWeight.w600
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],

                      );

                    },
                    itemCount: tabs.length,
                    controller: PageController(),
                    onPageChanged: (value){
                      _currentindex = value;
                      setState((){
                      });
                    },
                  ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for(int index = 0; index < tabs.length; index++)
                        _DotIndicator(isSelected: index == _currentindex),
                    ],
                  ),
                  const SizedBox(height: 40,)
                ],
              ),
            )
          )
        ],
      ),
    floatingActionButton: FloatingActionButton(
      splashColor: Color.fromRGBO(255, 6, 6, 1),
    onPressed: (){
      Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext ctx) {
            return Accueil();
          }));
       /* if (_currentindex == 2 ){
          _pageController.animateTo(0, duration: const Duration(milliseconds:
          300), curve: Curves.linear);

        }
        else{
          _pageController.nextPage(
              duration: const Duration(milliseconds: 100),
              curve: Curves.linear
          );
        } */
    },
    child: const Icon(Icons.not_started, color: Colors.white,size: 40,),
      backgroundColor: Colors.transparent,
    ),
    );
  }
}

class ArcPainter extends CustomPainter{
  @override

  void paint(Canvas canvas,  size){
    Path redArc = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height - 170)
      ..quadraticBezierTo(size.width/2, size.height, size.width, size.height - 170)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(redArc, Paint()..color = Color.fromRGBO(255, 6, 6, 1));

    Path WhiteArc = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height - 185)
      ..quadraticBezierTo(size.width/2, size.height - 70, size.width, size
          .height - 185)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(WhiteArc, Paint()..color = Colors.white);


  }

  bool shouldRepaint(covariant CustomPainter oldDelegate){
    return false;
  }
}

class _DotIndicator extends StatelessWidget {
   final bool isSelected;
   const _DotIndicator ({Key? key, required this.isSelected}) : super
       (key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: EdgeInsets.only(right: 6),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Color.fromRGBO(255, 6, 6, 1) : Colors.white38
        ),

      ),
    );
  }

}

class OnboardingModel {
  final String chemin;
  final String title;
  final String subtitle;

  OnboardingModel(this.chemin,this.title,this.subtitle);
}

List<OnboardingModel> tabs = [
  OnboardingModel(
    'lib/assets/boubakh1.json',
    'Choisissez votre plat',
    'Lorsque vous commandez\n vous bénéficiez de bons\n  de réduction '
        'exclusifs',
  ),
  OnboardingModel(
    'lib/assets/boubakh2.json',
    'Decouvrez les lieux',
    "Nous faisons en sorte qu'il soit facile de trouver\n la nourriture dont "
        "vous avez envie.\n Entrez votre adresse et laissez-nous vous aider",
  ),
  OnboardingModel(
    'lib/assets/boubakh3.json',
    'Livraison Rapide',
    'Nous rendons la commande de nourriture rapide\n, simple et  peu importe '
        'si vous commandez.',
  ),


];
