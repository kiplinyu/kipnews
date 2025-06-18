import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kipnews/app/features/post/business/entities/post_entities.dart';
import '../providers/post_provider.dart';

class PostPage extends ConsumerWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postAsync = ref.watch(postProvider);
    final addPostState = ref.watch(addPostNotifierProvider);
    final titleController = TextEditingController();
    final bodyController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: bodyController,
                  decoration: InputDecoration(labelText: 'Body'),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () async {
                    final title = titleController.text.trim();
                    final body = bodyController.text.trim();

                    if (title.isEmpty || body.isEmpty) return;

                    final post = PostEntities(
                      id: null, // id boleh null karena baru
                      userId: 1, // dummy aja
                      title: title,
                      body: body,
                    );

                    await ref
                        .read(addPostNotifierProvider.notifier)
                        .addPost(post);

                    // Optional: Clear form
                    titleController.clear();
                    bodyController.clear();
                  },
                  child: Text('Add Post'),
                ),
                if (addPostState.isLoading) CircularProgressIndicator(),
                if (addPostState.hasError) Text('Failed to add post 😥'),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: postAsync.when(
              data: (posts) => ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                  );
                },
              ),
              loading: () => Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }
}
