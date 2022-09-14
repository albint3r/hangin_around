// Import
import 'dart:convert' as convert;
import 'dart:io' as io;
import 'dart:math';

Random random = Random(); // Create random objet to use in the class

class WordsCreator{

  int wordIndex = -1; // This initialize as -1 because latter it will have an assign value
  String word = '';
  String definition = '';
  String jsonPath;
  Map<String, dynamic> jsonFile = {};



  WordsCreator(this.jsonPath) {
    getJsonFile(jsonPath);
    setWordIndex();
    setSelectWord();
    setSelectDefinition();
  }


  void getJsonFile(String filePath) {
    /* Get the jsonFile as Map from the path root.*/
    String jsonString = io.File(filePath).readAsStringSync();
    jsonFile = convert.jsonDecode(jsonString);
  }

  @override
  String toString() {
    return 'WordsCreator(index= $wordIndex, word= $word, definition=${definition} , )';
  }

  List<String> getAllWordsList() => jsonFile.keys.toList();

  void setWordIndex() {
    /* Create a random number. The max of the number it the length of the
    current list less 1. */
    wordIndex = random.nextInt(getAllWordsList().length - 1) ;
  }

  void setSelectWord() {
    word = getAllWordsList()[wordIndex];
  }

  void setSelectDefinition() {
    definition = jsonFile[word];
  }

}








