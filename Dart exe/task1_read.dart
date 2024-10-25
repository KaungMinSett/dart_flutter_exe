import 'dart:io';
void main(){
  stdout.writeln('Enter a value:');
  final input = stdin.readLineSync();
  
  stdout.writeln("you entered: $input");

}