import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart';
import 'package:grace_church/feature/home/domaine/usercase/rapport_cellule_state_usercase.dart';
import 'package:grace_church/feature/home/page/bloc/rapport_cellule.dart/event/rapport_cellule_event.dart';
import 'package:grace_church/feature/home/page/bloc/rapport_cellule.dart/state/rapport_cellule_state.dart';

class FormActiviteBloc
    extends
        Bloc<
          RapportCelluleRequestActivityEvent,
          RapportCelluleRequestActivityState
        > {
  FormActiviteBloc({required this.sendRapportCelluleStepAssistantUsercase})
    : super(RapportCelluleRequestActivityState.initial()) {
    on<RapportCelluleRequestActivityEvent>(formActivite);
  }

  final SendRapportCelluleStepAssistantUsercase
  sendRapportCelluleStepAssistantUsercase;

  Future<void> formActivite(
    RapportCelluleRequestActivityEvent event,
    Emitter<RapportCelluleRequestActivityState> emit,
  ) async {
    switch (event) {
      case RapportCelluleRequestActivityEventUpdateSectionId(:final id):
        final updatedState = state.copyWith(
          id: TextFormz.dirty(id),
          status: FormzSubmissionStatus.initial,
        );
        emit(updatedState.copyWith(isValide: _validate(updatedState)));
        break;

      case ChangeDiscipleRapportCelluleRequestActivityEvent(
        :final visiteDisciple,
      ):
        // ignore: dead_code
        final updatedState = state.copyWith(discipleVisiteList: visiteDisciple);

        // Vérification des erreurs
        if (visiteDisciple.any(
          (item) =>
              item.fullname.isEmpty ||
              item.probleme.trim().isEmpty ||
              item.recommandation.trim().isEmpty,
        )) {
          emit(
            updatedState.copyWith(
              errorMessage: "Ce champ est obligatoire",
              isValide: false,
            ),
          );
          return;
        }

        // Si pas d'erreur → validation normale
        emit(
          updatedState.copyWith(
            errorMessage: "",
            isValide: _validate(updatedState),
          ),
        );
        break;
      
      case ChangeMenbreRapportCelluleRequestActivityEvent(
        :final visiteMenre,
      ):
        // ignore: dead_code
        final menbreState = state.copyWith(discipleMenbreList: visiteMenre);

        // Vérification des erreurs
        if (visiteMenre.any(
          (item) =>
              item.fullname.isEmpty ||
              item.probleme.trim().isEmpty ||
              item.recommandation.trim().isEmpty,
        )) {
          emit(
            menbreState.copyWith(
              errorMessage: "Ce champ est obligatoire",
              isValide: false,
            ),
          );
          return;
        }

        // Si pas d'erreur → validation normale
        emit(
          menbreState.copyWith(
            errorMessage: "",
            isValide: _validate(menbreState),
          ),
        );
        break;

      case SubmitRapportCelluleRequestActivityEvent():
        if (state.isValide) {
          emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
          await Future.delayed(const Duration(seconds: 3));

          final result = await sendRapportCelluleStepAssistantUsercase.call(
            RequestRapportCelluleActivity(
              visiteMenbre: state.discipleMenbreList
                  .map((e) => e.toJson())
                  .toList(),
              visiteOuvrier: state.discipleVisiteList  
                  .map((e) => e.toJson())
                  .toList(),
              dateActivitySubmited: [],
              formActivityIsSubmit: "true",
              formActivitySubmitDate: DateTime.now().toIso8601String(),
            )
          ); 

          emit(result.fold((l)=> state.copyWith(status: FormzSubmissionStatus.failure), (r)=> state.copyWith(status: FormzSubmissionStatus.success)));
          
          // emit(state.copyWith(status: FormzSubmissionStatus.success));
          return;
        }
    }
  }
}

bool _validate(RapportCelluleRequestActivityState s) {
  return Formz.validate([s.id]);
}
