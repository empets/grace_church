import 'package:formz/formz.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/feature/authen/page/bloc/create_compte/event/event_create_compte.dart';
import 'package:grace_church/feature/authen/page/bloc/create_compte/state/state_create_compte.dart';
import 'package:bloc/bloc.dart';

class CreateCompteProfileSocialBloc
    extends Bloc<EventCreateCompteSocialSocial, CreateCompteSocialState> {
  CreateCompteProfileSocialBloc() : super(CreateCompteSocialState.initial()) {
    on<EventCreateCompteSocialSocial>(_onEvent);
  }

  void _onEvent(
    EventCreateCompteSocialSocial event,
    Emitter<CreateCompteSocialState> emit,
  ) {
    switch (event) {
      case ChangeActivityCreateCompteSocial(:final activity):
        final updatedState = state.copyWith(
          activity: TextFormz.dirty(activity),
          status: FormzSubmissionStatus.initial,
        );
        emit(updatedState.copyWith(isValide: _validate(updatedState)));
        break;

      case ChangeNivauEtudeEventCreateCompteSocial(:final nivauEtude):
        final updatedState = state.copyWith(
          nivauEtude: TextFormz.dirty(nivauEtude),
          status: FormzSubmissionStatus.initial,
        );
        emit(updatedState.copyWith(isValide: _validate(updatedState)));
        break;

      case ChangeMatrimonialCreateCompte(:final matrimonial):
        final updatedState = state.copyWith(
          matrimonial: TextFormz.dirty(matrimonial),
          status: FormzSubmissionStatus.initial,
        );

        emit(updatedState.copyWith(isValide: _validate(updatedState)));
        break;

      case ChangeOrphelinCreateCompte(:final orphelin):
        final updatedState = state.copyWith(
          orphelin: TextFormz.dirty(orphelin),
          status: FormzSubmissionStatus.initial,
        );

        emit(updatedState.copyWith(isValide: _validate(updatedState)));
        break;

      /// 🔥 SUBMIT
      case SubmitEventCreateCompteSocial():
        if (state.isValide) {
          emit(state.copyWith(status: FormzSubmissionStatus.success));
        }

        break;
    }
  }

  /// 🔍 VALIDATION CENTRALISÉE (propre)
  bool _validate(CreateCompteSocialState s) {
    return Formz.validate([
      s.activity,
      s.nivauEtude,
      s.matrimonial,
      s.orphelin,
    ]);
  }
}
