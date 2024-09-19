// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:kma_reg/application/check/check_cubit.dart' as _i6;
import 'package:kma_reg/application/count/count_cubit.dart' as _i7;
import 'package:kma_reg/application/set_count/set_count_cubit.dart' as _i5;
import 'package:kma_reg/domain/api_calls/i_api_calls_repo.dart' as _i3;
import 'package:kma_reg/infrastructure/api_calls/api_calls_repo.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.IApiCallsRepo>(() => _i4.ApiCallsRepo());
    gh.factory<_i5.SetCountCubit>(
        () => _i5.SetCountCubit(gh<_i3.IApiCallsRepo>()));
    gh.factory<_i6.CheckCubit>(() => _i6.CheckCubit(gh<_i3.IApiCallsRepo>()));
    gh.factory<_i7.CountCubit>(() => _i7.CountCubit(gh<_i3.IApiCallsRepo>()));
    return this;
  }
}
