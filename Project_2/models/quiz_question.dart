class QuizQuestion{//This class is assigned with a list of question
  const QuizQuestion(this.textQuestion, this.answer);//Constructed class created combined with question and 4 answer and

  final String textQuestion;
  final List<String> answer;
  List <String> getShuffledAnswer(){
    final shuffledList = List.of(answer);
    shuffledList.shuffle();
    return shuffledList;
  }
}