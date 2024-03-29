import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/common/widgets/custom_error.dart';
import 'package:movies/core/extensions/spacing.dart';
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
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: 'Search',
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  ),
                ),
              ),
            ),
            BlocBuilder<SearchMovieCubit, SearchMovieState>(
              builder: (context, state) {
                if (state is SearchMovieSuccess) {
                  return SizedBox(
                    height: 800,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: state.searchMovies.length,
                      itemBuilder: (BuildContext context, int index) {
                        const SizedBox(height: 10.0);
                        return Column(
                          children: [
                            SearchMovies(
                              result: state.searchMovies[index],
                            ),
                            10.vertical,
                            const Divider(), //
                            10.vertical,
                          ],
                        );
                      },
                    ),
                  );
                } else if (state is SearchMovieFailure) {
                  return CustomError(
                    errorMessage: state.errorMessage,
                  );
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
