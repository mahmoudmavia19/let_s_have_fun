import 'package:dartz/dartz.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/errors/error_handler.dart';
import 'package:let_s_have_fun/data/apiClient/doctor_api_client.dart';
import 'package:let_s_have_fun/data/models/commnet.dart';
import 'package:let_s_have_fun/data/models/player.dart';
import 'package:let_s_have_fun/presentation/admin/doctors_mangement/model/doctor.dart';
import 'package:let_s_have_fun/presentation/doctor/child_play_history/model/play_history.dart';

import '../../core/constant/constant.dart';
import '../../core/errors/failure.dart';
import '../../presentation/doctor/exercies_management/model/Exercise.dart';
import '../../presentation/doctor/games_management/model/game.dart';

abstract class DoctorRemoteDataSource {
  Future<Either<Failure,Doctor>> signIn(String email, String password);
  Future<Either<Failure,Doctor>> sinUp(Doctor doctor, String password);
  Future<Either<Failure,void>> signOut();
  Future<Either<Failure,List<Player>> > getPlayers();
  Future<Either<Failure,Doctor>> getDoctor();
  Future<Either<Failure,void>> updateDoctor(Doctor doctor);
  Future<Either<Failure,Exercise>> addExercies(Exercise exercise);
  Future<Either<Failure,void>> deleteExercies(Exercise exercise);
  Future<Either<Failure,List<Exercise>>> getExercies();
  Future<Either<Failure,void>> updateLevels(Exercise exercise);
  Future<Either<Failure,Game>> updateGameOfLevel(Exercise exercise,Game gameRequest);
  Future<Either<Failure,void>> addPlayer(Player player,String password);
  Future<Either<Failure,List<PlayHistory>>> getPlayHistory(String userID);
  Future<Either<Failure,void>> sendComment(Comment comment);

}

class DoctorRemoteDataSourceImpl implements DoctorRemoteDataSource {

  DoctorApiClient apiClient ;
  NetworkInfo networkInfo ;


  DoctorRemoteDataSourceImpl(this.apiClient, this.networkInfo);

  @override
  Future<Either<Failure, Doctor>> signIn(String email, String password) async{
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
  Future<Either<Failure, Doctor>> sinUp(Doctor doctor, String password) async{
    if(await networkInfo.isConnected()){
      try {
        var response =await apiClient.signUp(doctor, password);
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<Player>>> getPlayers() async{
    if(await networkInfo.isConnected()){
      try {
        var response = await apiClient.getPlayers();
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Doctor>> getDoctor()async {
    if(await networkInfo.isConnected()){
      try {
        var response = await apiClient.getDoctor();
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateDoctor(Doctor doctor) async{
    if(await networkInfo.isConnected()){
      try {
        var response = await apiClient.updateDoctor(doctor);
        return Right(response);
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

  @override
  Future<Either<Failure, void>> addPlayer(Player player, String password)async {
     if(await networkInfo.isConnected()){
       try {
         var response = await apiClient.addPlayer(player, password);
         return Right(response);
       } catch (e) {
         return Left(ErrorHandler.handle(e).failure);
       }
     } else {
       return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
     }
  }

  @override
  Future<Either<Failure, List<PlayHistory>>> getPlayHistory(String userID) async{
    if(await networkInfo.isConnected()){
      try {
        var response = await apiClient.getPlayerRecords(userID);
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }

  }

  @override
  Future<Either<Failure, void>> sendComment(Comment comment) async{
    if(await networkInfo.isConnected()){
      try {
        var response = await apiClient.sendComment(comment);
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}