import 'package:flutter/material.dart';
import 'package:task/util/emoj.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "hi, Melak!",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "23 jan 2023",
                        style: TextStyle(
                          color: Colors.blue[100],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[500],
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(9),
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.blue[500]),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.blue[200],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Search here ...",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 41,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "How do i feel today?",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Emoj(
                        Emojs: '😕',
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "sad",
                        style: TextStyle(
                            color: Color.fromARGB(255, 145, 165, 200)),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Column(
                    children: [
                      Emoj(
                        Emojs: '🧡',
                      ),
                      Text(
                        "love",
                        style: TextStyle(
                            color: Color.fromARGB(255, 145, 165, 200)),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Column(
                    children: [
                      Emoj(
                        Emojs: '😁',
                      ),
                      Text(
                        "happy",
                        style: TextStyle(
                            color: Color.fromARGB(255, 145, 165, 200)),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Column(
                    children: [
                      Emoj(
                        Emojs: '😕',
                      ),
                      Text(
                        "sad",
                        style: TextStyle(
                            color: Color.fromARGB(255, 145, 165, 200)),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 11,
                  ),
                  Column(
                    children: [
                      Emoj(
                        Emojs: '👋',
                      ),
                      Text(
                        "peace",
                        style: TextStyle(
                            color: Color.fromARGB(255, 145, 165, 200)),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
