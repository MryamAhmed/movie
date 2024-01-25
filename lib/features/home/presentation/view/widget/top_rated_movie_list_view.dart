import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/presentation/view/widget/top_rated_moviwe_iteam.dart';

import '../../../../../core/widgets/custom_error.dart';
import '../../manger/get_recommende_movies_cubit.dart';

class TopRatesMovieListView extends StatelessWidget {
  const TopRatesMovieListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff353535),
      child: SizedBox(
        width: double.infinity,
        //height: MediaQuery.of(context).size.height*.3,
        height: 230,
        child: Padding(
          padding: const EdgeInsets.only(top: 10,bottom: 10,left: 16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Recomended'),
              const SizedBox(height:5,),
              BlocBuilder<GetRecommendeMoviesCubit,GetRecommendeMoviesState>(
                builder: (context , state) {
                  if(state is GetRecommendeMoviesSuccess){
                    return SizedBox(
                      height: 180,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.recommendeMovies.length,
                          itemBuilder: (BuildContext context, int index){
                            return TopRatedItem(moveiModel: state.recommendeMovies[index],);
                          }),
                    );
                  }else
                    if(state is GetRecommendeMoviesFailure){
                      print(state.errorMessage);
                      return CustomError(errorMessage: state.errorMessage,);
                    }else {
                      return const Center(child: CircularProgressIndicator());
                    }
                }
              ),
            ]
          ),
        ),
      ),
    );
  }
}