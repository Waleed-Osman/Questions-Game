import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'app_brain.dart';

AppBrain appBrain = AppBrain();

void main() {
  runApp(const Question());
}

class Question extends StatelessWidget {
  const Question({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('Question Game'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: QuestionPage(),
        ),
      ),
    );
  }
}

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Widget> answerResult = [];

  void checkAnswer(bool answerPicked) {
    bool correctAnswer = appBrain.getQuesAnswer();
    setState(() {
      if (answerPicked == correctAnswer) {
        answerResult.add(
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.thumb_up,
              color: Colors.green,
            ),
          ),
        );
      } else {
        answerResult.add(
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.thumb_down,
              color: Colors.red,
            ),
          ),
        );
      }
      if (appBrain.isFinished() == true) {
        Alert(
          context: context,
          title: "انتهاء الاختبار ",
          desc: "!!لقد انتهيت من الاجابة على جميع الاسئلة",
          buttons: [
            DialogButton(
              child: Text(
                "ابدأ من جديد",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();

        appBrain.reset();

        answerResult = [];
      } else {
        appBrain.nextQues();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: answerResult,
          ),
          Expanded(
            flex: 7,
            child: Column(
              children: [
                Column(children: [
                  Image.asset(appBrain.getQuesImage()),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    appBrain.getQuesText(),
                    style: const TextStyle(fontSize: 24.0),
                    textAlign: TextAlign.center,
                  ),
                ]),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                onPressed: () {
                  checkAnswer(true);
                },
                child: const Text(
                  'صح',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                onPressed: () {
                  checkAnswer(false);
                },
                child: const Text(
                  'خطأ',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
