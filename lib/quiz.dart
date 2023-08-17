import 'package:flutter/material.dart';

import 'model.dart';


class homedesign extends StatefulWidget {
  const homedesign({Key? key}) : super(key: key);

  @override
  State<homedesign> createState() => _homedesignState();
}

class _homedesignState extends State<homedesign> {
  List<Model> question = [
    Model(questions: 'About 36 and 42 islands make up New York City', answer: true),
    Model(questions: 'Only one capital exists in South Africa', answer: true),
    Model(questions: 'The largest ocean in the world is the Atlantic Ocean', answer: false),
    Model(questions: 'The tallest mountain in the world is Mount Everest.', answer: false),
    Model(questions: 'California is home to the “Desert of Death', answer: true),
    Model(questions: '13,171 miles is how far the Great Wall of China stretches in total', answer: true),
    Model(questions: 'The Mississippi and the Nile are the two longest rivers in the world.', answer: false),
    Model(questions: 'The 31.5-mile-long Chunnel connects England and France', answer: false),

    Model(questions: 'There is no railway system in Iceland.', answer: true),
    Model(questions: 'The alphabets A, I, E, O, U are called consonants.', answer: false),
  ];

  List<IconData> icon = [];
  int qnNum = 0;
  int count = 0;
  int count2=0;

  String getQuestions() {
    return question[qnNum].questions;
  }

  bool getAnswers() {
    return question[qnNum].answer;
  }

  void getNextQn() {
    if (qnNum < question!.length) {
      qnNum++;
    }
  }

  void clearQn() {
    count = 0;
    count2=0;
    qnNum = 0;
    icon = [];
  }

  bool finishQn(){
    if(qnNum>=question!.length-1){
      return true;
    }
    else
      return false;
  }

  void ansQn(bool answer) {
    bool getAnswer = getAnswers();
    if (finishQn()==true) {
      if (count2 >= 4) {
        openAlertFail();
        clearQn();
        icon = [];
      } else if(count>=4){
        openAlertWin();
        clearQn();
        icon = [];
      }
    } else {
      if (getAnswer == answer) {
        icon.add(Icons.check);
        count++;
      } else {
        icon.add(Icons.close);
        count2++;
      }
      getNextQn();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 240),
              child: Text(
                getQuestions(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.w600),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  ansQn(true);
                });

              },
              child: Text(
                'True',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[800],
                fixedSize: Size(350, 55),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  ansQn(false);
                });

              },
              child: Text(
                'False',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[800],
                fixedSize: Size(350, 55),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                children: [
                  for (var iconData in icon)
                    Icon(iconData, color: Colors.green[800], size: 30),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Future openAlertWin() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("YOU ARE WIN!!"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('OK', style: TextStyle(fontSize: 25)),
        ),
      ],
    ),
  );

  Future openAlertFail() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title:Text("GAME OVER!!"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('OK', style: TextStyle(fontSize: 25)),
        ),
      ],
    ),
  );
}