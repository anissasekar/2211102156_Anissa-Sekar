import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';
import '../models/item.dart';
import 'cart_screen.dart';
import 'package:intl/intl.dart';

String formatCurrency(double amount) {
  return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 2).format(amount);
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Item> availableItems = [
    Item(id: 1, name: "Beras", price: 150000),
    Item(id: 2, name: "Gula", price: 25000),
    Item(id: 3, name: "Tepung", price: 50000),
    Item(id: 4, name: "Bumbu dapur", price: 150000),
    Item(id: 5, name: "Minyak", price: 150000),
    // Produk baru ditambahkan di sini
    Item(id: 6, name: "Garam", price: 10000),
    Item(id: 7, name: "Mie Instan", price: 12000),
    Item(id: 8, name: "Kopi", price: 20000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("woochetong mart"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: availableItems.length,
        itemBuilder: (context, index) {
          final item = availableItems[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(formatCurrency(item.price)),
            trailing: ElevatedButton(
              onPressed: () {
                Provider.of<CartModel>(context, listen: false).add(item);

                // Menampilkan Snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${item.name} berhasil ditambahkan ke keranjang!'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: const Text("Tambah"),
            ),
          );
        },
      ),
    );
  }
}
