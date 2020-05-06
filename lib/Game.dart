import 'package:flutter/material.dart';
import 'Hangman.dart';
import "dart:math";
import 'dart:async';



List<String> wordDatabase = [
  "ABLE","ABOUT","ACCOUNT","ACID","ACROSS","ACT","ADDITION","ADJUSTMENT","ADVERTISEMENT",
  "AFTER","AGAIN","AGAINST","AGREEMENT","AIR","ALL","ALMOST","AMONG","AMOUNT","AMUSEMENT",
  "AND","ANGLE","ANGRY","ANIMAL","ANSWER","ANT","ANY","APPARATUS","APPLE","APPROVAL","ARCH",
  "ARGUMENT","ARM","ARMY","ART","AS","AT","ATTACK","ATTEMPT","ATTENTION","ATTRACTION","AUTHORITY",
  "AUTOMATIC","AWAKE","BABY","BACK","BAD","BAG","BALANCE","BALL","BAND","BASE","BASIN","BASKET","BATH",
  "BE","BEAUTIFUL","BECAUSE","BED","BEE","BEFORE","BEHAVIOUR","BELIEF","BELL","BENT","BERRY","BETWEEN",
  "BIRD","BIRTH","BIT","BITE","BITTER","BLACK","BLADE","BLOOD","BLOW","BLUE","BOARD","BOAT","BODY","BOILING",
  "BONE","BOOK","BOOT","BOTTLE","BOX","BOY","BRAIN","BRAKE","BRANCH","BRASS","BREAD","BREATH","BRICK","BRIDGE",
  "BRIGHT","BROKEN","BROTHER","BROWN","BRUSH","BUCKET","BUILDING","BULB","BURN","BURST","BUSINESS","BUT","BUTTER",
  "BUTTON","BY","CAKE","CAMERA","CANVAS","CARD","CARE","CARRIAGE","CART","CAT","CAUSE","CERTAIN","CHAIN","CHALK",
  "CHANCE","CHANGE","CHEAP","CHEESE","CHEMICAL","CHEST","CHIEF","CHIN","CHURCH","CIRCLE","CLEAN","CLEAR","CLOCK",
  "CLOTH","CLOUD","COAL","COAT","COLD","COLLAR","COLOUR","COMB","COME","COMFORT","COMMITTEE","COMMON","COMPANY",
  "COMPARISON","COMPETITION","COMPLETE","COMPLEX","CONDITION","CONNECTION","CONSCIOUS","CONTROL","COOK","COPPER",
  "COPY","CORD","CORK","COTTON","COUGH","COUNTRY","COVER","COW","CRACK","CREDIT","CRIME","CRUEL","CRUSH","CRY",
  "CUP","CUP","CURRENT","CURTAIN","CURVE","CUSHION","DAMAGE","DANGER","DARK","DAUGHTER","DAY","DEAD","DEAR",
  "DEATH","DEBT","DECISION","DEEP","DEGREE","DELICATE","DEPENDENT","DESIGN","DESIRE","DESTRUCTION","DETAIL",
  "DEVELOPMENT","DIFFERENT","DIGESTION","DIRECTION","DIRTY","DISCOVERY","DISCUSSION","DISEASE","DISGUST","DISTANCE",
  "DISTRIBUTION","DIVISION","DO","DOG","DOOR","DOUBT","DOWN","DRAIN","DRAWER","DRESS","DRINK","DRIVING",
  "DROP","DRY","DUST","EAR","EARLY","EARTH","EAST","EDGE","EDUCATION","EFFECT","EGG","ELASTIC","ELECTRIC",
  "END","ENGINE","ENOUGH","EQUAL","ERROR","EVEN","EVENT","EVER","EVERY","EXAMPLE","EXCHANGE","EXISTENCE",
  "EXPANSION","EXPERIENCE","EXPERT","EYE","FACE","FACT","FALL","FALSE","FAMILY","FAR","FARM","FAT","FATHER",
  "FEAR","FEATHER","FEEBLE","FEELING","FEMALE","FERTILE","FICTION","FIELD","FIGHT","FINGER","FIRE","FIRST","FISH","FIXED","FLAG","FLAME","FLAT","FLIGHT","FLOOR","FLOWER","FLY","FOLD","FOOD","FOOLISH","FOOT","FOR","FORCE","FORK","FORM","FORWARD","FOWL","FRAME","FREE","FREQUENT","FRIEND","FROM","FRONT","FRUIT","FULL","FUTURE","GARDEN","GENERAL","GET","GIRL","GIVE","GLASS","GLOVE","GO","GOAT","GOLD","GOOD","GOVERNMENT","GRAIN","GRASS","GREAT","GREEN","GREY","GRIP","GROUP","GROWTH","GUIDE","GUN","HAIR","HAMMER","HAND","HANGING","HAPPY","HARBOUR","HARD","HARMONY","HAT","HATE","HAVE","HE","HEAD","HEALTHY","HEAR","HEARING","HEART","HEAT","HELP","HIGH","HISTORY","HOLE","HOLLOW","HOOK","HOPE","HORN","HORSE","HOSPITAL","HOUR","HOUSE","HOW","HUMOUR","I","ICE","IDEA","IF","ILL","IMPORTANT","IMPULSE","IN","INCREASE","INDUSTRY","INK","INSECT","INSTRUMENT","INSURANCE","INTEREST","INVENTION","IRON","ISLAND","JELLY","JEWEL","JOIN","JOURNEY","JUDGE","JUMP","KEEP","KETTLE","KEY","KICK","KIND","KISS","KNEE","KNIFE","KNOT","KNOWLEDGE","LAND","LANGUAGE","LAST","LATE","LAUGH","LAW","LEAD","LEAF","LEARNING","LEATHER","LEFT","LEG","LET","LETTER","LEVEL","LIBRARY","LIFT","LIGHT","LIKE","LIMIT","LINE","LINEN","LIP","LIQUID","LIST","LITTLE","LIVING","LOCK","LONG","LOOK","LOOSE","LOSS","LOUD","LOVE","LOW","MACHINE","MAKE","MALE","MAN","MANAGER","MAP","MARK","MARKET","MARRIED","MASS","MATCH","MATERIAL","MAY","MEAL","MEASURE","MEAT","MEDICAL","MEETING","MEMORY","METAL","MIDDLE","MILITARY","MILK","MIND","MINE","MINUTE","MIST","MIXED","MONEY","MONKEY","MONTH","MOON","MORNING","MOTHER","MOTION","MOUNTAIN","MOUTH","MOVE","MUCH","MUSCLE","MUSIC","NAIL","NAME","NARROW","NATION","NATURAL","NEAR","NECESSARY","NECK","NEED","NEEDLE","NERVE","NET","NEW","NEWS","NIGHT","NO","NOISE","NORMAL","NORTH","NOSE","NOT","NOTE","NOW","NUMBER","NUT","OBSERVATION","OF","OFF","OFFER","OFFICE","OIL","OLD","ON","ONLY","OPEN","OPERATION","OPINION","OPPOSITE","OR","ORANGE","ORDER","ORGANIZATION","ORNAMENT","OTHER","OUT","OVEN","OVER","OWNER","PAGE","PAIN","PAINT","PAPER","PARALLEL","PARCEL","PART","PAST","PASTE","PAYMENT","PEACE","PEN","PENCIL","PERSON","PHYSICAL","PICTURE","PIG","PIN","PIPE","PLACE","PLANE","PLANT","PLATE","PLAY","PLEASE","PLEASURE","PLOUGH","POCKET","POINT","POISON","POLISH","POLITICAL","POOR","PORTER","POSITION","POSSIBLE","POT","POTATO","POWDER","POWER","PRESENT","PRICE","PRINT","PRISON","PRIVATE","PROBABLE","PROCESS","PRODUCE","PROFIT","PROPERTY","PROSE","PROTEST","PUBLIC","PULL","PUMP","PUNISHMENT","PURPOSE","PUSH","PUT","QUALITY","QUESTION","QUICK","QUIET","QUITE","RAIL","RAIN","RANGE","RAT","RATE","RAY","REACTION","READING","READY","REASON","RECEIPT","RECORD","RED","REGRET","REGULAR","RELATION","RELIGION","REPRESENTATIVE","REQUEST","RESPECT","RESPONSIBLE","REST","REWARD","RHYTHM","RICE","RIGHT","RING","RIVER","ROAD","ROD","ROLL","ROOF","ROOM","ROOT","ROUGH","ROUND","RUB","RULE","RUN","SAD","SAFE","SAIL","SALT","SAME","SAND","SAY","SCALE","SCHOOL","SCIENCE","SCISSORS","SCREW","SEA","SEAT","SECOND","SECRET","SECRETARY","SEE","SEED","SEEM","SELECTION","SELF","SEND","SENSE","SEPARATE","SERIOUS","SERVANT","SEX","SHADE","SHAKE","SHAME","SHARP","SHEEP","SHELF","SHIP","SHIRT","SHOCK","SHOE","SHORT","SHUT","SIDE","SIGN","SILK","SILVER","SIMPLE","SISTER","SIZE","SKIN","","SKIRT","SKY","SLEEP","SLIP","SLOPE","SLOW","SMALL","SMASH","SMELL","SMILE","SMOKE","SMOOTH","SNAKE","SNEEZE","SNOW","SO","SOAP","SOCIETY","SOCK","SOFT","SOLID","SOME","","SON","SONG","SORT","SOUND","SOUP","SOUTH","SPACE","SPADE","SPECIAL","SPONGE","SPOON","SPRING","SQUARE","STAGE","STAMP","STAR","START","STATEMENT","STATION","STEAM","STEEL","STEM","STEP","STICK","STICKY","STIFF","STILL","STITCH","STOCKING","STOMACH","STONE","STOP","STORE","STORY","STRAIGHT","STRANGE","STREET","STRETCH","STRONG","STRUCTURE","SUBSTANCE","SUCH","SUDDEN","SUGAR","SUGGESTION","SUMMER","SUN","SUPPORT","SURPRISE","SWEET","SWIM","SYSTEM","TABLE","TAIL","TAKE","TALK","TALL","TASTE","TAX","TEACHING","TENDENCY","TEST","THAN","THAT","THE","THEN","THEORY","THERE","THICK","THIN","THING","THIS","THOUGHT","THREAD","THROAT","THROUGH","THROUGH","THUMB","THUNDER","TICKET","TIGHT","TILL","TIME","TIN","TIRED","TO","TOE","TOGETHER","TOMORROW","TONGUE","TOOTH","TOP","TOUCH","TOWN","TRADE","TRAIN","TRANSPORT","TRAY","TREE","TRICK","TROUBLE","TROUSERS","TRUE","TURN","TWIST","UMBRELLA","UNDER","UNIT","UP","USE","VALUE","VERSE","VERY","VESSEL","VIEW","VIOLENT","VOICE","WAITING","WALK","WALL","WAR","WARM","WASH","WASTE","WATCH","WATER","WAVE","WAX","WAY","WEATHER","WEEK","WEIGHT","WELL","WEST","WET","WHEEL","WHEN","WHERE","WHILE","WHIP","WHISTLE","WHITE","WHO","WHY","WIDE","WILL","WIND","WINDOW","WINE","WING","WINTER","WIRE","WISE","WITH","WOMAN","WOOD","WOOL","WORD","WORK","WORM","WOUND","WRITING","WRONG","YEAR","YELLOW","YES","YESTERDAY","YOU","YOUNG","BERNHARD","BREYTENBACH","ANDROID" ] ;



