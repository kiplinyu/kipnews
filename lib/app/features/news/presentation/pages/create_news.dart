import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kipnews/app/core/constants/constants.dart';
import 'package:kipnews/app/features/news/business/entities/news_entity.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../providers/news_provider.dart';

class CreateNews extends ConsumerStatefulWidget {
  final NewsEntity? news;

  const CreateNews({super.key, this.news});

  @override
  ConsumerState<CreateNews> createState() => _CreateNewsState();
}

class _CreateNewsState extends ConsumerState<CreateNews> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _summaryController;
  late TextEditingController _contentController;
  late TextEditingController _imageUrlController;
  String? _selectedCategory;

  final List<String> categories = [
    'Tech',
    'Finance',
    'Entertainment',
    'Sports',
    'Politics',
    'Health',
  ];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.news?.title ?? '');
    _imageUrlController = TextEditingController(text: widget.news?.imageUrl ?? '');
    _summaryController = TextEditingController(
      text: widget.news?.summary ?? '',
    );
    _contentController = TextEditingController(
      text: widget.news?.content ?? '',
    );
    _selectedCategory = widget.news?.category ?? 'null';
  }

  @override
  void dispose() {
    _titleController.dispose();
    _summaryController.dispose();
    _contentController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _submit(bool isEdit) {
    if (_formKey.currentState!.validate()) {
      Future.microtask(() async{
        final provider = ref.read(newsProvider);
        final result = await provider.upload(
          id: widget.news?.id,
          title: _titleController.text,
          summary: _summaryController.text,
          content: _contentController.text,
          category: _selectedCategory!,
          imageUrl: _imageUrlController.text,
          isEdit: isEdit,
        );

        //check result is done
        if (result) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(isEdit ? 'News updated successfully' : 'News created successfully')),
          );
          Navigator.pop(context, true);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to save news')),
          );
        }


      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.news == null ? 'Create News' : 'Edit News',
          style: GoogleFonts.exo2(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 20),

              // Add Cover Photos Section
              Text(
                'Add Cover Photos',
                style: GoogleFonts.exo2(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // TODO: Implement image picker
                },
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.primary, width: 1),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          PhosphorIcons.image(),
                          size: 48,
                          color: AppColors.placeholder,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Tap to add cover image',
                          style: GoogleFonts.exo2(color: AppColors.placeholder),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // News Details Section
              Text(
                'News Details',
                style: GoogleFonts.exo2(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 20),

              // Title Field
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: GoogleFonts.exo2(color: AppColors.placeholder),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                ),
                style: GoogleFonts.exo2(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _imageUrlController,
                decoration: InputDecoration(
                  labelText: 'Image Url',
                  labelStyle: GoogleFonts.exo2(color: AppColors.placeholder),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                ),
                style: GoogleFonts.exo2(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a imageUrl';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Category Field
              DropdownButtonFormField<String>(
                value: null,
                decoration: InputDecoration(
                  labelText: 'Category',
                  labelStyle: GoogleFonts.exo2(color: AppColors.placeholder),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                ),
                items: categories.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category, style: GoogleFonts.exo2()),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a category';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Summary Field
              TextFormField(
                controller: _summaryController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Summary',
                  labelStyle: GoogleFonts.exo2(color: AppColors.placeholder),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                ),
                style: GoogleFonts.exo2(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a summary';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Content Field
              TextFormField(
                controller: _contentController,
                maxLines: 10,
                decoration: InputDecoration(
                  labelText: 'Content',
                  labelStyle: GoogleFonts.exo2(color: AppColors.placeholder),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                ),
                style: GoogleFonts.exo2(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the content';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              // Publish Button
              ElevatedButton(
                onPressed: () => _submit(widget.news != null),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  widget.news == null ? 'Publish Now' : 'Update News',
                  style: GoogleFonts.exo2(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
