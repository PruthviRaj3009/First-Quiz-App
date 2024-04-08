import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Map> allQuestions = [
    {
      "question": "Q1: What is the largest ocean in the world?",
      "options": [
        "  Atlantic Ocean",
        "  Indian Ocean",
        "  Arctic Ocean",
        "  Pacific Ocean"
      ],
      "answerIndex": 2,
    },
    {
      "question": "Who is the founder of Apple?",
      "options": ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      "answerIndex": 0,
    },
    {
      "question": "Who is the founder of Amazon?",
      "options": ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      "answerIndex": 1,
    },
    {
      "question": "Who is the founder of Tesla?",
      "options": ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      "answerIndex": 3,
    },
    {
      "question": "Who is the founder of Google?",
      "options": ["Steve Jobs", "Lary Page", "Bill Gates", "Elon Musk"],
      "answerIndex": 1,
    },
  ];
  bool Questionscreen = true;
  int selectanswerindex = -1;
  int questionIndex = 0;
  int correctanscounter = 0;

  MaterialStateProperty<Color?> checkAnswer(int buttonIndex) {
    if (selectanswerindex == -1) {
      return const MaterialStatePropertyAll(null);
    } else {
      if (buttonIndex == allQuestions[questionIndex]["answerIndex"]) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (buttonIndex == selectanswerindex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(null);
      }
    }
  }

  void validate() {
    if (selectanswerindex == -1) {
      return;
    }
    if (selectanswerindex == allQuestions[questionIndex]["answerIndex"]) {
      correctanscounter += 1;
    }
    if (selectanswerindex != -1) {
      selectanswerindex = -1;

      setState(() {
        questionIndex += 1;
      });
      if (questionIndex == allQuestions.length - 1) {
        setState(() {
          Questionscreen = false;
        });
      }
    }
  }

  Scaffold isQuestionScreen() {
    if (Questionscreen == true) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            validate();
          },
          child: const Icon(
            Icons.forward,
            color: Colors.black,
            size: 40,
          ),
        ),
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 19, 189, 231),
          child: ListView(
            children: [
              const SizedBox(),
              ListTile(
                title: const Text(
                  'Rules',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  // Handle item 1 tap
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text(
            "QuizApp",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          titleTextStyle:
              const TextStyle(color: Color.fromARGB(255, 238, 156, 25)),
          backgroundColor: Colors.black,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.gif_rounded))
          ],
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                "https://images.pexels.com/photos/1646753/pexels-photo-1646753.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", // Replace with your image asset path
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Question:",
                        style: TextStyle(
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 14, 4, 4),
                        )),
                    Text(
                      "${questionIndex + 1}/${allQuestions.length}",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.red),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 80,
                  width: 380,
                  child: Text(
                    allQuestions[questionIndex]["question"],
                    style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        )),
                    height: 50,
                    width: 350,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: checkAnswer(0),
                      ),
                      onPressed: () {
                        if (selectanswerindex == -1) {
                          setState(() {
                            selectanswerindex = 0;
                          });
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            "A.${allQuestions[questionIndex]["options"][0]}",
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 35,
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        )),
                    height: 50,
                    width: 350,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: checkAnswer(1),
                      ),
                      onPressed: () {
                        if (selectanswerindex == -1) {
                          setState(() {
                            selectanswerindex = 1;
                          });
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            "B.${allQuestions[questionIndex]["options"][1]}",
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 35,
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        )),
                    height: 50,
                    width: 350,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: checkAnswer(2),
                      ),
                      onPressed: () {
                        if (selectanswerindex == -1) {
                          setState(() {
                            selectanswerindex = 2;
                          });
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            "C.${allQuestions[questionIndex]["options"][2]}",
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 35,
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        )),
                    height: 50,
                    width: 350,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: checkAnswer(3),
                      ),
                      onPressed: () {
                        if (selectanswerindex == -1) {
                          setState(() {
                            selectanswerindex = 3;
                          });
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            "D.${allQuestions[questionIndex]["options"][3]}",
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "QuizApp",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          titleTextStyle:
              const TextStyle(color: Color.fromARGB(255, 238, 156, 25)),
          backgroundColor: Colors.black,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.gif_rounded))
          ],
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.network(
              "https://images-cdn.ubuy.co.in/65a384ecfb46382a957afac5-trophy-award-cup-trophies-gold-plastic.jpg",
              height: 400,
              width: 410,
            ),
            const Text(
              "Congratulations!!!",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "You have completed the Quiz",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Colors.orange),
            ),
            const SizedBox(height: 22),
            Text(
              "$correctanscounter/${allQuestions.length}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Container(
              color: const Color.fromARGB(255, 192, 27, 15),
              height: 40,
              width: 100,
              child: ElevatedButton(
                  onPressed: () {
                    Questionscreen = true;
                    selectanswerindex = -1;
                    questionIndex = 0;
                    correctanscounter = 0;
                    setState(() {});
                  },
                  child: const Text(
                    "Reset",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 234, 135, 13),
                    ),
                  )),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
