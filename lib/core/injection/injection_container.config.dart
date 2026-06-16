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
import '../../feature/authen/domaine/usercase/connexion_implicite_usercase.dart'
    as _i16;
import '../../feature/authen/domaine/usercase/create_profile_engagement.dart'
    as _i1031;
import '../../feature/authen/domaine/usercase/create_profile_usercase.dart'
    as _i855;
import '../../feature/authen/domaine/usercase/create_social_profile_usercase.dart'
    as _i561;
import '../../feature/authen/domaine/usercase/create_spiritual_profile.dart'
    as _i127;
import '../../feature/authen/domaine/usercase/signin_profile.dart' as _i409;
import '../../feature/authen/domaine/usercase/update_profile_deviceid_usercase.dart'
    as _i240;
import '../../feature/authen/domaine/usercase/update_profile_usercase.dart'
    as _i256;
import '../../feature/cellule/data/repositories/cellule_imple_repositories.dart'
    as _i87;
import '../../feature/cellule/data/services/celllule_repositories_remote_services.dart'
    as _i850;
import '../../feature/cellule/data/services/cellule_imple_repositories_remot_services.dart'
    as _i249;
import '../../feature/cellule/domaine/repositories/cellule_repositories_domaine.dart'
    as _i288;
import '../../feature/cellule/domaine/usecase/get_cellule_usercase.dart'
    as _i810;
import '../../feature/cellule/domaine/usecase/get_list_responsable_cellule_usercase.dart'
    as _i987;
import '../../feature/cellule/domaine/usecase/get_list_secteur.dart' as _i751;
import '../../feature/cellule/domaine/usecase/get_list_zone.dart' as _i497;
import '../../feature/cellule/domaine/usecase/get_rapport_cellule_usercase.dart'
    as _i1007;
import '../../feature/cellule/domaine/usecase/rapport_cellule_admine_usercase.dart'
    as _i907;
import '../../feature/cellule/domaine/usecase/rapport_cellule_stat_usercase.dart'
    as _i270;
import '../../feature/cellule/domaine/usecase/rapport_cellule_state_usercase.dart'
    as _i191;
import '../../feature/cellule/domaine/usecase/rapport_cellule_suggestion_usercase.dart'
    as _i25;
import '../../feature/cellule/presentation/bloc/cellule_bloc.dart' as _i945;
import '../../feature/cellule/presentation/bloc/get_responsable_cellue_bloc.dart'
    as _i332;
import '../../feature/cellule/presentation/bloc/get_responsable_secteur.dart'
    as _i736;
import '../../feature/cellule/presentation/bloc/get_responsable_zone.dart'
    as _i734;
import '../../feature/cellule/presentation/page/rapport_cellule.dart/get_rapport_cellule_bloc.dart'
    as _i695;
import '../../feature/home/data/repositories/home_data_repositories.dart'
    as _i486;
import '../../feature/home/data/service/remot_service.dart' as _i127;
import '../../feature/home/data/service/repository_remote_service.dart' as _i61;
import '../../feature/home/data/service/steam_remote_service.dart' as _i366;
import '../../feature/home/domaine/repository/home_domain_repository.dart'
    as _i962;
import '../../feature/home/domaine/usercase/get_profile_usercase.dart' as _i562;
import '../../feature/home/page/bloc/app_launcher/app_launcher_bloc.dart'
    as _i303;
import '../../feature/home/page/bloc/get_profile/get_profile_bloc.dart' as _i37;
import '../../feature/notification/data/repositories/impl_notification_repositories.dart'
    as _i236;
import '../../feature/notification/data/services/notification_imple_repositories_remote_service.dart'
    as _i340;
import '../../feature/notification/data/services/notification_repositorie_remot_service.dart'
    as _i374;
import '../../feature/notification/domaine/repositories/i_notification_repositories.dart'
    as _i482;
import '../../feature/notification/domaine/usecase/get_list_notification_usercase.dart'
    as _i249;
import '../../feature/notification/domaine/usecase/get_noftification_list_by_criterya.dart'
    as _i554;
