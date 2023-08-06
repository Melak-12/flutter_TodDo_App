import 'package:flutter/material.dart';
import 'dart:async';

class GameHome extends StatefulWidget {
  const GameHome({super.key});

  @override
  State<GameHome> createState() => _GameHomeState();
}

class _GameHomeState extends State<GameHome> {
  List<String> displayXO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  List<int> matchedIndex = [];

  bool oTurn = true;
  String resultDeclaration = '';
  int oScore = 0;
  int xscore = 0;
  int filledBoxes = 0;
  bool winnerFound = false;
  int attempt = 0;
  static const maxSeconds = 20;
  int seconds = maxSeconds;
  Timer? timer;
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          stopTimer();
        }
      });
    });
  }

  void stopTimer() {
    resetTimer();
    timer?.cancel();
  }

  void resetTimer() {
    seconds = maxSeconds;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 64, 71, 73),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => {showAlert()},
                child: Icon(
                  Icons.info,
                  color: Colors.green[500],
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(left: 43)),
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "Player A",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 255, 238),
                          ),
                        ),
                        Text(
                          oScore.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "Player B",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 255, 238),
                          ),
                        ),
                        Text(
                          xscore.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                        padding: const EdgeInsets.all(11),
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 3,
                            color: const Color.fromARGB(255, 64, 71, 73),
                          ),
                          color: matchedIndex.contains(index)
                              ? Colors.green
                              : const Color.fromARGB(255, 102, 112, 120),
                        ),
                        child: Center(
                          child: Text(
                            displayXO[index],
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 42),
                          ),
                        )),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      resultDeclaration,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 7, 208, 0), fontSize: 25),
                    ),
                    const SizedBox(height: 10),
                    buildTimer()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 60, 168, 141),
            title: const Text("Developed by "),
            content: const Text(
                'Melaku Abebe \nTelegram @Melak_12\nemail:Melakabebeee@gmail.com\n\nEnjoy the game!'),
            contentTextStyle:
                const TextStyle(color: Color.fromARGB(255, 41, 43, 47)),
            actions: [
              TextButton(
                onPressed: () => {Navigator.of(context).pop()},
                child: const Text(
                  'ok',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        });
  }

  void _tapped(int index) {
    final isRunning = timer == null ? false : timer!.isActive;
    if (isRunning) {
      setState(() {
        if (oTurn && displayXO[index] == '') {
          displayXO[index] = 'A';
          filledBoxes++;
        } else {
          displayXO[index] = 'B';
          filledBoxes++;
        }
        oTurn = !oTurn;
        checkWinner();
      });
    }
  }

  Widget buildTimer() {
    final isRunning = timer == null ? false : timer!.isActive;
    return isRunning
        ? SizedBox(
            height: 50,
            width: 50,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: 1 - seconds / maxSeconds,
                  valueColor: const AlwaysStoppedAnimation(
                      Color.fromARGB(255, 255, 0, 0)),
                  strokeWidth: 8,
                  backgroundColor: const Color.fromARGB(255, 132, 136, 143),
                ),
                Center(
                  child: Text(
                    '$seconds',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 255, 17), fontSize: 20),
                  ),
                )
              ],
            ),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 3, 181, 86),
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
            ),
            onPressed: () {
              startTimer();
              _clearBoard();
              attempt++;
            },
            child: Text(
              attempt == 0 ? "Start" : "Play agin",
              style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
            ),
          );
  }

  void checkWinner() {
    // check the first row
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        matchedIndex.addAll([0, 1, 2]);
        stopTimer();
        updateScore(displayXO[0]);
      });
    }
    // check the second row
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        matchedIndex.addAll([3, 4, 5]);
        stopTimer();
        resultDeclaration = 'Player  ' + "  " + displayXO[3] + "  " + "Wins";
        updateScore(displayXO[3]);
      });
    }
    // check the third row
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        matchedIndex.addAll([6, 7, 8]);
        stopTimer();
        resultDeclaration = 'Player  ' + "  " + displayXO[6] + "  " + "Wins";
        updateScore(displayXO[6]);
      });
    }
    // check the first col
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        matchedIndex.addAll([0, 3, 6]);
        stopTimer();
        resultDeclaration = 'Player  ' + "  " + displayXO[0] + "  " + "Wins";
        updateScore(displayXO[0]);
      });
    }
    // check the second col
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        matchedIndex.addAll([1, 4, 7]);
        stopTimer();
        resultDeclaration = 'Player  ' + "  " + displayXO[1] + "  " + "Wins";
        updateScore(displayXO[1]);
      });
    }
    // check the third col
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        matchedIndex.addAll([2, 5, 8]);
        stopTimer();
        resultDeclaration = 'Player  ' + "  " + displayXO[2] + "  " + "Wins";
        updateScore(displayXO[2]);
      });
    }
    // check the first diagonal
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        matchedIndex.addAll([0, 4, 8]);
        stopTimer();
        resultDeclaration = 'Player  ' + "  " + displayXO[0] + "  " + "Wins";
        updateScore(displayXO[0]);
      });
    }
    // check the first row
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      setState(() {
        matchedIndex.addAll([2, 4, 6]);
        stopTimer();
        resultDeclaration = 'Player  ' + "  " + displayXO[2] + "  " + "Wins";
        updateScore(displayXO[2]);
      });
    }

    if (!winnerFound && filledBoxes == 9) {
      setState(() {
        resultDeclaration = "No one Wins!";
        stopTimer();
      });
    }
  }

  void updateScore(String winner) {
    if (winner == "A") {
      oScore++;
    } else if (winner == "B") {
      xscore++;
    }

    winnerFound = true;
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
      resultDeclaration = '';
      matchedIndex = [];
    });
    filledBoxes = 0;
  }
}
