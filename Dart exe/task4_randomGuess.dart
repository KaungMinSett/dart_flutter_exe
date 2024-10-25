import 'dart:io';

void main(){
  int random = 6;
  int count = 0;

  stdout.writeln('Guess a number between 1 and 10:');

  int? input = int.tryParse(stdin.readLineSync()!);
  print(input??"Enter valid number");
  while(input != random){
    if(input! > random){
      stdout.writeln("Too High");
    }
    else{
      stdout.writeln("Too Low");

    }
    stdout.writeln("Try Again");
    count++;
    print("You have guessed $count times");
    input = int.tryParse(stdin.readLineSync()!);
  }  
  
  stdout.writeln("You guessed it right");
  count++;
  print("You have guessed $count times");
   
    
}