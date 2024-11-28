import 'package:flutter/material.dart';

class LocalAdvancedCounter extends StatefulWidget {
  @override
  _LocalAdvancedCounterState createState() => _LocalAdvancedCounterState();
}

class _LocalAdvancedCounterState extends State<LocalAdvancedCounter> {
  int _counter = 0;
  Color _counterColor = Colors.blue;
  String _label = "Default Label"; // default value

  void _incrementCounter() {
    setState(() { // bisa dibilang untuk menandai mana data yang bisa diubah
      _counter++; // menambah nilai
    });
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--; // mengurangi nilai
      });
    }
  }

  void _changeColor() {
    setState(() {
      _counterColor = _counterColor == Colors.blue ? Colors.green : Colors.blue; // mengganti warna 
    });
  }

  void _changeLabel() {
    setState(() {
      _label = _label == "Default Label" ? "New Label" : "Default Label"; // mengganti label
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Local Advanced Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              padding: EdgeInsets.all(16.0),
              color: _counterColor,
              child: Text(
                _label,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Counter Value: $_counter',
              style: TextStyle(fontSize: 24),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: Text('Increment'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: Text('Decrement'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeColor,
              child: Text('Change Color'),
            ),
            ElevatedButton(
              onPressed: _changeLabel,
              child: Text('Change Label'),
            ),
          ],
        ),
      ),
    );
  }
}
