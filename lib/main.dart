import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newpro/bloc/search_bloc.dart';
import 'package:newpro/bloc/search_event.dart';
import 'package:newpro/bloc/search_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<searchBloc>(
      create: (_) => searchBloc(),
      child: const MaterialApp(
        home: searchWordPage(),
      ),
    );
  }
}

class searchWordPage extends StatelessWidget {
  const searchWordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Project Number1"),
        centerTitle: true,
      ),
      body: Column(
        children: [_searchField(context), _words(context)],
      ),
    );
  }

  Widget _searchField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "search....",
          contentPadding: const EdgeInsets.all(15),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey, width: 1)),
        ),
        onChanged: (value) {
          context.read<searchBloc>().add(searchWord(word: value));
        },
      ),
    );
  }

  Widget _words(BuildContext context) {
    return BlocBuilder<searchBloc, searchState>(
      builder: (context, state) {
        if (state is loadedWord) {
          return ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                return Text(
                  state.words[index],
                  style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                );
              },
              separatorBuilder: ((context, index) => const Divider(
                    thickness: 0.2,
                    color: Colors.grey,
                  )),
              itemCount: state.words.length);
        }
        return Container();
      },
    );
  }
}
