import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/widgets/custom_error.dart';
import 'package:movies/features/home/presentation/manger/more_like_this_cubit.dart';
import 'package:movies/features/home/presentation/view/widget/top_rated_movie_item.dart';

class MoreLieThisListView extends StatelessWidget {
  const MoreLieThisListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff353535),
      child: SizedBox(
        width: double.infinity,
        //height: MediaQuery.of(context).size.height*.3,
        height: 230,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('More Like This'),
            const SizedBox(
              height: 5,
            ),
            BlocBuilder<MoreLikeThisCubit, MoreLikeThisState>(
                builder: (context, state) {
              if (state is MoreLikeThisSuccess) {
                return SizedBox(
                  height: 180,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.similarMovies.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TopRatedItem(
                          moveiModel: state.similarMovies[index],
                        );
                      }),
                );
              } else if (state is MoreLikeThisFailure) {
                print(state.errorMessage);
                return CustomError(
                  errorMessage: state.errorMessage,
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
          ]),
        ),
      ),
    );
  }
}
