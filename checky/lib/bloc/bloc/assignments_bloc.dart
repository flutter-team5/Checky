import 'package:bloc/bloc.dart';
import 'package:checky/model/assignment_model.dart';
import 'package:checky/services/database/services/assignments_services.dart';

part 'assignments_event.dart';
part 'assignments_state.dart';

class AssignmentsBloc extends Bloc<AssignmentsEvent, AssignmentsState> {
  AssignmentsBloc() : super(AssignmentsInitial()) {
    on<GetAssignmentsEvent>((event, emit) async {
      emit(AssignmentsLoadingState());

      try {
        final List<Assignment> assignments = await getAssignments() ?? [];
        if (assignments.isNotEmpty) {
          emit(GetAssignmentsSuccessfulState(assignments));
        } else {
          emit(NoAssignmentsFoundState());
        }
      } catch (e) {
        emit(AssignmentsErrorState());
      }
    });
  }
}
