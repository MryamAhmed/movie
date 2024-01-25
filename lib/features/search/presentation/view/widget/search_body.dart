import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/widgets/custom_error.dart';
import 'package:movies/features/search/presentation/manger/search_cubit.dart';
import 'package:movies/features/search/presentation/view/widget/search_movies.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController =
        SearchMovieCubit.get(context).searchController;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                color: const Color(0xff353535),
                child: TextField(
                  onSubmitted: (_) {
                    SearchMovieCubit.get(context).searchMovie();
                  },
                  controller: searchController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search,color: Colors.white,),
                    hintText: 'Search',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  ),
                ),
              ),
            ),
            BlocBuilder<SearchMovieCubit, SearchMovieState>(
              builder: (context, state) {
                if (state is SearchMovieSuccess){
                  return SizedBox(
                    height: 800,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: state.serchMovies.length,
                      itemBuilder: (BuildContext context, int index){
                        const SizedBox(height: 10.0);
                        return Column(
                          children: [
                            SearchMovies(result: state.serchMovies[index],),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(), //
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      },
                    ),
                  );
                } else if (state is SearchMovieFailure) {
                  print(state.errorMessage);
                  return CustomError(errorMessage: state.errorMessage,);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}