String globalScope = "Global Scope";
double z = 0.0;

void main() {
  print("Hello world");
  // variables
  // strings
  var myString = "Hello World";
  print(myString.contains("Hello"));
  // numbers
  var myInt = 5;
  print(myInt.isEven);
  var myDouble = 4.2;
  print(myDouble);

  String mySecondString = "Hello World";
  print(mySecondString.length);
  int mySecondInt = 9;
  double mySecondDouble = 7.9;
  bool isSignedIn = false;
  dynamic myDynamicVariable = "Hello";
  myDynamicVariable = 4;
  print(myDynamicVariable);

  final String myFinalVariable = "Dart";
  print(myFinalVariable);

  // mathematical operators  (+, *, -, /, %<50 % 5 == 0 >)
  int result1 = 5 + 5;
  int result2 = 5 - 5;
  int result3 = 5 * 5;
  double result4 = 5 / 5;
  int result5 = 5 ~/ 5;
  print(result5);
  bool result6 = 50 % 5 == 0;
  print(result6);

  // Concatenating Strings Together
  // mark has 10 apples
  int numApples = 10;
  String name = "Mark";
  print(name + " has " + numApples.toString() + " apples");
  print("$name has ${numApples * 2} bananas");

  // Control flow constructs
  // comparison operators: <, >, ==, <=, >=, !=, ||, &&
  int myThirdInt = 11;

  // if statements
  // the condition before the curly braces should return a boolean
  if (myThirdInt < 10) {
    print("$myThirdInt is less than 10");
  } else if (myThirdInt < 15) {
    print("$myThirdInt is less than 15");
  } else if (myThirdInt < 20) {
    print("$myThirdInt is less than 20");
  } else if (myThirdInt < 5 || myThirdInt > 1) {
    print("$myThirdInt is less than 20");
  } else {
    print("$myThirdInt is not less than 10, 15 or 20");
  }

  // switch statement
  // can only check for simple equality but they cannot check for greater than
  switch (myThirdInt) {
    case 10:
      print("Our number is 10");
      break;
    case 15:
      print("Our number is 15");
      break;
    case 20:
      print("Our number is 20");
      break;
    default:
      print("Our number is not 10, 15 or 20");
  }

  // loops
  // for loop - used for a determinant number of runs
  for (int i = 0; i < 10; i++) {
    print(i);
  }

  //while loop - when not sure how many times the loop is going to run
  bool condition = true;
  // while (condition) {
  //   print("Condition is true");
  // }

  // do while loop - runs only once
  // do {
  //   print('Hello');
  // } while (condition);

  double result = addNumbers(
    x: 4.1,
    y: 3,
  );
  print("The height of Mark is $result");

  print(z);
  SignInUser("janedoe@gmail.com", "StrongPassword01");
}

addNumbers({
  required double x,
  required int y,
  String? greeting,
}) {
  z = x + y;
  print(z);
  return z;
}

SignInUser(String email, String password) {
  String savedEmail = "johndoe@gmail.com";
  String savedPassword = "StrongPassword01";
  String message = "Authenticating";

  if (email == savedEmail && password == savedPassword) {
    message = "Authenticated Successfully";
  } else if (email == savedEmail || password == savedPassword) {
    message = "Authentication failure. Please check your email and password";
  } else {
    message = "Login Failed!!!";
  }
  return message;
}
