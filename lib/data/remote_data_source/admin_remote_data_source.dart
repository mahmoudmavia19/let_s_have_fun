import 'package:dartz/dartz.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/errors/error_handler.dart';
import 'package:let_s_have_fun/core/utils/app_strings.dart';
import 'package:let_s_have_fun/data/apiClient/admin_api_client.dart';
import 'package:let_s_have_fun/presentation/admin/games_management/model/game.dart';

import '../../core/constant/constant.dart';
import '../../core/errors/failure.dart';
import '../../presentation/admin/exercies_management/model/Exercise.dart';
import '../../presentation/admin/exercies_management/model/level.dart';
import '../models/game_request.dart';

abstract class AdminRemoteDataSource {
  Future<Either<Failure,bool>> signIn(String email, String password);
  Future<Either<Failure,void>> signOut();
  Future<Either<Failure,Exercise>> addExercies(Exercise exercise);
  Future<Either<Failure,void>> deleteExercies(Exercise exercise);
  Future<Either<Failure,List<Exercise>>> getExercies();
  Future<Either<Failure,void>> updateLevels(Exercise exercise);
  Future<Either<Failure,Game>> updateGameOfLevel(Exercise exercise,Game gameRequest);

}

class AdminRemoteDataSourceImpl implements AdminRemoteDataSource {

  AdminApiClient apiClient ;
  NetworkInfo networkInfo ;


  AdminRemoteDataSourceImpl(this.apiClient, this.networkInfo);

  @override
  Future<Either<Failure, bool>> signIn(String email, String password) async{
    if(await networkInfo.isConnected()){
      try {
        var response = await apiClient.signIn(email, password);
        if(response) return Right(response);
        else return Left(Failure(ApiInternalStatus.FAILURE.toString(), AppStrings.notAdmin));
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }

  }

  @override
  Future<Either<Failure, void>> signOut() async{
    if( await networkInfo.isConnected()){
      try {
        await apiClient.signOut();
        return Right(nullVoid);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Exercise>> addExercies(Exercise exercise) async{
   if(await networkInfo.isConnected()){
     try {
       var response = await apiClient.addExercies(exercise);
       return Right(response);
     } catch (e) {
       return Left(ErrorHandler.handle(e).failure);
     }
   } else {
     return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
   }
  }

  @override
  Future<Either<Failure, void>> deleteExercies(Exercise exercise) async{
    if(await networkInfo.isConnected()){
      try {
        var response = await apiClient.deleteExercies(exercise);
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<Exercise>>> getExercies() async{
   if(await networkInfo.isConnected()){
     try {
       var response = await apiClient.getExercies();
       return Right(response);
     } catch (e) {
       return Left(ErrorHandler.handle(e).failure);
     }
   } else {
     return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
   }
  }

  @override
  Future<Either<Failure, void>> updateLevels(Exercise exercise) async{
    if(await networkInfo.isConnected()){
      try {
        var response = await apiClient.updateLevels(exercise);
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Game>> updateGameOfLevel(Exercise exercise, Game gameRequest)async{
     if(await networkInfo.isConnected()){
       try {
         var response = await apiClient.updateGameOfLevel(exercise, gameRequest);
         return Right(response);
       } catch (e) {
         return Left(ErrorHandler.handle(e).failure);
       }
     } else {
       return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
     }
  }



}