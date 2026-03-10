import 'package:formz/formz.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/feature/authen/domaine/entities/request/authen_request.dart';
import 'package:grace_church/feature/authen/domaine/usercase/create_profile_usercase.dart';
import 'package:grace_church/feature/authen/page/bloc/create_compte/event/event_create_compte.dart';
import 'package:grace_church/feature/authen/page/bloc/create_compte/state/state_create_compte.dart';
import 'package:bloc/bloc.dart';

class FormProfileBloc
    extends Bloc<EventCreateCompteProfile, CreateCompteProfileState> {
  FormProfileBloc({required this.createProfileUsercase})
    : super(CreateCompteProfileState.initial()) {
    on<EventCreateCompteProfile>(createProfile);
  }

  final CreateProfileUsercase createProfileUsercase;

  Future<void> createProfile(
    EventCreateCompteProfile event,
    Emitter<CreateCompteProfileState> emit,
  ) async {
    switch (event) {
      case ChangeNameEventCreateCompteProfile(:final name):
        final nameInput = TextFormz.dirty(name);

        emit(
          state.copyWith(
            name: nameInput,
            status: FormzSubmissionStatus.initial,
            isValide: Formz.validate([
              nameInput,
              state.dateNaissance,
              state.zoneResidence,
              state.profileImage,
              state.contact,
              state.email,
              state.nationalite,
            ]),
          ),
        );
        break;

      case ChangeDateNaissanceEventCreateCompteProfile(:final dateNaissance):
        final dateInput = TextFormz.dirty(dateNaissance);

        emit(
          state.copyWith(
            dateNaissance: dateInput,
            status: FormzSubmissionStatus.initial,
            isValide: Formz.validate([
              state.name,
              dateInput,
              state.zoneResidence,
              state.profileImage,
              state.contact,
              state.email,
              state.nationalite,
            ]),
          ),
        );
        break;

      case ChangeZoneResidenceCreateCompteProfile(:final zoneResidence):
        final zoneInput = TextFormz.dirty(zoneResidence);

        emit(
          state.copyWith(
            zoneResidence: zoneInput,
            status: FormzSubmissionStatus.initial,
            isValide: Formz.validate([
              state.name,
              state.dateNaissance,
              zoneInput,
              state.profileImage,
              state.contact,
              state.email,
              state.nationalite,
            ]),
          ),
        );
        break;

      case ChangeProfileImageCreateCompteProfile(:final profileImage):
        final imageInput = TextFormz.dirty(profileImage);

        emit(
          state.copyWith(
            profileImage: imageInput,
            status: FormzSubmissionStatus.initial,
            isValide: Formz.validate([
              state.name,
              state.dateNaissance,
              state.zoneResidence,
              imageInput,
              state.contact,
              state.email,
              state.nationalite,
            ]),
          ),
        );
        break;

      case ChangeContactCreateCompteProfile(:final contact):
        final contactInput = PhoneFormz.dirty(contact);

        emit(
          state.copyWith(
            contact: contactInput,
            status: FormzSubmissionStatus.initial,
            isValide: Formz.validate([
              state.name,
              state.dateNaissance,
              state.zoneResidence,
              state.profileImage,
              contactInput,
              state.email,
              state.nationalite,
            ]),
          ),
        );
        break;

      case ChangeEmailCreateCompteProfile(:final email):
        final emailInput = TextFormz.dirty(email);

        emit(
          state.copyWith(
            email: emailInput,
            status: FormzSubmissionStatus.initial,
            isValide: Formz.validate([
              state.name,
              state.dateNaissance,
              state.zoneResidence,
              state.profileImage,
              state.contact,
              emailInput,
              state.nationalite,
            ]),
          ),
        );
        break;

      case ChangeNationaliteCreateCompteProfile(:final nationalite):
        final natInput = TextFormz.dirty(nationalite);

        emit(
          state.copyWith(
            nationalite: natInput,
            status: FormzSubmissionStatus.initial,
            isValide: Formz.validate([
              state.name,
              state.dateNaissance,
              state.zoneResidence,
              state.profileImage,
              state.contact,
              state.email,
              natInput,
            ]),
          ),
        );
        break;

      case ChangeSubmitCreateCompte():
        if (state.isValide) {
          emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

          final response = await createProfileUsercase.call(
            RequestAuthenProfile(
              name: state.name.value,
              dateNaissance: state.dateNaissance.value,
              zoneResidence: state.zoneResidence.value,
              profileImage: state.profileImage.value,
              contact: state.contact.value,
              email: state.email.value,
              nationalite: state.nationalite.value,
              dateInscription: DateTime.now().toString(),
            ),
          );

          emit(
            response.fold(
              (failure) =>
                  state.copyWith(status: FormzSubmissionStatus.failure),
              (success) =>
                  state.copyWith(status: FormzSubmissionStatus.success),
            ),
          );
        }
        break;
    }
  }
}
