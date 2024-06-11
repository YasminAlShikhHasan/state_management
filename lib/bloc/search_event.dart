abstract class searchEvent {}

class searchWord extends searchEvent {
  final String word;
  searchWord({required this.word});
}
