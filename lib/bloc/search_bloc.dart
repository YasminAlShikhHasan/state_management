import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newpro/bloc/search_event.dart';
import 'package:newpro/bloc/search_state.dart';

class searchBloc extends Bloc<searchEvent, searchState> {
  searchBloc() : super(loadedWord(words: words)) {
    on<searchWord>((event, emit) {
      List<String> searchedTitles = [];
      for (var element in words) {
        if (element.contains(event.word)) {
          searchedTitles.add(element);
        }
      }
      emit(loadedWord(words: searchedTitles));
    });
  }
  static List<String> words = [
    'flutter',
    'Google',
    'Flutter Guyes',
    'Tutorial',
    'bloc course',
    'state Management',
    'Project'
  ];
}
