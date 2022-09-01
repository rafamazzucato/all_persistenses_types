class Person {
  int? id;
  final String firstName;
  final String lastName;
  final String address;
  
  // construtor posicional 
  Person(this.id, this.firstName, this.lastName, this.address);
  // construtor nominal 
  //Person({this.id, required this.firstName, required this.lastName, required this.address});

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'firstName' : firstName,
      'lastName' : lastName,
      'address' : address,
    };
  }
}