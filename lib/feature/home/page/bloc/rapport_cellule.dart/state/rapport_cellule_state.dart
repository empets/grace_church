

import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';

part 'rapport_cellule_state.freezed.dart';

@freezed
abstract class RapportCelluleRequestSectionAdministrationState with _$RapportCelluleRequestSectionAdministrationState {
  const factory RapportCelluleRequestSectionAdministrationState({
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
  }) = _RapportCelluleRequestSectionAdministrationState;
  
  factory RapportCelluleRequestSectionAdministrationState.initial() => const RapportCelluleRequestSectionAdministrationState(
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




@freezed
abstract class RapportCelluleRequestSectionAssistanceState
    with _$RapportCelluleRequestSectionAssistanceState {
  const factory RapportCelluleRequestSectionAssistanceState({
    required TextFormz nombreBaptiser,
    required TextFormz id,

    required List<RequestHumaneSectionAssistance> nomBaptiserStatic,
    required List<RequestHumaneSectionAssistance> nouveauBaptiser,
    required List<RequestHumaneSectionAssistance> inviter,
    required List<RequestHumaneSectionAssistance> formation,
    required List<RequestHumaneSectionAssistance> sectionVisite,
    required List<RequestHumaneSectionAssistance> sectionActivite,
   required List<RequestHumaneSectionAssistance> sectionOuvrier,
   required List<RequestHumaneSectionAssistance> autres,

    required FormzSubmissionStatus status,
    required String errorMessage,
    required bool isValide,
  }) = _RapportCelluleRequestSectionAssistanceState;




  factory RapportCelluleRequestSectionAssistanceState.initial() => RapportCelluleRequestSectionAssistanceState(
    nombreBaptiser: TextFormz.pure(),
    id: TextFormz.pure(),
    nomBaptiserStatic: [],
    nouveauBaptiser: [],
    inviter: [],
    formation: [],
    sectionVisite: [],
    sectionActivite: [],
    sectionOuvrier: [],
    autres: [],
    status: FormzSubmissionStatus.initial,
    errorMessage: '',
    isValide: false,
  );
}
