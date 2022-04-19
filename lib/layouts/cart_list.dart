import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/cart.dart';
import '../boxes.dart';
import 'add_cart.dart';

class ItemListScreen extends StatefulWidget {
  final String title;
  const ItemListScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<ItemListScreen> createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<Box<Item>>(
        valueListenable: HiveBoxes.getItems().listenable(),
        builder: (context, box, _) {
          final items = box.values.toList().cast<Item>();
          if (items.isEmpty) {
            return const Center(
              child: Text('Keranjang Kosong'),
            );
          } else {
            return ListView.builder(
              itemCount: box.values.length,
              itemBuilder: (BuildContext context, int index) {
                Item? res = box.getAt(index);
                return Dismissible(
                  background: Container(
                    color: Colors.red,
                  ),
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    res!.delete();
                  },
                  child: ListTile(
                    title: Text(res!.title),
                    subtitle: Text(res.description),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Tambah ke Keranjang',
        child: const Icon(Icons.add),
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const AddItem()))
        },
      ),
    );
  }
}
