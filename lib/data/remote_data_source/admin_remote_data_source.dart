import 'package:dartz/dartz.dart';
import 'package:let_s_have_fun/core/app_export.dart';
import 'package:let_s_have_fun/core/errors/error_handler.dart';
import 'package:let_s_have_fun/core/utils/app_strings.dart';
import 'package:let_s_have_fun/data/apiClient/admin_api_client.dart';

import '../../core/constant/constant.dart';
import '../../core/errors/failure.dart';

abstract class AdminRemoteDataSource {
  Future<Either<Failure,bool>> signIn(String email, String password);
  Future<Either<Failure,void>> signOut();
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

}