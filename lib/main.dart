
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = ThemeData(
      primarySwatch: Colors.red,
    );

    String title = "Welcome to Flutter";
        MaterialApp materialApp = MaterialApp(
            title: title, 
            theme: themeData, 
            home: RandomWords()
        );
    return materialApp;
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

// state class 
class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);
  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext _context, int i) {
        if(i.isOdd) {
          return Divider();
        }
        final int index = i ~/ 2;
        if(index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title:Text(
        pair.asPascalCase, 
        style: _biggerFont 
        ),
      trailing: Icon(
        alreadySaved? Icons.favorite: Icons.favorite_border,
        color: alreadySaved ? Colors.red: null,
      ),
      onTap: () {
        setState(() {
          if(alreadySaved) {
            _saved.remove(pair);
          }else{
            _saved.add(pair);
          }
        });
      },
      );
  }

  @override
  Widget build(BuildContext conext) {
    return Scaffold (                   // Add from here... 
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }
}
