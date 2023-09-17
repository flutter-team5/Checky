import 'package:bloc/bloc.dart';
import 'package:checky/model/submission_model.dart';
import 'package:checky/model/user_profile_model.dart';
import 'package:checky/services/database/services/profile_service.dart';
import 'package:checky/services/database/services/submission_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'submissions_event.dart';
part 'submissions_state.dart';

class SubmissionsBloc extends Bloc<SubmissionsEvent, SubmissionsState> {
  SubmissionsBloc() : super(SubmissionsInitial()) {
    on<GetAttemptsOnAssignmentEvent>((event, emit) async {
      emit(AttemptsLoadingState());

      try {
        UserProfile userProfile = await getUserProfileByUserId(
            Supabase.instance.client.auth.currentUser!.id);
        final List<Submission> attempts = await getUserSubmissionsOnAssignment(
                event.assignmentId, userProfile.id!) ??
            [];
        if (attempts.isNotEmpty) {
          emit(GetAttemptsSuccessfulState(attempts.reversed.toList()));
        } else {
          emit(NoAttemptsFoundState());
        }
      } catch (e) {
        print(e);
        emit(AttemptsErrorState());
      }
    });

    on<GetAllUserAttemptsEvent>((event, emit) async {
      emit(AttemptsLoadingState());

      try {
        final List<Submission> attempts =
            await getUserSubmissionsByUUID(event.userId) ?? [];
        if (attempts.isNotEmpty) {
          emit(GetAttemptsSuccessfulState(attempts.reversed.toList()));
        } else {
          emit(NoAttemptsFoundState());
        }
      } catch (e) {
        print(e);
        emit(AttemptsErrorState());
      }
    });
  }
}
