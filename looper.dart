// main() {
//   for (int i = 0; i < 10; i = i + 2) {
//     print('hello world $i');
//   }
// }
// List<String> fruits = ['apple', 'pear', 'orange', 'grape', 'banana', 'mango'];
// main() {
//   //bottlesOfBear();
//   for (String fruit in fruits) {
//     print("$fruit pie");
//   }
// }
//
// void buyMilk(int x) {
//   for (int i = 1; i <= 7; i++) {
//     print("Buying milk for day $i");
//   }
// }
//
// void bottlesOfBear() {
//   for (int i = 99; i >= 0; i--) {
//     if (i == 1) {
//       String s =
//           '$i bottle of bear on the wall, $i bottle of bear.\nTake one down and pass it around, no more bottles of bear on the wall\n';
//       print(s);
//     } else if (i > 1) {
//       String s =
//           '$i bottles of bear on the wall, $i bottles of bear.\nTake one down and pass it around, ${i - 1} bottles of bear on the wall\n';
//       print(s);
//     } else {
//       String s =
//           'No more bottles of bear on the wall, no more bottles of bear.\nTGo to the store and buy some more, 99 bottles of bear on the wall\n';
//       print(s);
//     }
//   }
// }

List<int> winningNumbers = [12, 6, 34, 41, 9];
void main() {
  List<int> ticket1 = [45, 2, 9, 18, 12, 33];
  List<int> ticket2 = [41, 17, 26, 32, 7, 35];
  checkNumbers(ticket2);
}

void checkNumbers(List<int> myNumbers) {
  int c = 0;
  for (int winningNumber in winningNumbers) {
    for (int myNumber in myNumbers) {
      if (winningNumber == myNumber) {
        c = c + 1;
      }
    }
  }
  print("You have $c matching numbers.");
}
// void checkNumbers(List<int> myNumbers) {
//   int c = 0;
//   for (int winningNumber in winningNumbers) {
//
//       if (winningNumber in myNumbers) {
//         c = c + 1;
//       }
//
//   }
//   print("You have $c matching numbers.");
// }
