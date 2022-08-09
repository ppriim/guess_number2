import 'dart:math';

class Game{
  int answer = 0;
  int maxNumber = 0 ;
  int colWidth = 50;

  Game(int? maxNumber){
    if (maxNumber == null){
      this.maxNumber = 100;
    }else{
      this.maxNumber = maxNumber;
    }
    var r = Random();
    answer = r.nextInt(this.maxNumber)+1;
    //print('      Answer is $answer');
  }

  int doGuess(int num, int count){
    if(num > answer){
      print('║ ➜ $num is TOO HEIGTH! ▲');
      print("╟"+ replString("─",colWidth));
      return 0;
    }else if(num < answer){
      print('║ ➜ $num is TOO LOW! ▼');
      print("╟"+ replString("─",colWidth));
      return 0;
    }else{
      print('║ ➜ $num is correct ❤, total guesses $count');
      print("╟"+ replString("─",colWidth));
      return 1;
    }
  }
  String replString(String s, int n){
    String result = "";
    for(int i=0;i<n;i++){
      result += s;
    }
    return result;
  }
}