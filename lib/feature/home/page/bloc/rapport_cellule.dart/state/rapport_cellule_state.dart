

import 'package:formz/formz.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rapport_cellule_state.freezed.dart';

@freezed
abstract class RapportCelluleSectionAdministrationState with _$RapportCelluleSectionAdministrationState {
  const factory RapportCelluleSectionAdministrationState({
    // Zone
    required TextFormz codeZone,
    required TextFormz fullNameRespoZone,
    required TextFormz contactRespoZone,

    // Secteur
    required TextFormz codeSecteur,
    required TextFormz fullNameRespoSecteur,
    required TextFormz contactRespoSecteur,

    // Cellule
    required TextFormz codeCellule,
    required TextFormz fullNameRespoCellule,
    required TextFormz contactRespoCellule,

    // Infos cellule
    required TextFormz jourCellule,
    required TextFormz offrande,

    // Statistiques
    required TextFormz nombreBaptiser,
    required TextFormz nombreNonBaptiser,

    // Liste disciples
     required List<DiscipleCellule> discipleCelluleList,
      required FormzSubmissionStatus status,
    required String errorMessage,
    required bool isValide,
  }) = _RapportCelluleSectionAdministrationState;
  
  factory RapportCelluleSectionAdministrationState.initial() => const RapportCelluleSectionAdministrationState(
    codeZone: TextFormz.pure(),
    fullNameRespoZone: TextFormz.pure(),
    contactRespoZone: TextFormz.pure(),
    codeSecteur: TextFormz.pure(),
    fullNameRespoSecteur: TextFormz.pure(),
    contactRespoSecteur: TextFormz.pure(),
    codeCellule: TextFormz.pure(),
    fullNameRespoCellule: TextFormz.pure(),
    contactRespoCellule: TextFormz.pure(),
    jourCellule: TextFormz.pure(),
    offrande: TextFormz.pure(),
    nombreBaptiser: TextFormz.pure(),
    nombreNonBaptiser: TextFormz.pure(),
    discipleCelluleList: [],
    status: FormzSubmissionStatus.initial,
    errorMessage: '',
    isValide: false,
  );
}