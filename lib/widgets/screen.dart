import 'package:flutter/material.dart';
import 'package:setstate/widgets/stream.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final _counterStream = CounterStream();

  @override
  void initState() {
    super.initState();
    _counterStream.startCounter();
  }

  @override
  void dispose() {
    _counterStream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Message Stream")),
      body: Center(
        child: StreamBuilder<int>(
          stream: _counterStream.counterStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Text(                  
                  "Counter: ${snapshot.data!}",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            } 
          },
        ),
      ),
    );
  }
}