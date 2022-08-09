import 'dart:math';
import 'dart:io';

import 'game.dart'; //import มา

void main(){
  stdout.write('What is the maximum random number you want to set? : ');
  var max = stdin.readLineSync();
  var maxRandom = int.tryParse(max!);
  var game = new Game(maxRandom);
  int result = 0;
  int count = 0;

  List<int> myList = []; //var myList = <int>[]; ได้ทั้งคู่
  
  //print("╔  ╚  ═  ║  ╟  ─  ➜  ▲  ▼  ❤");
  int colWidth = 50;
  var line2 = game.replString("═", colWidth);
  print("╔$line2");
  print("║" + game.replString(" ", (colWidth/2).toInt() - (16/2).toInt()) + "GUESS THE NUMBER");
  print("╟"+ game.replString("─",colWidth));

  do {
    if(maxRandom == null){
      stdout.write('║ Please guess the number between 1 and 100 : '); //เหมือน print()
    }else{
      stdout.write('║ Please guess the number between 1 and $maxRandom : '); //เหมือน print()
    }
    var input = stdin.readLineSync();
    var guess = int.tryParse(input!);
    ++count;

    if(guess == null){
      print('║ Please enter number only');
      print("╟"+ game.replString("─",colWidth));
      continue;
    }

    result = game.doGuess(guess ,count);

    while(result == 1){
      stdout.write('║ Do you want to play again? (Y/N) : ');
      String? ans = stdin.readLineSync();
      myList.add(count);

      if (ans == 'Y' || ans == 'y') {
        print("╚"+ game.replString("─",colWidth));
        print("");
        print("╔$line2");
        print("║" + game.replString(" ", (colWidth/2).toInt() - (16/2).toInt()) + "GUESS THE NUMBER");
        print("╟"+ game.replString("─",colWidth));
        stdout.write('║ What is the maximum random number you want to set? : ');
        max = stdin.readLineSync();
        maxRandom = int.tryParse(max!);
        game = Game(maxRandom); //สุ่มเลขใหม่
        count = 0;
        result = 0;

      } else if (ans == 'N' || ans == 'n') {
        var len = myList.length;
        print("╚"+ game.replString("─",colWidth));
        print("You've played $len game");
        for (int i = 0; i < myList.length; i++) {
          print("🚀 Game #" + (i+1).toString() + ": " + myList[i].toString() + " guesses.");
        }
        break;
      } else {
        print('║ Please enter (Y/N) only');
        print("╟"+ game.replString("─",colWidth));

        result = 1;
      }
    }
  }while(result != 1);

}
