import 'package:assignment/data/models/post_model.dart';
import 'package:assignment/data/repositories/post_repository.dart';
import 'package:assignment/logic/cubits/post_cubits/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) {
    fetchPosts();
  }

  PostRepository postRepository = PostRepository();

  void fetchPosts() async {
    try {
      List<PostsModel> posts = await postRepository.fetchPosts();
      emit(PostLoadedState(posts));
    } catch (ex) {
      emit(PostErrorState(ex.toString()));
    }
  }
}
