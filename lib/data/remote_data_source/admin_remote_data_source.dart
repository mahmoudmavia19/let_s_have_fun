import 'package:dartz/dartz.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/errors/error_handler.dart';
import 'package:let_s_have_fun/core/utils/app_strings.dart';
import 'package:let_s_have_fun/data/apiClient/admin_api_client.dart';
import 'package:let_s_have_fun/data/models/player.dart';
import 'package:let_s_have_fun/presentation/admin/doctors_mangement/model/doctor.dart';
import '../../core/constant/constant.dart';
import '../../core/errors/failure.dart';

abstract class AdminRemoteDataSource {
  Future<Either<Failure,bool>> signIn(String email, String password);
  Future<Either<Failure,void>> signOut();
  Future<Either<Failure,void>> addDoctor(Doctor doctor,String password);
  Future<Either<Failure,void>> updateDoctor(Doctor doctor);
  Future<Either<Failure,void>> updatePlayer(Player player);
  Future<Either<Failure,List<Doctor>>> getDoctors();
  Future<Either<Failure,List<Player>>> getPlayers();


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
  Future<Either<Failure, void>> addDoctor(Doctor doctor, String password) async{
    if(await networkInfo.isConnected()){
      try {
        var response = await apiClient.addDoctorToFirebase(doctor, password);
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }

  }

  @override
  Future<Either<Failure, List<Doctor>>> getDoctors() async{
    if(await networkInfo.isConnected()){
    try {
      var response = await apiClient.getDoctorsList();
      if(response.isEmpty) return Left(Failure(ApiInternalStatus.FAILURE.toString(), AppStrings.noData));
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
        var response =await apiClient.updateDoctor(doctor);
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
       var response = await apiClient.getPlayersList();
       if(response.isEmpty) return Left(Failure(ApiInternalStatus.FAILURE.toString(), AppStrings.noData));
       return Right(response);
     } catch (e) {
       return Left(ErrorHandler.handle(e).failure);
     }
   } else {
     return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
   }

  }

  @override
  Future<Either<Failure, void>> updatePlayer(Player player) async{
    if(await networkInfo.isConnected()){
      try {
        var response =await apiClient.updatePlayer(player);
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}