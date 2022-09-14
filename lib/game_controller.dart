import 'dart:io';
import 'package:dart_tuto/game_view.dart';

import 'package:dart_tuto/game_model.dart';
import 'package:dart_tuto/words_creator.dart';


WordsCreator wordCreator = WordsCreator(r'statics\english_dictionary.js');
GameModel model = GameModel(wordCreator);

String playerSelectLetter() {
  print('Please Select a Single Letter: ');
  return stdin.readLineSync()!;
}


void play() {

  bool matchOn = true;
  showStartInstruction();
  showWordDefinition(model.wordCreator.definition);
  showCurrentStateWordInGame(model.guessWordInGame);

  while(matchOn) {
    // Player select guess letter
    // Check if the letter exist and the index location
    model.updateWordsAndIndex(model.getLettersLocation(playerSelectLetter()));
    model.updateGuessWordInGame();
    // Check if the player guess the word, if is true the game is over
    // and the player win.
    if(model.hasGuessTheWord()){
      showYouWinTheGame(model.guessWordInGame, model.remainingTurns);
      matchOn = false;
    }
    if(model.hasLose()) {
      showYouLoseTheGame(model.guessWord, model.guessWordInGame);
      matchOn = false;
    }
    showCurrentStateWordInGame(model.guessWordInGame);
    model.updateRemainingTurns();
    showRemainingTurns(model.remainingTurns);
  }

}

void other() {
  print(model);
  print(model.wordCreator.getAllWordsList());
}