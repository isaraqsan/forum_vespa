import 'package:flutter/material.dart';
import 'package:vespa_app/core/app/color_palette.dart';
import 'package:vespa_app/presentations/component/component.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  String query = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: ColorPalette.primary,
        elevation: 0,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        titleSpacing: 16,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
          ),
          child: TextField(
            controller: _searchController,
            autofocus: true,
            onChanged: (value) {
              setState(() {
                query = value;
              });
            },
            style: const TextStyle(color: Colors.black),
            decoration: Component.decorationRoundedSearchX("Cari di sini..."),
          ),
        ),
      ),
      body: query.isEmpty
          ? const Center(
              child: Text(
                'Mulai ketik untuk mencari...',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.search),
                  title: Text("$query result $index"),
                  subtitle: const Text("Deskripsi singkat..."),
                  onTap: () {
                    // aksi ketika hasil diklik
                  },
                );
              },
            ),
    );
  }
}
