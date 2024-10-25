import 'dart:io';

void main(){
  ContactController contactController = new ContactController();
  int? command;
  do{
     print('''
           1. Enter new Contact
           2. Show all contacts
           3. Delete a contact
           4. Exit
   ''');
  stdout.writeln("Press 1 to 4");
  final input = stdin.readLineSync();
  command = int.tryParse(input!);


  switch(command){
    case 1:
    contactController.addContact();
    case 2:
    contactController.showContacts();
    case 3:
    contactController.deleteContact();
    case 4:
    print("Closed");
    break;
    default:
    print("Invalid command");


  }
  }
  while(command != 4);

  


}
class ContactController{
  List<Contact> contacts = [];

  void addContact(){
    RegExp phoneNumberPattern = RegExp(r'^\d+$');
    print("Enter name");
    final name = stdin.readLineSync();
    print("Enter phone number");
    final phoneNumber = stdin.readLineSync();
    
    
    if(phoneNumberPattern.hasMatch(phoneNumber!)){

    Contact contact = new Contact(name: name!, phoneNumber: phoneNumber);
    contacts.add(contact);
    }
    else{
      print("Invalid phone number");
    }
    

}
  void showContacts(){
    if (contacts.isEmpty){
      print("No contacts");
    }
    else{
    for (var contact in contacts){
      print(contact.name);
      print(contact.phoneNumber);
    }
    }
  }

  void deleteContact(){

    bool found = false;
    print("Enter phone number");
    final phoneNumber = stdin.readLineSync();
  

    for (var contact in contacts){
      if (contact.phoneNumber == phoneNumber){
        found = true;
        break;
        }
    }
    
    if(found){
      contacts.removeWhere((contact) => contact.phoneNumber == phoneNumber);
      print("Contact deleted");

    }
    else{
      print("Contact not found");
    }
   
      

    

   
  
   
    
 }


  


}



class Contact{
  late String name;
  late String  phoneNumber;

  Contact({required this.name, required this.phoneNumber});

  
}