class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {


  void state2(){
    setState(() {
      // to reload widget.
      imgUrl = game.setImage(imgUrl);
      print(game.mistakes);
      if(game.gameStatus() == 0){
        if(game.totalUnique - game.correctLetters.length > 2 && game.combo < -1){
          print("Lucky Reveal!") ;
          int counter = 0;
          while(counter< 5) {
            int num = rng.nextInt(game.word.length - 1);
            String character = game.word[num];
            if (!game.correctLetters.contains(character)) {
              game.correctLetters.add(character);
              print("Revealed $character");
              message = "Score: ${game.score} - Lucky Reveal! ";
              break;
            }
            else{
              counter++;
            }
          }
        }
        else{
          message = "Score: ${game.score.toInt()} - Combo: ${game.combo}";
        }
      }
      else if(game.gameStatus() == -1){
        mode = 1;
        message = "You lost! - Score: ${game.score}";
        color = Colors.red;

        Future.delayed(const Duration(seconds: 7), () => Navigator.pop(context));

      }
      else if(game.gameStatus() == 1){
        game.mistakes = -100;
        message = "You won! - Score: ${game.score}";
        color = Colors.green;

        Future.delayed(const Duration(seconds: 2), () => Navigator.pop(context));

      }


    });
  }
  GameInstance game;
  String message ;
  String imgUrl;
  Color color;
  int mode = 0;
  var rng = new Random();
  _GameState() {

    int num = rng.nextInt(wordDatabase.length-1);

    this.game = GameInstance(wordDatabase[num] + " ");
    this.imgUrl = "assets/h0.gif";
    this.message = "Guess the word!";
    this.color = Colors.black;
    this.mode = 0;

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(message),
          backgroundColor: color,

        ),
        body: Container(
          color: Colors.grey[800],
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                  child:
                    Text(
                      game.wordShow(mode) ,
                      style: TextStyle(
                        letterSpacing: 5.0,
                        fontSize: 42.0,
                        color: Colors.white70 ,
                      ),

                    )
              ),
              Expanded(
                flex: 6,
                child: FittedBox(
                  child: Image(
                    image: AssetImage(imgUrl),
                  ),
                ),


              ),
              Expanded(
                child: Row(
                  children: game.incorrectLetters.map( (x) {return
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(

                            child: Center(
                              child: Text(
                                  "$x",
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            color: Colors.red[600],
                            height: 40,
                          ),
                        )
                    )
                  ;}
                  ).toList(),
                ),

              ),
              Expanded(
                  flex: 2,
                  child: Keyboard(game, state2)
              )


            ],
          ),
        )
    );
  }
}



