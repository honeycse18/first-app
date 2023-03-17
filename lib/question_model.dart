class Question {
  final String questionText;

  Question(this.questionText);
}

List<Question> getQuestion() {
  List<Question> list = [];
//Add question and answer here
  list.add(Question(
    "What is Flutter?",
  ));

  list.add(Question(
    "What is Dart?",
  ));

  list.add(Question(
    "What are the Flutter widgets?",
  ));
  list.add(Question(
    "What do you understand by the Stateful and Stateless widgets?",
  ));
  list.add(Question(
    "What are the best editors for Flutter development?",
  ));
  list.add(Question(
    "What is pubspec.yaml file?",
  ));
  list.add(Question(
    "What are packages and plugins in Flutter?",
  ));
  list.add(Question(
    "What are the advantages of Flutter?",
  ));
  list.add(Question(
    "Should I learn Dart for Flutter?",
  ));
  list.add(Question(
    "Is Flutter Free?",
  ));

  return list;
}
