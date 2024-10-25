
import 'dart:math';
import 'dart:io';



void main(){

  Game game1 = Game();
  Player player = Player();
  
  stdout.writeln('Enter your name:');
  final name = stdin.readLineSync();
  player.setName = name!; // Setting the name of the player

  stdout.writeln('Enter your age:');
  final age = stdin.readLineSync();
  player.setAge = int.parse(age!); // Setting the age of the player

  List<String> characters = game1.generateRandomWord();
  stdout.writeln('Enter a letter to guess this word:');
  game1.displayWord(characters);

  while (player.lives > 0) {
    final character = stdin.readLineSync();
    game1.playGame(character!, characters, player);
    game1.displayWord(characters);
    if(game1.checkWin()) {
      print('You have won the game');
      break;
    }

  }
  print('The word was ${game1.chosenWord.join()}');
  if(player.lives == 0){
    print('Game Over');
  }
    



}

class Person {
  String? name;
  int? age;

  set setName(String name) {
    this.name = name;
  }

  set setAge(int age) {
    this.age = age;
  }
}

class Player extends Person {
  int lives = 10;
  List guessedLetters = [];


 
}

class Game{
  var words = ['cat', 'dog', 'snake', 'elephant', 'lion', 'tiger', 'cheetah', 'leopard', 'jaguar', 'panther']; // list of 10 words
  List<String> chosenWord = [];
  List<int> foundIndexes = []; // list to store the indexes of the found characters


  List<String> generateRandomWord(){
    var random = Random(); // Random object initlization
    String randomWord = words[random.nextInt(words.length)]; // Random word selection
    chosenWord = randomWord.split(''); // Splitting the word into characters
    return chosenWord;
  }

  void playGame(String letter, List<String> characters, Player player){
    bool found = false;
    for(int i = 0; i < characters.length; i++) {
      if(letter == characters[i]) {
        if(foundIndexes.contains(i)){
          print("You have already found this character");
          continue;


          
        }
        else {
          print("You have found a character");
          foundIndexes.add(i);
          found = true;
          break;
        }
      
      
      }
    }
    if(!found) {
      player.lives -= 1;
      print('You have ${player.lives} lives left');
    }


 
    
  }

  void displayWord(List<String> characters){
    for(int i = 0; i < characters.length; i++) {
      if(foundIndexes.contains(i)) {
        stdout.write(characters[i]);
      }
      else {
        stdout.write('*');
      }
    }
    print('');
  }

  bool checkWin(){
    if(foundIndexes.length == chosenWord.length) {

      return true;
    }
    return false;
  }

}

