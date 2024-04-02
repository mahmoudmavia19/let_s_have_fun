import 'package:dartz/dartz.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/errors/error_handler.dart';
import 'package:let_s_have_fun/data/apiClient/player_api_client.dart';
import 'package:let_s_have_fun/data/models/commnet.dart';
import 'package:let_s_have_fun/data/models/player.dart';
import 'package:let_s_have_fun/data/models/role.dart';
import 'package:let_s_have_fun/presentation/admin/doctors_mangement/model/doctor.dart';
import '../../core/constant/constant.dart';
import '../../core/errors/failure.dart';
import '../../presentation/doctor/exercies_management/model/Exercise.dart';
import '../../presentation/doctor/exercies_management/model/level.dart';
import '../models/play_game.dart';

abstract class PlayerRemoteDataSource {
  Future<Either<Failure,Role>> signIn(String email, String password);
  Future<Either<Failure,Player>> signUp(Player player, String password);
  Future<Either<Failure,void>> signOut();
   Future<Either<Failure,List<Exercise>>> getExercies();
   Future<Either<Failure,Player>> getProfile();
   Future<Either<Failure,void>> updateProfile(Player player);
   Future<Either<Failure,void>> playGame(PlayGame play);
   Future<Either<Failure,List<Doctor>>> getDoctorsList();
   Future<Either<Failure,List<PlayGame>>> getPlayerRecords();
   Future<Either<Failure,void>> updateScore(PlayGame play, Level level);
  Future<Either<Failure,List<Comment>>> getComments();
}

class PlayerRemoteDataSourceImpl implements PlayerRemoteDataSource {

  PlayerApiClient apiClient ;
  NetworkInfo networkInfo ;


  PlayerRemoteDataSourceImpl(this.apiClient, this.networkInfo);

  @override
  Future<Either<Failure, Role>> signIn(String email, String password) async{
    if(await networkInfo.isConnected()){
      try {
        var response = await apiClient.signIn(email, password);
        return Right(response);
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
  Future<Either<Failure, Player>> signUp(Player player, String password) async{
    if(await networkInfo.isConnected()){
      try {
        var response = await apiClient.signUp(player, password);
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<Exercise>>> getExercies()async {
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
  Future<Either<Failure, Player>> getProfile() async{
    if(await networkInfo.isConnected()){
      try {
        var response = await apiClient.getProfile();
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }

  }

  @override
  Future<Either<Failure, void>> updateProfile(Player player) async{
    if(await networkInfo.isConnected()){
      try {
        await apiClient.updateProfile(player);
        return Right(nullVoid);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<Doctor>>> getDoctorsList() async {
    if(await networkInfo.isConnected()){
      try {
        var response = await apiClient.getDoctorsList();
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }

  }

  @override
  Future<Either<Failure, void>> playGame(PlayGame play) async{
    if(await networkInfo.isConnected()){
      try {
        await apiClient.playGame(play);
        return Right(nullVoid);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateScore(PlayGame play, Level level) async{
     if(await networkInfo.isConnected()){
       try {
         await apiClient.updateScore(play,level);
         return Right(nullVoid);
       } catch (e) {
         return Left(ErrorHandler.handle(e).failure);
       }
     } else {
       return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
     }
  }

  @override
  Future<Either<Failure, List<PlayGame>>> getPlayerRecords()async{
    if(await networkInfo.isConnected()){
      try {
        var response = await apiClient.getPlayHistory();
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<Comment>>> getComments()async{
    if(await networkInfo.isConnected()){
      try {
        var response = await apiClient.getComments();
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }



}