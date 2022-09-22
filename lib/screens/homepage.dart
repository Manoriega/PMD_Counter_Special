import 'package:counter_special/provider/Counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador v2.0"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<Counter>(
                builder: (context, counter, child) {
                  return Container(
                    decoration: BoxDecoration(
                        color: counter.color,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                    child: Center(
                        child: Text(
                      "${counter.count}",
                      style: const TextStyle(fontSize: 55, color: Colors.white),
                    )),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                colorButton(context, Colors.black, "Black"),
                colorButton(context, Colors.red, "Red"),
                colorButton(context, Colors.blue, "Blue"),
                colorButton(context, Colors.green, "Green"),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  tooltip: "Sumar",
                  child: const Icon(Icons.add),
                  onPressed: () {
                    context.read<Counter>().increment();
                  },
                ),
                FloatingActionButton(
                  tooltip: "Restar",
                  child: const Icon(Icons.remove),
                  onPressed: () {
                    context.read<Counter>().decrement();
                  },
                ),
                FloatingActionButton(
                  tooltip: "Restar",
                  child: const Icon(Icons.restart_alt),
                  onPressed: () {
                    context.read<Counter>().resetCount();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  MaterialButton colorButton(BuildContext context, Color color, String text) {
    return MaterialButton(
      onPressed: () {
        context.read<Counter>().setColor(color);
      },
      color: color,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
