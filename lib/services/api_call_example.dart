
import 'package:dio/dio.dart';

import '../config/api_endpoints.dart';
import '../config/dio_client.dart';

class MatchingApiService {
  final Dio dio = DioClient.getInstance();

  Future<int> confirmMatchingAndCreateChatRoom({
    required int initiatorId,
    required int respondentId,
  }) async {
    final url =
        '${ApiEndpoints.matching.baseUrl}/$initiatorId/chat?respondentId=$respondentId';

    try {
      final response = await dio.post(url);
      return response.data as int;
    } catch (e) {
      throw Exception('failed to create chat room: $e');
    }
  }

  Future<void> createMatching({
    required int careeId,
    required int careGiverId,
  }) async {
    final url =
        '${ApiEndpoints.matching.baseUrl}/$careeId?careGiverId=$careGiverId';

    try {
      await dio.post(url);
    } catch (e) {
      throw Exception('Failed to create matching: $e');
    }
  }

  Future<void> cancelRequestMatching({
    required int careeId,
    required int careGiverId,
  }) async {
    final url =
        '${ApiEndpoints.matching.requests}/$careeId?careGiverId=$careGiverId';

    try {
      await dio.delete(url);
    } catch (e) {
      throw Exception('Failed to cancel matching request: $e');
    }
  }
}