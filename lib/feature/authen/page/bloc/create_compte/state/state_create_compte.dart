import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
part 'state_create_compte.freezed.dart';

@freezed
abstract class CreateCompteProfileState
    with _$CreateCompteProfileState {
   factory CreateCompteProfileState({
    required TextFormz name,
    required TextFormz dateNaissance,
    required TextFormz zoneResidence,
    required TextFormz profileImage,
    required PhoneFormz contact,
    required TextFormz email,
    required TextFormz nationalite,

    required FormzSubmissionStatus status,
    required String errorMessage,
    required bool isValide,
  }) = _CreateCompteProfileState;

  factory CreateCompteProfileState.initial() =>
       CreateCompteProfileState(
        name: TextFormz.pure(),
        dateNaissance: TextFormz.pure(),
        zoneResidence: TextFormz.pure(),
        profileImage: TextFormz.pure(),
        contact: PhoneFormz.pure(),
        email: TextFormz.pure(),
        nationalite: TextFormz.pure(),
        status: FormzSubmissionStatus.initial,
        errorMessage: '',
        isValide: false,
      );
}


@freezed
abstract class CreateCompteSocialState
    with _$CreateCompteSocialState {
  const factory CreateCompteSocialState({
    required TextFormz activity,
    required TextFormz nivauEtude,
    required TextFormz matrimonial,
    required TextFormz orphelin,

    required FormzSubmissionStatus status,
    required String errorMessage,
    required bool isValide,
  }) = _CreateCompteSocialState;

  factory CreateCompteSocialState.initial() =>
      const CreateCompteSocialState(
        activity: TextFormz.pure(),
        nivauEtude: TextFormz.pure(),
        matrimonial: TextFormz.pure(),
        orphelin: TextFormz.pure(),
        status: FormzSubmissionStatus.initial,
        errorMessage: '',
        isValide: false,
      );
}


@freezed
abstract class CreateCompteSpiritualLifeState
    with _$CreateCompteSpiritualLifeState {
  const factory CreateCompteSpiritualLifeState({
    required TextFormz statusSpirituel,
    required TextFormz dateBaptme,
    required TextFormz cellulePriere,
    required TextFormz encadreur,

    required FormzSubmissionStatus status,
    required String errorMessage,
    required bool isValide,
  }) = _CreateCompteSpiritualLifeState;

  factory CreateCompteSpiritualLifeState.initial() =>
      const CreateCompteSpiritualLifeState(
        statusSpirituel: TextFormz.pure(),
        dateBaptme: TextFormz.pure(),
        cellulePriere: TextFormz.pure(),
        encadreur: TextFormz.pure(),
        status: FormzSubmissionStatus.initial,
        errorMessage: '',
        isValide: false,
      );
}


@freezed
abstract class CreateCompteEngagementState
    with _$CreateCompteEngagementState {
  const factory CreateCompteEngagementState({
    required TextFormz departement,
    required TextFormz competence,
    required TextFormz disponibiliry,

    required FormzSubmissionStatus status,
    required String errorMessage,
    required bool isValide,
  }) = _CreateCompteEngagementState;

  factory CreateCompteEngagementState.initial() =>
      const CreateCompteEngagementState(
        departement: TextFormz.pure(),
        competence: TextFormz.pure(),
        disponibiliry: TextFormz.pure(),
        status: FormzSubmissionStatus.initial,
        errorMessage: '',
        isValide: false,
      );
}