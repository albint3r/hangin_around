import 'dart:math';


Random random = Random(); // Create random objet to use in the class

class GameModel {

  List secretWords = [];
  Map WordsAndIndex = {};
  Map currentWordsAndIndex = {};
  String guessWord = '';
  String guessWordInGame = '';
  String currentSelectedLetter = '';
  bool isGameOver = false;
  bool playerWin = false;


  GameModel (this.secretWords);

  void addLettersToWordInGame(Map lettersLocation) {

  }

  bool checkGameOver() {
    /*Return True if the game is Over*/
    return guessWord == guessWordInGame;
  }

  void createGame() {
    /*Create a new match*/
    // Start settings / init
    selectSecretWord();
    setStartLetters();
    createGuessWordInGame();
  }

  void createGuessWordInGame() {
    /*Create the guess word adding '_' if is not letter in that space, an
    a letter in there is any in the 'WordsAndIndex' */
    int guessWordLength = guessWord.length;
    for(int i = 0; i < guessWordLength; i++ ) {
      // Add word by word to create the guessWord.
      //If not have a value it would put a _ otherwise a letter of the dict
      if(WordsAndIndex.containsKey(i)) {
        guessWordInGame += WordsAndIndex[i];
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
    int randomIndex = random.nextInt(secretWords.length);
    guessWord = secretWords[randomIndex].toLowerCase();
  }

  void setStartLetters() {
    /* Fill the attribute 'WordsAndIndex' with the index an the word
    in that space. This will help to create the 'guessWordInGame' */
    int totalWordsToSelect = getTotalWordsToSelect();
    for(int i = 0; i < totalWordsToSelect; i++) {
      while (WordsAndIndex.length != totalWordsToSelect) {
        var randomIndex = random.nextInt(guessWord.length - 1);
        // If the
        if (!WordsAndIndex.containsKey(randomIndex)) {
          WordsAndIndex[randomIndex] = guessWord[randomIndex];
        }
      }
    }
  }

  Map getLettersLocation(String letter) {
    /* Get the location of the Guess letter in a Dictionary / Maps */
    Map letterLocation = {letter: []};
    if(isLetterInGuessWord(letter)) {
      for (int i = 0; i < guessWord.length; i++) {
        if (guessWord[i] == letter) {
          letterLocation[letter].add(i);
        }
      }
    }
    return letterLocation;
  }

  bool isLetterInGuessWord(String letter) {
    /* Check if contains the letter and is only one letter  */
    if(letter.length < 2) {
      return guessWord.contains(letter);
    } return false;
  }

}