import '../../feature/notification/domaine/usecase/read_notification_usercase.dart'
    as _i260;
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
    gh.lazySingleton<_i482.NotificationDomaineRepositories>(
      () => _i236.ImplNotificationRepositories(
        notificationImpleRepositoriesRemoteService:
            gh<_i340.NotificationImpleRepositoriesRemoteService>(),
      ),
    );
    gh.lazySingleton<_i850.CellluleRepositoriesRemoteServices>(
      () => _i249.CelluleImpleRepositoriesRemotServices(
        db: gh<_i345.DatabaseReference>(),
      ),
    );
    gh.lazySingleton<_i288.CelluleRepositoriesDomaine>(
      () => _i87.CelluleImpleRepositories(
        cellluleRepositoriesRemoteServices:
            gh<_i850.CellluleRepositoriesRemoteServices>(),
      ),
    );
    gh.lazySingleton<_i810.GetCelluleUsercase>(
      () => _i810.GetCelluleUsercase(gh<_i87.CelluleImpleRepositories>()),
    );
    gh.lazySingleton<_i987.GetListResponsableCelluleUsercase>(
      () => _i987.GetListResponsableCelluleUsercase(
        gh<_i87.CelluleImpleRepositories>(),
      ),
    );
    gh.lazySingleton<_i751.GetListSecteurUsercase>(
      () => _i751.GetListSecteurUsercase(gh<_i87.CelluleImpleRepositories>()),
    );
    gh.lazySingleton<_i497.GetListZoneUsercase>(
      () => _i497.GetListZoneUsercase(gh<_i87.CelluleImpleRepositories>()),
    );
    gh.lazySingleton<_i1007.GetRapportCelluleUsercase>(
      () =>
          _i1007.GetRapportCelluleUsercase(gh<_i87.CelluleImpleRepositories>()),
    );
    gh.lazySingleton<_i907.SendRapportCelluleStepAdministrationUsercase>(
      () => _i907.SendRapportCelluleStepAdministrationUsercase(
        gh<_i87.CelluleImpleRepositories>(),
      ),
    );
    gh.lazySingleton<_i270.SendRapportCelluleStepStatUsercase>(
      () => _i270.SendRapportCelluleStepStatUsercase(
        gh<_i87.CelluleImpleRepositories>(),
      ),
    );
    gh.lazySingleton<_i191.SendRapportCelluleStepAssistantUsercase>(
      () => _i191.SendRapportCelluleStepAssistantUsercase(
        gh<_i87.CelluleImpleRepositories>(),
      ),
    );
    gh.lazySingleton<_i25.SendRapportCelluleStepSuggestionUsercase>(
      () => _i25.SendRapportCelluleStepSuggestionUsercase(
        gh<_i87.CelluleImpleRepositories>(),
      ),
    );
    gh.lazySingleton<_i249.GetListNotificationUsercase>(
      () => _i249.GetListNotificationUsercase(
        gh<_i482.NotificationDomaineRepositories>(),
      ),
    );
    gh.lazySingleton<_i554.GetListNotificationByCriteriaUsercase>(
      () => _i554.GetListNotificationByCriteriaUsercase(
        gh<_i482.NotificationDomaineRepositories>(),
      ),
    );
    gh.lazySingleton<_i260.ReadNotificationUsercase>(
      () => _i260.ReadNotificationUsercase(
        gh<_i482.NotificationDomaineRepositories>(),
      ),
    );
    gh.lazySingleton<_i945.CelluleBloc>(
      () =>
          _i945.CelluleBloc(getCelluleUsercase: gh<_i810.GetCelluleUsercase>()),
    );
    gh.lazySingleton<_i259.AuthenRemoteService>(
      () => _i166.ImplRemoteService(db: gh<_i345.DatabaseReference>()),
    );
    gh.lazySingleton<_i61.DomaineServiceRepository>(
      () =>
          _i127.ImpDomaineServiceRepository(db: gh<_i345.DatabaseReference>()),
    );
    gh.lazySingleton<_i374.NotificationRepositorieRemotService>(
      () => _i340.NotificationImpleRepositoriesRemoteService(
        db: gh<_i345.DatabaseReference>(),
      ),
    );
    gh.lazySingleton<_i736.GetSecteurBloc>(
      () => _i736.GetSecteurBloc(
        getListSecteurUsercase: gh<_i751.GetListSecteurUsercase>(),
      ),
    );
    gh.lazySingleton<_i962.HomeDomaineRepository>(
      () => _i486.ImpleHomeDataRepositories(
        domaineServiceRepository: gh<_i61.DomaineServiceRepository>(),
      ),
    );
    gh.lazySingleton<_i734.GetZoneBloc>(
      () => _i734.GetZoneBloc(
        getListZoneUsercase: gh<_i497.GetListZoneUsercase>(),
      ),
    );
    gh.lazySingleton<_i653.AuthenRepository>(
      () => _i598.ImpleAuthenRepository(
        authenRemoteService: gh<_i259.AuthenRemoteService>(),
      ),
    );
    gh.lazySingleton<_i332.GetResponsableCelluleBloc>(
      () => _i332.GetResponsableCelluleBloc(
        getListResponsableCelluleUsercase:
            gh<_i987.GetListResponsableCelluleUsercase>(),
      ),
    );
    gh.lazySingleton<_i695.GetRapportCelluleBloc>(
      () => _i695.GetRapportCelluleBloc(
        getRapportCelluleUsercase: gh<_i1007.GetRapportCelluleUsercase>(),
      ),
    );
    gh.lazySingleton<_i562.GetProfileUsercase>(
      () => _i562.GetProfileUsercase(gh<_i962.HomeDomaineRepository>()),
    );
    gh.lazySingleton<_i16.GetConnexionImpliciteUsercase>(
      () => _i16.GetConnexionImpliciteUsercase(gh<_i653.AuthenRepository>()),
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
    gh.lazySingleton<_i240.UpdateProfileDeviceIdUsercase>(
      () => _i240.UpdateProfileDeviceIdUsercase(gh<_i653.AuthenRepository>()),
    );
    gh.lazySingleton<_i256.UpdateProfileUsercase>(
      () => _i256.UpdateProfileUsercase(gh<_i653.AuthenRepository>()),
    );
    gh.lazySingleton<_i303.ConnexionImpliciteBloc>(
      () => _i303.ConnexionImpliciteBloc(
        getConnexionImpliciteUsercase: gh<_i16.GetConnexionImpliciteUsercase>(),
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
