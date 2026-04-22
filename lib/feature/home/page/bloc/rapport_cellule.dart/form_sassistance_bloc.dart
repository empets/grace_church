import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart';
import 'package:grace_church/feature/home/domaine/usercase/rapport_cellule_stat_usercase.dart';
import 'package:grace_church/feature/home/page/bloc/rapport_cellule.dart/event/rapport_cellule_event.dart';
import 'package:grace_church/feature/home/page/bloc/rapport_cellule.dart/state/rapport_cellule_state.dart';

class RapportCelluleSectionAssistanceBloc
    extends
        Bloc<
          RapportCelluleRequestSectionAssistanceEvent,
          RapportCelluleRequestSectionAssistanceState
        > {
  RapportCelluleSectionAssistanceBloc({
    required this.sendRapportCelluleStepStatUsercase,
  }) : super(RapportCelluleRequestSectionAssistanceState.initial()) {
    on<RapportCelluleRequestSectionAssistanceEvent>(_onEvent);
  }

  final SendRapportCelluleStepStatUsercase sendRapportCelluleStepStatUsercase;

  Future<void> _onEvent(
    RapportCelluleRequestSectionAssistanceEvent event,
    Emitter<RapportCelluleRequestSectionAssistanceState> emit,
  ) async {
    switch (event) {
      // =========================
      // 🔢 NOMBRE BAPTISER
      // =========================
      case ChangeNombreBaptiserRapportCelluleRequestSectionAssistanceEvent(
        :final nombreBaptiser,
      ):
        final updated = state.copyWith(
          nombreBaptiser: TextFormz.dirty(nombreBaptiser),
          status: FormzSubmissionStatus.initial,
        );
        emit(updated.copyWith(isValide: _validate(updated)));
        break;

      case RapportCelluleRequestSectionAssistanceEventUpdateSectionId(
        :final id,
      ):
        final updated = state.copyWith(
          id: TextFormz.dirty(id),
          status: FormzSubmissionStatus.initial,
        );
        emit(updated.copyWith(isValide: _validate(updated)));
        break;

      // =========================
      // 🧩 SECTIONS ASSISTANCE
      // =========================
      case ChangeNomBaptiserStaticRapportCelluleRequestSectionAssistanceEvent(
        :final nomBaptiserStat,
      ):

        // ignore: dead_code
        final noonBaptiser = state.copyWith(nomBaptiserStatic: nomBaptiserStat);

        // Vérification des erreurs
        if (nomBaptiserStat.any(
          (item) =>
              item.toutPetit.trim().isEmpty ||
              item.cadets.trim().isEmpty ||
              item.juniors.trim().isEmpty,
        )) {
          emit(
            noonBaptiser.copyWith(
              errorMessage: "Ce champ est obligatoire",
              isValide: false,
            ),
          );
          return;
        }

        // Si pas d'erreur → validation normale
        emit(
          noonBaptiser.copyWith(
            errorMessage: "",
            isValide: _validate(noonBaptiser),
          ),
        );

        break;

      case ChangeNoveauBaptiserRapportCelluleRequestSectionAssistanceEvent(
        :final nouveauBaptiserStat,
      ):

        // ignore: dead_code
        final nonBaptiser = state.copyWith(
          nouveauBaptiser: nouveauBaptiserStat,
        );

        // Vérification des erreurs
        if (nouveauBaptiserStat.any(
          (item) =>
              item.toutPetit.trim().isEmpty ||
              item.cadets.trim().isEmpty ||
              item.juniors.trim().isEmpty,
        )) {
          emit(
            nonBaptiser.copyWith(
              errorMessage: "Ce champ est obligatoire",
              isValide: false,
            ),
          );
          return;
        }

        // Si pas d'erreur → validation normale
        emit(
          nonBaptiser.copyWith(
            errorMessage: "",
            isValide: _validate(nonBaptiser),
          ),
        );

        break;

      case ChangeInviterRapportCelluleRequestSectionAssistanceEvent(
        :final inviterStat,
      ):

        // ignore: dead_code
        final inviter = state.copyWith(inviter: inviterStat);

        // Vérification des erreurs
        if (inviterStat.any(
          (item) =>
              item.toutPetit.trim().isEmpty ||
              item.cadets.trim().isEmpty ||
              item.juniors.trim().isEmpty,
        )) {
          emit(
            inviter.copyWith(
              errorMessage: "Ce champ est obligatoire",
              isValide: false,
            ),
          );
          return;
        }

        // Si pas d'erreur → validation normale
        emit(inviter.copyWith(errorMessage: "", isValide: _validate(inviter)));

        break;

      case ChangeFormationRapportCelluleRequestSectionAssistanceEvent(
        :final formationStat,
      ):

        // ignore: dead_code
        final formation = state.copyWith(formation: formationStat );

        // Vérification des erreurs
        if (formationStat.map((item) => item.title).any(
          (item) =>
              item.trim().isEmpty 
        )) {
          emit(
            formation.copyWith(
              errorMessage: "Ce champ est obligatoire",
              isValide: false,
            ),
          );
          return;
        }

        // Si pas d'erreur → validation normale
        emit(
          formation.copyWith(errorMessage: "", isValide: _validate(formation)),
        );

        break;

      case ChangeSectionVisiteRapportCelluleRequestSectionAssistanceEvent(
        :final sectionVisite,
      ):

        // ignore: dead_code
        final sectionVisites = state.copyWith(sectionVisite: sectionVisite);

        // Vérification des erreurs
        if (sectionVisite.any(
          (item) =>
              item.title.trim().isEmpty ||
              item.sections.any((section) => section.libelle.trim().isEmpty ),
        )) {
          emit(
            sectionVisites.copyWith(
              errorMessage: "Ce champ est obligatoire",
              isValide: false,
            ),
          );
          return;
        }

        // Si pas d'erreur → validation normale
        emit(
          sectionVisites.copyWith(
            errorMessage: "",
            isValide: _validate(sectionVisites),
          ),
        );

        break;

      case ChangeSectionActiviteRapportCelluleRequestSectionAssistanceEvent(
        :final sectionActivite,
      ):

        // ignore: dead_code
        final sectionActivites = state.copyWith(
          sectionActivite: sectionActivite,
        );

        // Vérification des erreurs
        if (sectionActivite.any(
          (item) =>
              item.title.trim().isEmpty ||
              item.sections.any((section) => section.libelle.trim().isEmpty ),
        )) {
          emit(
            sectionActivites.copyWith(
              errorMessage: "Ce champ est obligatoire",
              isValide: false,
            ),
          );
          return;
        }

        // Si pas d'erreur → validation normale
        emit(
          sectionActivites.copyWith(
            errorMessage: "",
            isValide: _validate(sectionActivites),
          ),
        );

        break;

      case ChangeSectionOuvrierRapportCelluleRequestSectionAssistanceEvent(
        :final sectionOuvrier,
      ):

        // ignore: dead_code
        final sectionOuvriers = state.copyWith(sectionOuvrier: sectionOuvrier);

        // Vérification des erreurs
        if (sectionOuvrier.any(
          (item) =>
              item.title.trim().isEmpty ||
              item.sections.any((section) => section.libelle.trim().isEmpty ),
        )) {
          emit(
            sectionOuvriers.copyWith(
              errorMessage: "Ce champ est obligatoire",
              isValide: false,
            ),
          );
          return;
        }

        // Si pas d'erreur → validation normale
        emit(
          sectionOuvriers.copyWith(
            errorMessage: "",
            isValide: _validate(sectionOuvriers),
          ),
        );

        break;

      case ChangeAutresRapportCelluleRequestSectionAssistanceEvent(
        :final autres,
      ):

        // ignore: dead_code
        final autress = state.copyWith(sectionOuvrier: autres);

        // Vérification des erreurs
        if (autres.any(
          (item) =>
              item.title.trim().isEmpty ||
              item.sections.any((section) => section.libelle.trim().isEmpty ),
        )) {
          emit(
            autress.copyWith(
              errorMessage: "Ce champ est obligatoire",
              isValide: false,
            ),
          );
          return;
        }

        // Si pas d'erreur → validation normale
        emit(autress.copyWith(errorMessage: "", isValide: _validate(autress)));

        break;

      // =========================
      // 🔥 SUBMIT
      // =========================
      case SubmitRapportCelluleRequestSectionAssistanceEvent():
        emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

        await Future.delayed(const Duration(seconds: 3));

        log("=========>> Assistance data $state");

        final response = await sendRapportCelluleStepStatUsercase.call(
          RequestRapportCelluleAssistance(
            nombreBaptiser: state.nombreBaptiser.value,
            nomBaptiserStat: state.nomBaptiserStatic
                .map((e) => e.toJson())
                .toList(),
            nouveauBaptiserStat: state.nouveauBaptiser
                .map((e) => e.toJson())
                .toList(),
            inviterStat: state.inviter.map((e) => e.toJson()).toList(),
            formationStat: state.formation.map((e) => e.toJson()).toList(),
            sectionVisite: state.sectionVisite.map((e) => e.toJson()).toList(),
            sectionActivite: state.sectionActivite
                .map((e) => e.toJson())
                .toList(),
            sectionOuvrier: state.sectionOuvrier
                .map((e) => e.toJson())
                .toList(),
            autres: state.autres.map((e) => e.toJson()).toList(),
            formAssistanceIsSubmit: 'Success',
            formAssistanceSubmitDate: DateTime.now().toIso8601String(),
            id: state.id.value,
          ),
        );

        emit(
          response.fold(
            (failure) => state.copyWith(status: FormzSubmissionStatus.failure),
            (success) => state.copyWith(status: FormzSubmissionStatus.success),
          ),
        );

        break;
    }
  }

  // =========================
  // 🔍 VALIDATION
  // =========================
  bool _validate(RapportCelluleRequestSectionAssistanceState s) {
    return Formz.validate([s.nombreBaptiser, s.id]);
  }
}
