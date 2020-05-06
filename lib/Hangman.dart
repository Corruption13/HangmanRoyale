


class GameInstance{

  double score;
  int mistakes;
  int combo;
  int totalUnique;

  String word;
  List<String> correctLetters ;
  List<String> incorrectLetters ;
  Map uniqueLetters ;


  GameInstance(word){
    this.word = word;
    score = 0 ;
    mistakes = 0;
    combo = 1;
    correctLetters = [" "];
    incorrectLetters = [];
    totalUnique = 0;
    uniqueLetters = {} ;
    init() ;

  }

  void init() {

      for(int i = 0; i< word.length; i++ ){
          if(uniqueLetters.containsKey(word[i])) {
            uniqueLetters[word[i]] += 1;
          }
          else {
            uniqueLetters[word[i]] = 1;
            totalUnique++;
          }
      }

  } // init

  String setImage(String passthrough){
      print("Yes $mistakes ");
      if(mistakes == 0){
        return "assets/h0.gif" ;
      }
      else if(mistakes == 1){
        return "assets/h1.gif" ;
      }
      else if(mistakes == 2){
        return "assets/h2.gif" ;
      }
      else if(mistakes == 3){
        return "assets/h3.gif" ;

      }
      else if(mistakes == 4){
        return "assets/h4.gif" ;
      }
      else if(mistakes == 5){
        return "assets/h5.gif" ;
      }
      else if(mistakes == 6){
        return "assets/h6.gif" ;
      }

      else return passthrough ;
  }

  String wordShow(int mode){
    String reveal = "" ;
    if(mode == 1)
      return word;
    else {
      word.split('').forEach((ch) {
        if (ch == " ")
          reveal = reveal + "  ";
        else if (correctLetters.contains(ch))
          reveal = reveal + ch;
        else
          reveal = reveal + "_";
      }

      );

      return reveal;
    }
  } // wordShow

  int gameStatus(){


    print("$correctLetters -> $uniqueLetters -> $totalUnique");
    if(mistakes >= 6)
      return -1;

    if(totalUnique == correctLetters.length)
      return 1;

    else
      return 0 ;
  } // gameStatus

}

