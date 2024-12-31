

import 'package:assignment/data/models/post_model.dart';
import 'package:assignment/logic/cubits/post_cubits/post_cubit.dart';
import 'package:assignment/logic/cubits/post_cubits/post_state.dart';
import 'package:assignment/presentations/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Posts'),
      ),
      body: SafeArea(
        child: BlocConsumer<PostCubit, PostState>(
          listener: (context, state) {
            if (state is PostErrorState) {
              SnackBar snackBar = SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            if (state is PostLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PostLoadedState) {
              return buildPostListView(state.posts);
            }

            return const Center(
              child: Text("An error occurred!"),
            );
          },
        ),
      ),
    );
  }

//  Widget buildPostListView(List<PostsModel> posts) {
//     return ListView.builder(
//       itemCount: posts.length,
//       itemBuilder: (context, index) {
//         PostsModel post = posts[index];
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
//           child: Card(
//             elevation: 4,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12.0),
//             ),
//             color: Colors.white, // Card background color
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // User ID and Post ID
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Chip(
//                         label: Text('User ID: ${post.userId}'),
//                         backgroundColor: Colors.teal.shade50,
//                         labelStyle: const TextStyle(color: Colors.teal),
//                       ),
//                       Chip(
//                         label: Text('Post ID: ${post.id}'),
//                         backgroundColor: Colors.amber.shade50,
//                         labelStyle: const TextStyle(color: Colors.amber),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   // Post Title
//                   Text(
//                     post.title.toString(),
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blueGrey, // Title color
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   // Post Body
//                   Text(
//                     post.body.toString(),
//                     style: const TextStyle(
//                       fontSize: 16,
//                       color: Colors.black54, // Body text color
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

Widget buildPostListView(List<PostsModel> posts) {
  return ListView.builder(
    itemCount: posts.length,
    itemBuilder: (context, index) {
      PostsModel post = posts[index];
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(post: post),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(
                        label: Text('User ID: ${post.userId}'),
                        backgroundColor: Colors.teal.shade50,
                        labelStyle: const TextStyle(color: Colors.teal),
                      ),
                      Chip(
                        label: Text('Post ID: ${post.id}'),
                        backgroundColor: Colors.amber.shade50,
                        labelStyle: const TextStyle(color: Colors.amber),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    post.title.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    post.body.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

}
