import 'dart:io';

void main(){
  stdout.writeln('Enter a number:');
  final input = stdin.readLineSync();
  int? num = int.tryParse(input!);
  if(num is int){
    int factorial = 1;
    for(int i = 1; i <= num; i++){
      factorial *= i;
    }
    stdout.writeln("Factorial of $num is $factorial");

  }
  
  else{
    stdout.writeln("please enter valid number");
  }

}