import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class TicTacToe {
  static const blank = 1;
  static const X = 2;
  static const O = 0;
  List disElement = [
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
  ];
  static List<int> vsPcDetector = [
    blank,
    blank,
    blank,
    blank,
    blank,
    blank,
    blank,
    blank,
    blank
  ];
  int xWins = 0, oWins = 0, draws = 0;
  int turn = 0;
  bool tapped(int index, [starter=false]) {
    if (turn % 2 == 1 && disElement[index] == null) {
      disElement[index] = starter
          ? const Icon(
              Icons.close_rounded,
              size: 130,
              color: Color.fromRGBO(13, 115, 119, 1),
            )
          : const Icon(
              Icons.circle_outlined,
              size: 90,
              color: Color.fromRGBO(20, 255, 236, 1),
            );
            
    } else if (turn % 2 == 0 && disElement[index] == null) {
      disElement[index] = starter
          ? const Icon(
              Icons.circle_outlined,
              size: 90,
              color: Color.fromRGBO(20, 255, 236, 1),
            )
          : const Icon(
              Icons.close_rounded,
              size: 130,
              color: Color.fromRGBO(13, 115, 119, 1),
            );
    }
    turn++;
    return checkWinner();
  }

  bool pcTapped() {
    var index;
    turn++;
    if (vsPcDetector[0] + vsPcDetector[1] == 0 && vsPcDetector[2] == 1 ||
        vsPcDetector[5] + vsPcDetector[8] == 0 && vsPcDetector[2] == 1 ||
        vsPcDetector[4] + vsPcDetector[6] == 0 && vsPcDetector[2] == 1)
      index = 2;
    else if (vsPcDetector[0] + vsPcDetector[2] == 0 && vsPcDetector[1] == 1 ||
        vsPcDetector[4] + vsPcDetector[7] == 0 && vsPcDetector[1] == 1)
      index = 1;
    else if (vsPcDetector[1] + vsPcDetector[2] == 0 && vsPcDetector[0] == 1 ||
        vsPcDetector[3] + vsPcDetector[6] == 0 && vsPcDetector[0] == 1 ||
        vsPcDetector[4] + vsPcDetector[8] == 0 && vsPcDetector[0] == 1)
      index = 0;
    else if (vsPcDetector[3] + vsPcDetector[4] == 0 && vsPcDetector[5] == 1 ||
        vsPcDetector[2] + vsPcDetector[8] == 0 && vsPcDetector[5] == 1)
      index = 5;
    else if (vsPcDetector[3] + vsPcDetector[5] == 0 && vsPcDetector[4] == 1 ||
        vsPcDetector[1] + vsPcDetector[7] == 0 && vsPcDetector[4] == 1 ||
        vsPcDetector[0] + vsPcDetector[8] == 0 && vsPcDetector[4] == 1 ||
        vsPcDetector[2] + vsPcDetector[6] == 0 && vsPcDetector[4] == 1)
      index = 4;
    else if (vsPcDetector[4] + vsPcDetector[5] == 0 && vsPcDetector[3] == 1 ||
        vsPcDetector[0] + vsPcDetector[6] == 0 && vsPcDetector[3] == 1)
      index = 3;
    else if (vsPcDetector[6] + vsPcDetector[7] == 0 && vsPcDetector[8] == 1 ||
        vsPcDetector[2] + vsPcDetector[5] == 0 && vsPcDetector[8] == 1 ||
        vsPcDetector[0] + vsPcDetector[4] == 0 && vsPcDetector[8] == 1)
      index = 8;
    else if (vsPcDetector[6] + vsPcDetector[8] == 0 && vsPcDetector[7] == 1 ||
        vsPcDetector[1] + vsPcDetector[4] == 0 && vsPcDetector[7] == 1)
      index = 7;
    else if (vsPcDetector[7] + vsPcDetector[8] == 0 && vsPcDetector[6] == 1 ||
        vsPcDetector[0] + vsPcDetector[3] == 0 && vsPcDetector[6] == 1 ||
        vsPcDetector[2] + vsPcDetector[4] == 0 && vsPcDetector[6] == 1)
      index = 6;
    else if (vsPcDetector[0] + vsPcDetector[1] == 4 && vsPcDetector[2] == 1 ||
        vsPcDetector[5] + vsPcDetector[8] == 4 && vsPcDetector[2] == 1 ||
        vsPcDetector[4] + vsPcDetector[6] == 4 && vsPcDetector[2] == 1)
      index = 2;
    else if (vsPcDetector[0] + vsPcDetector[2] == 4 && vsPcDetector[1] == 1 ||
        vsPcDetector[4] + vsPcDetector[7] == 4 && vsPcDetector[1] == 1)
      index = 1;
    else if (vsPcDetector[1] + vsPcDetector[2] == 4 && vsPcDetector[0] == 1 ||
        vsPcDetector[3] + vsPcDetector[6] == 4 && vsPcDetector[0] == 1 ||
        vsPcDetector[4] + vsPcDetector[8] == 4 && vsPcDetector[0] == 1)
      index = 0;
    else if (vsPcDetector[3] + vsPcDetector[4] == 4 && vsPcDetector[5] == 1 ||
        vsPcDetector[2] + vsPcDetector[8] == 4 && vsPcDetector[5] == 1)
      index = 5;
    else if (vsPcDetector[3] + vsPcDetector[5] == 4 && vsPcDetector[4] == 1 ||
        vsPcDetector[1] + vsPcDetector[7] == 4 && vsPcDetector[4] == 1 ||
        vsPcDetector[0] + vsPcDetector[8] == 4 && vsPcDetector[4] == 1 ||
        vsPcDetector[2] + vsPcDetector[6] == 4 && vsPcDetector[4] == 1)
      index = 4;
    else if (vsPcDetector[4] + vsPcDetector[5] == 4 && vsPcDetector[3] == 1 ||
        vsPcDetector[0] + vsPcDetector[6] == 4 && vsPcDetector[3] == 1)
      index = 3;
    else if (vsPcDetector[6] + vsPcDetector[7] == 4 && vsPcDetector[8] == 1 ||
        vsPcDetector[2] + vsPcDetector[5] == 4 && vsPcDetector[8] == 1 ||
        vsPcDetector[0] + vsPcDetector[4] == 4 && vsPcDetector[8] == 1)
      index = 8;
    else if (vsPcDetector[6] + vsPcDetector[8] == 4 && vsPcDetector[7] == 1 ||
        vsPcDetector[1] + vsPcDetector[4] == 4 && vsPcDetector[7] == 1)
      index = 7;
    else if (vsPcDetector[7] + vsPcDetector[8] == 4 && vsPcDetector[6] == 1 ||
        vsPcDetector[0] + vsPcDetector[3] == 4 && vsPcDetector[6] == 1 ||
        vsPcDetector[2] + vsPcDetector[4] == 4 && vsPcDetector[6] == 1)
      index = 6;
    else {
      var random = Random();

      do {
        index = random.nextInt(9);
      } while (disElement[index] != null);
    }
vsPcDetector[index]=O;
    disElement[index] =  const Icon(
            Icons.circle_outlined,
            size: 90,
            color: Color.fromRGBO(20, 255, 236, 1),
          );

    return checkWinner();
  }

  bool checkWinner() {
    if (disElement[0] == disElement[1] &&
            disElement[2] == disElement[1] &&
            disElement[0] != null ||
        disElement[0] == disElement[4] &&
            disElement[4] == disElement[8] &&
            disElement[0] != null ||
        disElement[0] == disElement[3] &&
            disElement[3] == disElement[6] &&
            disElement[0] != null ||
        disElement[3] == disElement[4] &&
            disElement[4] == disElement[5] &&
            disElement[3] != null ||
        disElement[6] == disElement[7] &&
            disElement[7] == disElement[8] &&
            disElement[6] != null ||
        disElement[1] == disElement[4] &&
            disElement[4] == disElement[7] &&
            disElement[1] != null ||
        disElement[2] == disElement[5] &&
            disElement[5] == disElement[8] &&
            disElement[2] != null ||
        disElement[2] == disElement[4] &&
            disElement[4] == disElement[6] &&
            disElement[2] != null) return true;
    return false;
  }

  void reset() {
    playagain();
    xWins = oWins = draws = 0;
  }

  void playagain() {
    disElement = [
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
    ];
    vsPcDetector = [
    blank,
    blank,
    blank,
    blank,
    blank,
    blank,
    blank,
    blank,
    blank
  ];
    turn = 0;
  }
}
