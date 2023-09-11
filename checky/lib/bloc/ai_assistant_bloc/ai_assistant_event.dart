part of 'ai_assistant_bloc.dart';

abstract class AiAssistantEvent {}

final class GetAiAssistantResponseEvent extends AiAssistantEvent {
  final String language;
final String code;

  GetAiAssistantResponseEvent({required this.language, required this.code});
 

}

