import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final List<String> _arrayOfCounters = [];
  final TextEditingController _controller = TextEditingController();
  void _splitAndCount(String task) {
    if (task.isNotEmpty) {
      final splitted = task.split(' ');
      int counter = 0;
      for (var word in splitted) {
        if (word.contains('a') || word.contains('A')) {
          counter++;
        }
      }
      task = '';
      setState(() {
        _arrayOfCounters.add(counter.toString());
      });
    }
  }

  Widget _buildArrayCounter(String text) {
    return ListTile(title: Text(text));
  }

  Widget _buildMain() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (index < _arrayOfCounters.length) {
            return _buildArrayCounter(_arrayOfCounters[index]);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBar(
              centerTitle: true,
              backgroundColor: Colors.brown[100],
              title: const Text(
                'Char Counter',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
        backgroundColor: Colors.deepOrangeAccent[50],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.all(22),
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: TextField(
                        controller: _controller,
                        autofocus: true,
                        onSubmitted: (val) {
                          _splitAndCount(val);
                        },
                        decoration: const InputDecoration(
                          hintText: 'Write AnyThing',
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.5),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        child: const Text('Count'),
                        onPressed: () => _splitAndCount(_controller.text),
                      ),
                    )
                  ],
                )),
            _buildMain(),
          ],
        ),
      ),
    );
  }
}
