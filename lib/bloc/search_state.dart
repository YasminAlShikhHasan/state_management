abstract class searchState {}

class initialState extends searchState {}

class loading extends searchState {}

class loadedWord extends searchState {
  final List<String> words;
  loadedWord({required this.words});
}
