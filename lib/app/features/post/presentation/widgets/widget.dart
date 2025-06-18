// // features/posts/presentation/widgets/post_item.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:kipnews/app/features/post/business/entities/post_entities.dart';

// class PostItem extends ConsumerWidget {
//   final PostEntities post;

//   const PostItem({super.key, required this.post});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ListTile(
//       title: Text(post.title),
//       subtitle: Text(post.body),
//       trailing: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           IconButton(
//             icon: const Icon(Icons.edit),
//             onPressed: () => _editPost(context, ref),
//           ),
//           IconButton(
//             icon: const Icon(Icons.delete),
//             onPressed: () => _deletePost(ref),
//           ),
//         ],
//       ),
//     );
//   }

//   void _editPost(BuildContext context, WidgetRef ref) {
//     // Implement edit dialog
//   }

//   void _deletePost(WidgetRef ref) {
//     ref.read(postStateNotifierProvider.notifier).deletePost(post.id);
//   }
// }
