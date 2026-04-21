// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

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
import '../../feature/authen/domaine/usercase/signin_profile.dart' as _i409;
import '../../feature/authen/domaine/usercase/update_profile_usercase.dart'
    as _i256;
import '../../feature/home/data/repositories/home_data_repositories.dart'
    as _i486;
import '../../feature/home/data/service/remot_service.dart' as _i127;
import '../../feature/home/data/service/repository_remote_service.dart' as _i61;
import '../../feature/home/data/service/steam_remote_service.dart' as _i366;
import '../../feature/home/domaine/repository/home_domain_repository.dart'
    as _i962;
import '../../feature/home/domaine/usercase/get_cellule_usercase.dart' as _i625;
import '../../feature/home/domaine/usercase/get_list_notification_usercase.dart'
    as _i15;
import '../../feature/home/domaine/usercase/get_list_responsable_cellule_usercase.dart'
    as _i47;
import '../../feature/home/domaine/usercase/get_list_secteur.dart' as _i791;
import '../../feature/home/domaine/usercase/get_list_zone.dart' as _i554;
import '../../feature/home/domaine/usercase/get_profile_usercase.dart' as _i562;
import '../../feature/home/domaine/usercase/rapport_cellule_admine_usercase.dart'
    as _i716;
import '../../feature/home/domaine/usercase/rapport_cellule_stat_usercase.dart'
    as _i806;
import '../../feature/home/domaine/usercase/rapport_cellule_state_usercase.dart'
    as _i1061;
import '../../feature/home/page/bloc/app_launcher/app_launcher_bloc.dart'
    as _i303;
import '../../feature/home/page/bloc/departement/eglise_maison/cellule_bloc.dart'
    as _i334;
import '../../feature/home/page/bloc/departement/eglise_maison/get_responsable_cellue_bloc.dart'
    as _i935;
import '../../feature/home/page/bloc/departement/eglise_maison/get_responsable_secteur.dart'
    as _i308;
import '../../feature/home/page/bloc/departement/eglise_maison/get_responsable_zone.dart'
    as _i631;
import '../../feature/home/page/bloc/get_profile/get_profile_bloc.dart' as _i37;
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
    gh.lazySingleton<_i366.ImpleSteamRemoteService>(
      () => _i366.ImpleSteamRemoteService(),
    );
    gh.lazySingleton<_i303.AppLauncherBloc>(() => _i303.AppLauncherBloc());
    gh.lazySingleton<_i259.AuthenRemoteService>(
      () => _i166.ImplRemoteService(db: gh<_i345.DatabaseReference>()),
    );
    gh.lazySingleton<_i61.DomaineServiceRepository>(
      () =>
          _i127.ImpDomaineServiceRepository(db: gh<_i345.DatabaseReference>()),
    );
    gh.lazySingleton<_i962.HomeDomaineRepository>(
      () => _i486.ImpleHomeDataRepositories(
        domaineServiceRepository: gh<_i61.DomaineServiceRepository>(),
      ),
    );
    gh.lazySingleton<_i653.AuthenRepository>(
      () => _i598.ImpleAuthenRepository(
        authenRemoteService: gh<_i259.AuthenRemoteService>(),
      ),
    );
    gh.lazySingleton<_i625.GetCelluleUsercase>(
      () => _i625.GetCelluleUsercase(gh<_i962.HomeDomaineRepository>()),
    );
    gh.lazySingleton<_i15.GetListNotificationUsercase>(
      () => _i15.GetListNotificationUsercase(gh<_i962.HomeDomaineRepository>()),
    );
    gh.lazySingleton<_i15.GetListNotificationByCriteriaUsercase>(
      () => _i15.GetListNotificationByCriteriaUsercase(
        gh<_i962.HomeDomaineRepository>(),
      ),
    );
    gh.lazySingleton<_i47.GetListResponsableCelluleUsercase>(
      () => _i47.GetListResponsableCelluleUsercase(
        gh<_i962.HomeDomaineRepository>(),
      ),
    );
    gh.lazySingleton<_i791.GetListSecteurUsercase>(
      () => _i791.GetListSecteurUsercase(gh<_i962.HomeDomaineRepository>()),
    );
    gh.lazySingleton<_i554.GetListZoneUsercase>(
      () => _i554.GetListZoneUsercase(gh<_i962.HomeDomaineRepository>()),
    );
    gh.lazySingleton<_i562.GetProfileUsercase>(
      () => _i562.GetProfileUsercase(gh<_i962.HomeDomaineRepository>()),
    );
    gh.lazySingleton<_i562.GetProfileStreamUsercase>(
      () => _i562.GetProfileStreamUsercase(gh<_i962.HomeDomaineRepository>()),
    );
    gh.lazySingleton<_i716.SendRapportCelluleStepAdministrationUsercase>(
      () => _i716.SendRapportCelluleStepAdministrationUsercase(
        gh<_i962.HomeDomaineRepository>(),
      ),
    );
    gh.lazySingleton<_i806.SendRapportCelluleStepStatUsercase>(
      () => _i806.SendRapportCelluleStepStatUsercase(
        gh<_i962.HomeDomaineRepository>(),
      ),
    );
    gh.lazySingleton<_i1061.SendRapportCelluleStepAssistantUsercase>(
      () => _i1061.SendRapportCelluleStepAssistantUsercase(
        gh<_i962.HomeDomaineRepository>(),
      ),
    );
    gh.lazySingleton<_i334.CelluleBloc>(
      () =>
          _i334.CelluleBloc(getCelluleUsercase: gh<_i625.GetCelluleUsercase>()),
    );
    gh.lazySingleton<_i1031.CreateEngagementProfileUsercase>(
      () =>
          _i1031.CreateEngagementProfileUsercase(gh<_i653.AuthenRepository>()),
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
    gh.lazySingleton<_i409.CreateSignInProfileUsercase>(
      () => _i409.CreateSignInProfileUsercase(gh<_i653.AuthenRepository>()),
    );
    gh.lazySingleton<_i256.UpdateProfileUsercase>(
      () => _i256.UpdateProfileUsercase(gh<_i653.AuthenRepository>()),
    );
    gh.lazySingleton<_i308.GetResponsableSecteurBloc>(
      () => _i308.GetResponsableSecteurBloc(
        getListSecteurUsercase: gh<_i791.GetListSecteurUsercase>(),
      ),
    );
    gh.lazySingleton<_i631.GetResponsableZoneBloc>(
      () => _i631.GetResponsableZoneBloc(
        getListZoneUsercase: gh<_i554.GetListZoneUsercase>(),
      ),
    );
    gh.lazySingleton<_i935.GetResponsableCelluleBloc>(
      () => _i935.GetResponsableCelluleBloc(
        getListResponsableCelluleUsercase:
            gh<_i47.GetListResponsableCelluleUsercase>(),
      ),
    );
    gh.lazySingleton<_i37.GetProfileBloc>(
      () => _i37.GetProfileBloc(
        getProfileUsercase: gh<_i562.GetProfileUsercase>(),
      ),
    );
    return this;
  }
}

class _$InjectableModule extends _i809.InjectableModule {}
