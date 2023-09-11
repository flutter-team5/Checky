part of 'ai_assistant_bloc.dart';

abstract class AiAssistantState {}

final class AiAssistantInitial extends AiAssistantState {}

final class LoadingAiAssistantResponseState extends AiAssistantState{}

final class FailedAiAssistantResponseState extends AiAssistantState{}

final class GetAiAssistantResponseSuccessfulState extends AiAssistantState{
  final String aiResponse;

  GetAiAssistantResponseSuccessfulState({required this.aiResponse});
}
