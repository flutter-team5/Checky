// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:checky/services/api/ai_assistant_api.dart';
part 'ai_assistant_event.dart';
part 'ai_assistant_state.dart';

class AiAssistantBloc extends Bloc<AiAssistantEvent, AiAssistantState> {
  AiAssistantBloc() : super(AiAssistantInitial()) {
    on<GetAiAssistantResponseEvent>((event, emit) async {
      
      emit(LoadingAiAssistantResponseState());

      try{
        String aiResponse = await sendCodeToChatGPT(event.code, event.language);
        emit(GetAiAssistantResponseSuccessfulState(aiResponse: aiResponse));
      }catch (e){
        emit(FailedAiAssistantResponseState());
      }
    });
  }
}
