import 'package:questions/question.dart';

class AppBrain {
  int _quesNumber = 0;
  List<QuestionClass> _questionGroup = [
    QuestionClass(
        q: 'عدد كواكب المجموعة الشمسية هو ثمانية كواكب',
        i: 'images/image-1.jpg',
        a: true),
    QuestionClass(
      q: 'القطط من الحيوانات اللاحمة',
      i: 'images/image-2.jpg',
      a: true,
    ),
    QuestionClass(
      q: 'الصين موجودة في قارة افريقيا',
      i: 'images/image-3.jpg',
      a: false,
    ),
    QuestionClass(
      q: 'الأرض مسطحة وليست كروية',
      i: 'images/image-4.jpg',
      a: false,
    ),
  ];

  void nextQues() {
    if (_quesNumber < _questionGroup.length - 1) {
      _quesNumber++;
    } else {}
  }

  String getQuesText() {
    return _questionGroup[_quesNumber].quesText;
  }

  String getQuesImage() {
    return _questionGroup[_quesNumber].quesImage;
  }

  bool getQuesAnswer() {
    return _questionGroup[_quesNumber].quesAnswer;
  }

  bool isFinished() {
    if (_quesNumber >= _questionGroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _quesNumber = 0;
  }
}
