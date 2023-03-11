import 'package:flutter/material.dart';
import 'package:flutter07_tictactoe/game_screen.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  
void toPage(BuildContext ctx){
  Navigator.pushReplacementNamed(ctx,GameScreen.routeName);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
            color: Color.fromRGBO(22, 00, 59, 1),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Tic Tac Toe',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //   mainAxisSize: MainAxisSize.min,
                    children: const [
                      SizedBox(
                          width: 93,
                          child: Icon(
                            //    IconData(0xf647, fontFamily: 'MaterialIcons'),
                            Icons.close_rounded,
                            //IconData(0xf645),
                            size: 130,
                            color: Color.fromRGBO(13, 115, 119, 1),
                          )),
                      Padding(
                          padding: EdgeInsets.only(right: 7),
                          //width:,
                          child: Icon(
                            Icons.circle_outlined,
                            size: 90,
                            color: Color.fromRGBO(20, 255, 236, 1),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  Text(
                    'Choose your play mode',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                 buttonGame(context, 'With AI','0'),
                  buttonGame(context,'With Friend','1')
                ],
              ),
            ),
            ),
      
    );
  }

  SizedBox buttonGame(BuildContext context,String label,String mode) {
    return SizedBox(
                width: 230,
                child: ElevatedButton(
                  onPressed: ()=>  Navigator.pushNamed(context,GameScreen.routeName,arguments: mode),
                  child: Text(label),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              );
  }
}