class Keyboard extends StatefulWidget {

  GameInstance game;
  Function state;
  Keyboard(game, state){
    this.game = game;
    this.state = state;
  }
  @override
  _KeyboardState createState() => _KeyboardState(game, state);
}

class _KeyboardState extends State<Keyboard> {
  List<String> row1 = ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'];
  List<String> row2 = ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'];
  List<String> row3 = ['Z', 'X', 'C', 'V', 'B', 'N', 'M', '?'];
  List<String> row4 = [',', '.', "'", ':', '+', '\$', '#', '!'];
  GameInstance game;
  Function state;
  _KeyboardState(game, state){
    this.game = game;
    this.state = state;
  }

  @override

  void initState() {

    print("Keyboard Initialised") ;
    super.initState();

    for(int i = 0; i < game.correctLetters.length; i++){
      String letter = game.correctLetters[i];
      row1.remove(letter);
      row2.remove(letter);
      row3.remove(letter);
      row4.remove(letter);
    }

  }


  void keyProcessing(String x, List<String> keyboardRow){
    print("$x");
    print(game.word);
    print(game.correctLetters);
    setState(() {
      keyboardRow.remove(x);
      if(game.word.contains(x)){
        game.correctLetters.add(x);
        if(game.combo <= 0)
          game.combo = 1;
        else
          game.combo++;

        game.score = game.score + game.combo*game.totalUnique/game.mistakes*1000 ;
        }
      else {
        game.incorrectLetters.add(x);
        game.mistakes++;
        game.combo--;
      }
      state();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(

        children: <Widget>[
          Expanded(
            child:
            Row(
              children: row1.map( (x) {return
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: RaisedButton(
                        onPressed: (){
                          keyProcessing(x, row1);
                        },
                        child: Text("$x"),
                        color: Colors.grey[600],
                        textColor: Colors.white70,
                      ),
                    )
                )
              ;}
              ).toList(),
            ),
          ),
          SizedBox(height: 5.0),
          Expanded(
            child: Row(
              children: row2.map( (x) {return
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: RaisedButton(
                        onPressed: ()
                        {
                          keyProcessing(x, row2);
                        },
                        child: Text("$x"),
                        color: Colors.grey[700],
                        textColor: Colors.white,
                      ),
                    )
                )
              ;}
              ).toList(),
            ),
          ),
          SizedBox(height: 5.0),

          Expanded(
            child: Row(
              children: row3.map( (x) {return
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: RaisedButton(
                        onPressed: (){
                          keyProcessing(x, row3);
                        },
                        child: Text("$x"),
                        color: Colors.grey[600],
                        textColor: Colors.white70,
                      ),
                    )
                )
              ;}
              ).toList(),
            ),
          ),
          SizedBox(height: 5.0),
          Row(
            children: row4.map( (x) {return
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: RaisedButton(
                      onPressed: (){
                        keyProcessing(x, row4);
                      },
                      child: Text("$x"),
                      color: Colors.grey[700],
                      textColor: Colors.white,

                    ),
                  )
              )
            ;}
            ).toList(),
          ),
        ],
      ),

    );
  }
}


