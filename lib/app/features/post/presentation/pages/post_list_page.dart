// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../providers/post_provider.dart';
// import '../../domain/entities/post.dart';
// import 'package:go_router/go_router.dart';

// class PostListPage extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final postListAsync = ref.watch(postListProvider);

//     return Scaffold(
//       appBar: AppBar(title: Text('Daftar Postingan')),
//       body: postListAsync.when(
//         data: (posts) => ListView.builder(
//           itemCount: posts.length,
//           itemBuilder: (context, index) {
//             final Post post = posts[index];
//             return ListTile(title: Text(post.title), subtitle: Text(post.body));
//           },
//         ),
//         loading: () => Center(child: CircularProgressIndicator()),
//         error: (err, stack) => Center(child: Text('Terjadi kesalahan')),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => context.push('/add'),
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
