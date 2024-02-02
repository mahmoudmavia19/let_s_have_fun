import 'package:dartz/dartz.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/errors/error_handler.dart';
import 'package:let_s_have_fun/data/apiClient/admin_api_client.dart';
import 'package:let_s_have_fun/data/apiClient/doctor_api_client.dart';
import 'package:let_s_have_fun/data/apiClient/player_api_client.dart';
import 'package:let_s_have_fun/data/models/player.dart';
import 'package:let_s_have_fun/presentation/admin/doctors_mangement/model/doctor.dart';

import '../../core/constant/constant.dart';
import '../../core/errors/failure.dart';

abstract class PlayerRemoteDataSource {
  Future<Either<Failure,Player>> signIn(String email, String password);
  Future<Either<Failure,Player>> signUp(Player player, String password);
  Future<Either<Failure,void>> signOut();
}

class PlayerRemoteDataSourceImpl implements PlayerRemoteDataSource {

  PlayerApiClient apiClient ;
  NetworkInfo networkInfo ;


  PlayerRemoteDataSourceImpl(this.apiClient, this.networkInfo);

  @override
  Future<Either<Failure, Player>> signIn(String email, String password) async{
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

}