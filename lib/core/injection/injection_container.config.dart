// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_database/firebase_database.dart' as _i345;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../feature/authen/data/repositories/imple_repositories.dart'
    as _i598;
import '../../feature/authen/data/service/impl_remote_service.dart' as _i259;
import '../../feature/authen/data/service/remote_service.dart' as _i166;
import '../../feature/authen/domaine/repository/authen_repository.dart'
    as _i653;
import '../../feature/authen/domaine/usercase/create_profile_engagement.dart'
    as _i1031;
import '../../feature/authen/domaine/usercase/create_profile_usercase.dart'
    as _i855;
import '../../feature/authen/domaine/usercase/create_social_profile_usercase.dart'
    as _i561;
import '../../feature/authen/domaine/usercase/create_spiritual_profile.dart'
    as _i127;
import 'injection_container.dart' as _i809;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i345.DatabaseReference>(() => injectableModule.userDb);
    gh.lazySingleton<_i519.Client>(() => injectableModule.httpClient);
    gh.lazySingleton<_i558.FlutterSecureStorage>(() => injectableModule.prefs);
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => injectableModule.locaDataShared(),
      preResolve: true,
    );
    gh.lazySingleton<_i259.AuthenRemoteService>(
      () => _i166.ImplRemoteService(db: gh<_i345.DatabaseReference>()),
    );
    gh.lazySingleton<_i653.AuthenRepository>(
      () => _i598.ImpleAuthenRepository(
        authenRemoteService: gh<_i259.AuthenRemoteService>(),
      ),
    );
    gh.lazySingleton<_i855.CreateProfileUsercase>(
      () => _i855.CreateProfileUsercase(gh<_i653.AuthenRepository>()),
    );
    gh.lazySingleton<_i561.CreateSocialProfileUsercase>(
      () => _i561.CreateSocialProfileUsercase(gh<_i653.AuthenRepository>()),
    );
    gh.lazySingleton<_i127.CreateSpiritualProfileUsercase>(
      () => _i127.CreateSpiritualProfileUsercase(gh<_i653.AuthenRepository>()),
    );
    gh.lazySingleton<_i1031.CreateEngagementProfileUsercase>(
      () =>
          _i1031.CreateEngagementProfileUsercase(gh<_i653.AuthenRepository>()),
    );
    return this;
  }
}

class _$InjectableModule extends _i809.InjectableModule {}
