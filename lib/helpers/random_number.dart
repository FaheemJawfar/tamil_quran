import 'dart:math';

class RandomNumber {
  int getRandomNumber(int maxNumber) {
    var rnd = Random();
    int randomNumber = rnd.nextInt(maxNumber);
    //  print(randomNumber);
    return randomNumber;
  }
}
