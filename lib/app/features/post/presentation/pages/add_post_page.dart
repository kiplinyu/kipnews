// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:kipnews/app/features/post/business/entities/post_entities.dart';

// class AddPostPage extends StatefulWidget {
//   const AddPostPage({super.key});

//   @override
//   State<AddPostPage> createState() => _AddPostPageState();
// }

// class _AddPostPageState extends State<AddPostPage> {
//   final titleController = TextEditingController();
//   final bodyController = TextEditingController();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ElevatedButton(
//       onPressed: () {
//         final post = PostEntities(
//           id: DateTime.now().millisecondsSinceEpoch.toString(),
//           title: titleController.text,
//           body: bodyController.text,
//         );
//         ref.read(addPostNotifierProvider.notifier).addPost(post);
//       },
//       child: Text('Add Post'),
//     );
//   }
// }
