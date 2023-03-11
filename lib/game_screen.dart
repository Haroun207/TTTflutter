// ignore_for_file: curly_braces_in_flow_control_structures, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter07_tictactoe/game.dart';
import 'package:google_fonts/google_fonts.dart';

class GameScreen extends StatefulWidget {
  GameScreen();
  static final routeName = 'GameScreen';
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // List disElement = [
  //   null,
  //   null,
  //   null,
  //   null,
  //   null,
  //   null,
  //   null,
  //   null,
  //   null,
  // ];
  int turn = 0;
  var gam = TicTacToe();
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    var mode = int.parse(ModalRoute.of(context)!.settings.arguments as String);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 29),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.close_rounded,
                        size: 45,
                        color: Color.fromRGBO(13, 115, 119, 1),
                      ),
                      Text('${gam.xWins} Wins'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.balance,
                        size: 35,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text('${gam.draws} Draws'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.circle_outlined,
                        size: 40,
                        color: Color.fromRGBO(20, 255, 236, 1),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('${gam.oWins} Wins'),
                    ],
                  ),
                ],
              ),
            ),
            GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(10),
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (ctx, index) {
                  return InkWell(
                    focusColor: Colors.blue,
                    highlightColor: Colors.blue,
                    customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    onTap: () {
                      if (mode == 1) {
                        if (gam.disElement[index] == null)
                          setState(() {
                            if (gam.tapped(index, isSwitched)) {
                              if (gam.turn % 2 == 1) {
                                isSwitched ? gam.oWins++ : gam.xWins++;
                                buildDialog(context, isSwitched ? 0 : 1);
                              } else {
                                isSwitched ? gam.xWins++ : gam.oWins++;
                                buildDialog(context, isSwitched ? 1 : 0);
                              }
                            } else if (gam.turn == 9) {
                              gam.draws++;
                              buildDialog(context, 2);
                            }
                          });
                        // gam.turn++;
                      } else {
                        if (gam.disElement[index] == null)
                          setState(() {
                            //   gam.turn+=2;
                            TicTacToe.vsPcDetector[index] = TicTacToe.X;
                            if (gam.tapped(index)) {
                              gam.xWins++;

                              buildDialog(context, 1);
                            } else if (gam.turn == 9) {
                              gam.draws++;
                              buildDialog(context, 2);
                            } else if (gam.pcTapped() == true) {
                              gam.oWins++;
                              buildDialog(context, 0);
                            }
                          });
                      }
                      print(gam.turn);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: gam.disElement[index],
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber),
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(color: Colors.black12),
                        ],
                      ),
                    ),
                  );
                }),
            SizedBox(
              height: 15,
            ),
            if (mode == 1)
              Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    isSwitched
                        ? "It's ${gam.turn % 2 == 0 ? 'O' : 'X'} Turn"
                        : "It's ${gam.turn % 2 == 0 ? 'X' : 'O'} Turn",
                    style:
                        GoogleFonts.roboto(color: Colors.black, fontSize: 30),
                  ),
                  SizedBox(
                    width: 200,
                    //  height: 100,
                    child: SwitchListTile.adaptive(
                        title: Text(
                          isSwitched ? 'O Start' : 'X Start',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        value: isSwitched,
                        onChanged: (nVal) {
                          setState(() {
                            isSwitched = nVal;
                            gam.playagain();
                          });
                        }),
                  ),
                ],
              ),
          ],
        ),
      ),
      extendBody: true,
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        // color: Color.fromRGBO(97, 00, 148, .3),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  gam.playagain();
                });
              },
              child: Text('Play Again'),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  gam.reset();
                });
              },
              child: Text('New Game'),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<dynamic> buildDialog(BuildContext context, int winner) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text(winner < 2
                ? winner == 1
                    ? 'X wins'
                    : 'O wins'
                : 'It\'s a Draw'),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      gam.playagain();
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('Play Again')),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      gam.reset();
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('New Game'))
            ],
          );
        });
  }
}
