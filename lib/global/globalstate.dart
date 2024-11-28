import 'package:flutter/material.dart';

class GlobalState with ChangeNotifier {
  List<CounterModel> _counters = [];

  List<CounterModel> get counters => _counters;

  void addCounter() {
    _counters.add(CounterModel());
    notifyListeners(); // tambah counter
  }

  void removeCounter(int index) {
    _counters.removeAt(index);
    notifyListeners(); // hapus counter
  }

  void incrementCounter(int index) {
    _counters[index].value++;
    notifyListeners(); // menambah nilai
  }

  void decrementCounter(int index) {
    if (_counters[index].value > 0) {
      _counters[index].value--;
      notifyListeners(); // mengurangi nilai
    }
  }

  void changeColor(int index) {
    _counters[index].color = _counters[index].color == Colors.blue
        ? Colors.green
        : Colors.blue;
    notifyListeners(); // Mengubah warna label
  }

  void changeLabel(int index) {
    _counters[index].label = _counters[index].label == "Default Label"
        ? "New Label"
        : "Default Label";
    notifyListeners(); // mengganti isi label / kata label
  }
}

class CounterModel {
  int value;
  Color color;
  String label;

  CounterModel({this.value = 0, this.color = Colors.blue, this.label = "Default Label"}); //menentukan nilai default / dasar variablel
}
