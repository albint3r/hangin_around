

void showStartInstruction() {
  print('Try to guess the Secret word');
  print('----------------------------\n');
}

void showCurrentStateWordInGame(String guessWordInGame) {
  print('Current word solved at the moment: $guessWordInGame');
}

void showWordDefinition(String definition) {
  print('This is the definition of the word:');
  print('------------------------------------');
  print(definition);
  print('------------------------------------\n');

}

void showDefinitionLink(String guessWord) {
  print('https://www.oxfordlearnersdictionaries.com/us/definition/english/${guessWord.toLowerCase()}_1?q=${guessWord.toLowerCase()}');
  print('https://www.urbandictionary.com/define.php?term=${guessWord.toLowerCase()}');
  print('https://www.google.com/search?q=${guessWord.toLowerCase()}+meaning');
}

void showYouWinTheGame(String guessWordInGame, int remainingTurns) {
  print('-----------------------------------------');
  print('Wooww! That was amazing, you win the game');
  print('The secret Word Was: ${guessWordInGame.toUpperCase()}');
  print('Left turns: $remainingTurns');
  print('-----------------------------------------');
}

void showYouLoseTheGame(String guessWord, String guessWordInGame) {
  print('-----------------------------------------');
  print("That's a shame! This is your result '$guessWordInGame' and the secret word was '${guessWord.toUpperCase()}'");
  print('-----------------------------------------');
}

void showRemainingTurns(int remainingTurns) {
  print("You have $remainingTurns remaining turns");
}

