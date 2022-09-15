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

String askTryAgain() {
  print('Do you want to play again?');
  return stdin.readLineSync()!;
}

void playAgain() {
  wordCreator = WordsCreator(r'statics\english_dictionary.js');
  model = GameModel(wordCreator);
  showStartInstruction();
  showWordDefinition(model.wordCreator.definition);
  showCurrentStateWordInGame(model.guessWordInGame);
  showRemainingTurns(model.remainingTurns);
}


void play() {

  bool matchOn = true;
  showStartInstruction();
  showWordDefinition(model.wordCreator.definition);
  showCurrentStateWordInGame(model.guessWordInGame);
  showRemainingTurns(model.remainingTurns);

  while(matchOn) {
    // Player select guess letter
    // Check if the letter exist and the index location
    model.updateWordsAndIndex(model.getLettersLocation(playerSelectLetter()));
    model.updateGuessWordInGame();
    model.updateRemainingTurns();
    // Check if the player guess the word, if is true the game is over
    // and the player win.
    if(model.hasGuessTheWord()){
      showYouWinTheGame(model.guessWordInGame, model.remainingTurns);
      matchOn = false;
      showDefinitionLink(model.guessWord);

    }
    if(model.hasLose()) {
      showYouLoseTheGame(model.guessWord, model.guessWordInGame);
      matchOn = false;
      showDefinitionLink(model.guessWord);

    }
    // If the game don't end print the current state of the game
    if(matchOn) {
      showCurrentStateWordInGame(model.guessWordInGame);
      showRemainingTurns(model.remainingTurns);
    }
    // player want to play again?
    if(!matchOn)  {
      String playerResponse = askTryAgain();
      if(playerResponse == 'y') {
        playAgain();
        matchOn = true;
      } else if(playerResponse == 'n') {
        break;
      }
    }
  }

}


