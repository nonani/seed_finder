import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:seed_finder/providers/event_detail_provider.dart';

class EventDetailPage extends ConsumerWidget {
  final int eventId;

  const EventDetailPage({super.key, required this.eventId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventInfo = ref.watch(EventDetailProvider(eventId));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // 뒤로가기 버튼 로직
          },
        ),
      ),
      body: eventInfo.maybeWhen(
        orElse: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        data: (data) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    data.content, // 수정된 부분
                    style: const TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  _buildInfoRow('지원분야', data.businessClassificationName),
                  _buildInfoRow('대상연령', data.targetAge),
                  _buildInfoRow('기관명', data.companyName),
                  _buildInfoRow('연락처', data.contactNumber),
                  _buildInfoRow('지역', data.supportRegion),
                  _buildInfoRow(
                    '접수기간',
                    '${DateFormat("yyyy-MM-dd").format(data.startDate)} ~ ${DateFormat("yyyy-MM-dd").format(data.endDate)}',
                  ),
                  _buildInfoRow('기관구분', data.supervisingOrganization),
                  _buildInfoRow('대상', data.target),
                  _buildInfoRow('창업연력', data.businessDuration),
                  _buildInfoRow('담당부서', data.departmentInCharge),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(Icons.favorite_border),
              color: Colors.blue,
              onPressed: () {
                // 즐겨찾기 버튼 로직
              },
            ),
          ],
        ),
      ),
    );
  }

  // 정보를 표시할 행을 구성하는 함수
  Widget _buildInfoRow(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
