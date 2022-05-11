import 'dart:async';

class DelayTimer {
  late Function callbackFunc;
  int delaySec = 3;

  bool running = false;
  late Timer timer;

  DelayTimer(this.callbackFunc, this.delaySec);

  void callbackDelay() {
    if (running) {
      timer.cancel();
    }
    startTimer();
  }

  void startTimer() {
    running = true;
    timer = Timer(Duration(seconds: delaySec), () {
      running = false;
      callbackFunc();
    });
  }
}
