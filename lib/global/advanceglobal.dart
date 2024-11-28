import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/global/globalstate.dart';
import 'package:provider/provider.dart';

class GlobalAdvancedCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GlobalState(), // membuat instance untuk diakses dalam aplikasi 
      child: MaterialApp(
        home: GlobalAdvancedCounterHomePage(),
      ),
    );
  }
}

class GlobalAdvancedCounterHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final globalState = Provider.of<GlobalState>(context); // melakukan Global Access

    return Scaffold(
      appBar: AppBar(title: Text('Global Advanced Counter')),
      body: ReorderableListView( // mengatur ulang urutan elemen (jadi bisa diblg mengubah posisi agar tak terjadi error saat mengahpus elemen)
        onReorder: (oldIndex, newIndex) {
          if (newIndex > oldIndex) newIndex--; // dikurangi agar nilai dan posisi menjadi sesuai
          final item = globalState.counters.removeAt(oldIndex); // menghapus dari posisi lama
          globalState.counters.insert(newIndex, item); // menambahkan ke posisi baru
          globalState.notifyListeners();  // memberitau widget memperbarui tampilan
        },
        children: List.generate(globalState.counters.length, (index) {
          final counter = globalState.counters[index];
          return ListTile(
            key: ValueKey(index),
            tileColor: counter.color,
            title: Text(
              counter.label,
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Value: ${counter.value}',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.add, color: Colors.white),
                  onPressed: () => globalState.incrementCounter(index),
                ).animate() .fade(duration: 500.ms),
                IconButton(
                  icon: Icon(Icons.remove, color: Colors.white),
                  onPressed: () => globalState.decrementCounter(index),
                ).animate() .fade(duration: 500.ms),
                IconButton(
                  icon: Icon(Icons.color_lens, color: Colors.white),
                  onPressed: () => globalState.changeColor(index),
                ).animate() .fade(duration: 500.ms),
                IconButton(
                  icon: Icon(Icons.label, color: Colors.white),
                  onPressed: () => globalState.changeLabel(index),
                ).animate() .fade(duration: 500.ms),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.white),
                  onPressed: () => globalState.removeCounter(index),
                ).animate() .fade(duration: 500.ms),
              ],
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: globalState.addCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}
