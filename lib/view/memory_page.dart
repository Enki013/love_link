import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/memory_viewmodel.dart';
import 'image_galery_page.dart';

class MemoryPage extends StatelessWidget {
  const MemoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anı Saklama'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_a_photo),
            onPressed: () {
              context.read<MemoryViewModel>().pickImage();
            },
          ),
        ],
      ),
      body: Consumer<MemoryViewModel>(
        builder: (context, viewModel, child) {
          return viewModel.memories.isEmpty
              ? const Center(child: Text('Henüz fotoğraf yüklenmedi.'))
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemCount: viewModel.memories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageGalleryPage(
                              imagePaths: viewModel.memories
                                  .map((e) => e.imagePath)
                                  .toList(),
                              initialIndex: index,
                            ),
                          ),
                        );
                      },
                      child: Image.file(
                        File(viewModel.memories[index].imagePath),
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
