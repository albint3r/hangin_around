import 'dart:math';
import 'package:dart_tuto/words_creator.dart';



Random random = Random(); // Create random objet to use in the class

class GameModel {

  List secretWords = [];
  Map wordsAndIndex = {};
  String guessWord = '';
  String guessWordInGame = '';
  String currentSelectedLetter = '';
  bool isGameOver = false;
  bool isAnswerOk = false;
  bool playerWin = false;
  int remainingTurns = 0;
  WordsCreator wordCreator;



  GameModel (this.wordCreator) {
    createGame();
  }

  @override
  String toString() {
    return 'GameModel(guessWord= $guessWord, guessWordInGame= $guessWordInGame), remainingTurns= $remainingTurns)';
  }

  bool hasGuessTheWord() {
    /*Return True if the game is Over*/
    return guessWord == guessWordInGame;
  }

  bool hasLose() {
    /*Return True if the game is Over*/
    return remainingTurns == 0;
  }

  void createGame() {
    /*Create a new match*/
    // Start settings / init
    setSecretWords();
    selectSecretWord();
    setRemainingTurns();
    setStartLetters();
    createGuessWordInGame();
  }

  void createGuessWordInGame() {
    /*Create the guess word adding '_' if is not letter in that space, an
    a letter in there is any in the 'wordsAndIndex' */
    int guessWordLength = guessWord.length;
    for(int i = 0; i < guessWordLength; i++ ) {
      // Add word by word to create the guessWord.
      //If not have a value it would put a _ otherwise a letter of the dict
      if(wordsAndIndex.containsKey(i)) {
        guessWordInGame += wordsAndIndex[i];
      } else {
        guessWordInGame += '_';
      }
    }
  }

  int getTotalWordsToSelect() {
    /* Return an integer that represents the 30% of total words to select
    in the guessWordInGame*/
    return (guessWord.length * .30).round();
  }

  void selectSecretWord() {
    /* Create a Random Integer/Index to select a random word inside a list.
  This will be considered the random word.  */
    guessWord = wordCreator.word;
  }

  void setStartLetters() {
    /* Fill the attribute 'wordsAndIndex' with the index an the word
    in that space. This will help to create the 'guessWordInGame' */
    int totalWordsToSelect = getTotalWordsToSelect();
    for(int i = 0; i < totalWordsToSelect; i++) {
      while (wordsAndIndex.length != totalWordsToSelect) {
        var randomIndex = random.nextInt(guessWord.length - 1);
        // If NOT exist the key value in the index and words add it!
        if (!wordsAndIndex.containsKey(randomIndex)) {
          wordsAndIndex[randomIndex] = guessWord[randomIndex];
        }
      }
    }
  }

  void setSecretWords() {
    /*Set the secret Words List. From this will be chosen the guessWord. */
    secretWords = wordCreator.getAllWordsList();
  }

  void setRemainingTurns() {
    /* Set the total turn to guess the word. This is the double of the length
    of the guessWord */
    remainingTurns = ((guessWord.length * 2) * .70).round();
  }

  Map getLettersLocation(String letter) {
    /* Get the location of the Guess letter in a Dictionary / Maps */
    Map letterLocation = {letter: []};
    print(isLetterInGuessWord(letter));
    if(isLetterInGuessWord(letter)) {
      for (int i = 0; i < guessWord.length; i++) {
        if (guessWord[i] == letter) {
          letterLocation[letter].add(i);
        }
      }
    }
    print('------------------------');
    print(isLetterInGuessWord(letter));
    print(letterLocation);
    return letterLocation;
  }

  bool isLetterInGuessWord(String letter) {
    /* Check if contains the letter and is only one letter  */
    if(letter.length < 2) { // check if is an individual letter
      return guessWord.contains(letter);
    } return false;
  }

  void updateWordsAndIndex(Map lettersLoc) {
    /* Update the values of the index and letter of the guess word */
    for(int i in lettersLoc.values.toList()[0]) {
      wordsAndIndex[i] = lettersLoc.keys.toList()[0];
    }
  }

  void updateGuessWordInGame() {
    guessWordInGame = ''; // Delete the last word to update with the new
    int guessWordLength = guessWord.length;
    for(int i = 0; i < guessWordLength; i++ ) {
      // Add word by word to create the guessWord.
      //If not have a value it would put a _ otherwise a letter of the dict
      if(wordsAndIndex.containsKey(i)) {
        guessWordInGame += wordsAndIndex[i];
      } else {
        guessWordInGame += '_';
      }
    }
  }

  void updateRemainingTurns() {
    remainingTurns -= 1;
  }


}