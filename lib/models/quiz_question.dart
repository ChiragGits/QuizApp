class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswer() {
    final shuffledAnswer =
        List.of(answers); // List.of() create a copy of the existing list
    shuffledAnswer
        .shuffle(); // it will shuffle the order of the list item "in place"
    return shuffledAnswer;
  }
}
