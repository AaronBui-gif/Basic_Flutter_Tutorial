// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

// Function return string having 2 String parameters as inputs
String getFullName(String firstName, String lastName) {
  return "$firstName $lastName";
}

// function return null print out person's informations
void test() {
  int? age = 20; // How to assign a null value to a variable
  age = null;

  // Create a Map contains name and age
  var person = {
    'name': 'Foo',
    'age': 27,
  };

  const String? person2 = null; // How to assign a null value to a variable
  print(person);
  person['name'] = 'F000'; // Change key's value in map
  print(person);
  print(person['name']);
}

// Create a class Person
class Person extends Object {
  final String name;
  final int age;
  Person(this.name, this.age);

// Factory Constructor allows create multiple
  factory Person.Peter() {
    return Person("Peter", 28);
  }
  String getName() {
    return name;
  }

  int getAge() {
    return age;
  }

  String getInfo() {
    return "Name: $name, Age: $age";
  }

// Note: Every class inherits from its original class Object
  @override
  bool operator ==(covariant Person other) => other.name == name;
  @override
  int get hashCode => name.hashCode;
}

// Inheritance
class Student extends Person {
  Student(super.name, super.age);
}

// extension info
extension fullInfo on Person {
  String get fullInformation => "$name $age";
}

// extension run
extension Run on Person {
  void run() {
    print("$name is running");
  }
}

// Class Pair
class PairOfStrings {
  final String value1;
  final String value2;
  PairOfStrings(this.value1, this.value2);
}

// Class Pair
class PairOfIntegers {
  final int value1;
  final int value2;
  PairOfIntegers(this.value1, this.value2);
}

class Pair<A, B> {
  final A value1;
  final B value2;

  Pair(this.value1, this.value2);
}

// Enum animal type
enum AnimalType { cat, dog, monkey }

// Switch Case Enum
void printAnimalType(AnimalType animalType) {
  switch (animalType) {
    case AnimalType.cat:
      print(AnimalType.cat);
      return;
    case AnimalType.dog:
      print(AnimalType.dog);
      break;
    case AnimalType.monkey:
      print(AnimalType.monkey);
      break;
    default:
      print(AnimalType.cat);
      break;
  }
}

// Testing Function
void testing() {
  // Create Object
  final foo = Person("Mike", 28);
  final foo2 = Person("Mike", 28);
  final student1 = Student("Michael", 21);
// If Statement comparision between two classes
  if (foo == foo2) {
    print("They are equals");
  } else {
    print("They are not equals");
  }

  // Get info
  print(foo.getInfo());
  print(student1.getInfo());

  // Factory Constructor print out
  final peter = Person.Peter();
  print(peter.age);
  print(peter.name);
  print(peter.fullInformation);
  // extension function
  peter.run();

  // Async
  print("${heavyFutureThatMultipliesByTwo(3)}");
  test2();

  // Iterable print
  for (final value in getOneTwoThree()) {
    print(value);

    // If break
    if (value == 2) {
      break;
    }
  }

  final names = Pair('foo', 20);
}

// Future
Future<int> heavyFutureThatMultipliesByTwo(int a) {
  return Future.delayed(const Duration(seconds: 3), () {
    return a * 2;
  });
}

// Stream
Stream<String> getName() {
  // Every 1 second return word 'Foo'
  return Stream.periodic(const Duration(seconds: 1), (value) {
    return 'Foo';
  });
}

// Asyncronous
void test2() async {
  // Wait for 10 second and then get the value * 2
  final result = await heavyFutureThatMultipliesByTwo(10);
  print(result);

  // Stream
  await for (final value in getName()) {
    print(value);
  }
  print("Stream finished working");
}

// Iterable
// Does exactly same thing as sync* but return a stream
//Stream<Iterable<int>> getOneTwoThree() async*{
Iterable<int> getOneTwoThree() sync* {
  //Generator function return a list of things but calculate list of things asyncronously
  // Calculate things before return
  yield 1;
  yield 2;
  yield 3;
  // yield [1, 2, 3];
}

// Main
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print(getFullName("Alex", "Tran"));
    test();
    testing();
    printAnimalType(AnimalType.cat);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Example(),
    );
  }
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome to Flutter'), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add_alert),
          tooltip: 'Show Snackbar',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')));
          },
        ),
        IconButton(
          icon: const Icon(Icons.navigate_next),
          tooltip: 'Go to the next page',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Next page'),
                  ),
                  body: const Center(
                    child: Text(
                      'This is the next page',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                );
              },
            ));
          },
        ),
      ]),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}
