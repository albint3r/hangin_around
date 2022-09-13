import 'package:dart_tuto/dart_tuto.dart' as dart_tuto;
import 'dart:math';
import 'package:dart_tuto/game_model.dart';


List<String> secretWords = ['Murcielago', 'Nuclear', 'Regueton'];

void main() {


  GameModel gm = GameModel(secretWords);

  gm.createGame();
  print(gm.guessWord);
  print(gm.WordsAndIndex);
  print(gm.guessWordInGame);
  Map lettersLoc = gm.getLettersLocation('e');
  print(lettersLoc);



}
