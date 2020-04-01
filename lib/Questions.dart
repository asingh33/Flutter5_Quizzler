class QAdata {
  String question;
  bool   answer;

  QAdata(String s,bool a){
    question = s;
    answer = a;
  }
}

class QAbank {
  List<QAdata> _qList = [];
  int _index = 0;

  QAbank(){

    _qList.add(QAdata('My name is Abhi',true));
    _qList.add(QAdata('My name is SAbhi',false));
    _qList.add(QAdata('My name is Raju',false));
    _qList.add(QAdata('My name is Raven',true));
    _qList.add(QAdata('My name is Shekhu',true));
    _qList.add(QAdata('My name is Rityu',false));
  }

  String getQuestion(){
    print(_index);
    if(_index >= _qList.length){
      return '';
    }

    return _qList[_index].question;
  }

  bool getAnswer(){
    return _qList[_index++].answer;
  }

  bool ifEnd(){
    if(_index >= _qList.length){
      return true;
    }
    else
      return false;
  }

  void reset()
  {
    _index = 0;
  }
}
