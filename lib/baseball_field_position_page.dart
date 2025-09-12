import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// data 파일에서 분리한 목록들을 가져옵니다.
import 'team_data.dart';
import 'record_data.dart';

class BaseballFieldPositionPage extends StatefulWidget {
  const BaseballFieldPositionPage({super.key});

  @override
  State<BaseballFieldPositionPage> createState() =>
      _BaseballFieldPositionPageState();
}

class _BaseballFieldPositionPageState extends State<BaseballFieldPositionPage> {
  // 색상 및 스타일
  final Color primary = const Color(0xFF1E3A8A);
  final Color surface = Colors.white;
  final Color background = const Color(0xFFF7F9FC);

  // --- 팀 순위용 상태/데이터 ---
  // x축: 2015..2025 (원 데이터는 이 범위이나 실제 표시할 데이터는 최신 10개만 사용)
  // years: 2015..2025 (11개)
  final List<int> years = [
    2015,
    2016,
    2017,
    2018,
    2019,
    2020,
    2021,
    2022,
    2023,
    2024,
  ];

  // 각 팀별 순위(2015..2025, 11개 값 — 실제 데이터로 교체)
  final Map<String, List<int>> teamRanks = {
    'LG': [9, 4, 6, 8, 4, 4, 4, 3, 1, 3],
    '한화': [6, 7, 8, 3, 9, 10, 10, 10, 9, 8],
    'SSG': [5, 6, 5, 1, 3, 9, 6, 1, 3, 6],
    '삼성': [2, 9, 9, 6, 8, 8, 3, 7, 8, 2],
    '롯데': [8, 8, 3, 7, 10, 7, 8, 8, 7, 7],
    'KIA': [7, 5, 1, 5, 7, 6, 9, 5, 6, 1],
    '두산': [1, 1, 2, 2, 1, 2, 2, 9, 5, 4],
    'KT': [10, 10, 10, 9, 6, 3, 1, 4, 2, 5],
    'NC': [3, 2, 4, 10, 5, 1, 7, 6, 4, 9],
    '키움': [4, 3, 7, 4, 2, 5, 5, 2, 10, 10],
  };

  // 선택된 팀들
  final Set<String> selectedTeams = Set.from(initialSelectedTeams);

  // 색 팔레트 (팀마다 사용) — 팀 추가로 색상 보강
  final List<Color> teamColors = [
    const Color(0xFFC30452),
    const Color(0xFFFC4E00),
    const Color(0xFFce0e2d),
    const Color(0xFF074CA1),
    const Color(0xFF041E42),
    const Color(0xFFEA0029),
    const Color(0xFF1A1748),
    const Color(0xFF000000),
    const Color(0xFF315288),
    const Color(0xFF570514),
  ];
  // --- /팀 순위용 상태/데이터 ---

  // hitterRecords / pitcherRecords는 lib/data/record_data.dart로 분리하여 import 했습니다.
  // (import 'data/record_data.dart';)

  // 선택된 metric 상태 (record_data.dart의 맵을 사용)
  late String selectedHitterMetric = hitterRecords.keys.first;
  late String selectedPitcherMetric = pitcherRecords.keys.first;

  Widget _buildRecordRow(Map<String, String> item) {
    // 선수명 / 팀명 왼쪽, 기록 / 연도 오른쪽으로 정렬
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 6,
              offset: const Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: primary.withOpacity(0.10),
            child: Text(item['rank'] ?? '',
                style: TextStyle(color: primary, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['name'] ?? '',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text(item['team'] ?? '',
                    style:
                        TextStyle(fontSize: 13, color: Colors.grey.shade600)),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(item['value'] ?? '',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: primary)),
              const SizedBox(height: 4),
              Text(item['year'] ?? '',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _metricChips(
      List<String> metrics, String selected, ValueChanged<String> onSelect) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      child: Row(
        children: metrics.map((m) {
          final bool isSelected = m == selected;
          final Color bgColor =
              isSelected ? primary.withOpacity(1.0) : surface.withOpacity(0.06);
          final Color txtColor = isSelected ? Colors.white : primary;
          final Color borderColor =
              isSelected ? primary.withOpacity(0.9) : primary.withOpacity(0.14);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: InkWell(
              onTap: () => onSelect(m),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor, width: 1),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: primary.withOpacity(0.08),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          )
                        ]
                      : null,
                ),
                child: Text(
                  m,
                  style: TextStyle(
                      color: txtColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // 타자, 투수, 팀 순위
      child: Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          title: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('📋 기록실 📋',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      fontFamily: 'Pretendard')),
              SizedBox(height: 2),
              Text('2024 시즌 기준',
                  style: TextStyle(fontSize: 12, color: Colors.white70)),
            ],
          ),
          centerTitle: true,
          elevation: 0,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontSize: 15),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: '타자'),
              Tab(text: '투수'),
              Tab(text: '팀 순위'),
            ],
          ),
        ),
        body: TabBarView(
          // 스와이프(좌/우)로 탭 전환되지 않도록 스크롤을 비활성화
          physics: const NeverScrollableScrollPhysics(),
          children: [
            // 타자 탭
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _metricChips(
                      hitterRecords.keys.toList(), selectedHitterMetric, (m) {
                    setState(() => selectedHitterMetric = m);
                  }),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.separated(
                      itemCount: hitterRecords[selectedHitterMetric]!.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, idx) {
                        final item = hitterRecords[selectedHitterMetric]![idx];
                        return _buildRecordRow(item);
                      },
                    ),
                  ),
                ],
              ),
            ),

            // 투수 탭
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _metricChips(
                      pitcherRecords.keys.toList(), selectedPitcherMetric, (m) {
                    setState(() => selectedPitcherMetric = m);
                  }),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.separated(
                      itemCount: pitcherRecords[selectedPitcherMetric]!.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, idx) {
                        final item =
                            pitcherRecords[selectedPitcherMetric]![idx];
                        return _buildRecordRow(item);
                      },
                    ),
                  ),
                ],
              ),
            ),

            // 팀 순위 탭
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: teamRanks.keys.toList().asMap().entries.map((e) {
                      final idx = e.key;
                      final team = e.value;
                      final selected = selectedTeams.contains(team);
                      final color = teamColors[idx % teamColors.length];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selected) {
                              selectedTeams.remove(team);
                            } else {
                              selectedTeams.add(team);
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: selected
                                ? color.withOpacity(0.95)
                                : surface.withOpacity(0.06),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: selected
                                    ? color.withOpacity(0.9)
                                    : Colors.grey.withOpacity(0.14)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      color: color, shape: BoxShape.circle)),
                              const SizedBox(width: 8),
                              Text(team,
                                  style: TextStyle(
                                      color: selected ? Colors.white : primary,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 8)
                        ],
                      ),
                      child: selectedTeams.isEmpty
                          ? const Center(
                              child: Text('팀을 선택하세요',
                                  style: TextStyle(color: Colors.black54)))
                          : TeamRankingChart(
                              years: years,
                              teamRanks: teamRanks,
                              teams: selectedTeams.toList(),
                              colors: teamColors,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TeamRankingChart: syncfusion_flutter_charts 사용
class TeamRankingChart extends StatelessWidget {
  final List<int> years;
  final Map<String, List<int>> teamRanks;
  final List<String> teams;
  final List<Color> colors;
  const TeamRankingChart({
    super.key,
    required this.years,
    required this.teamRanks,
    required this.teams,
    required this.colors,
  });

  List<int> get displayYears {
    final all = years;
    if (all.isEmpty) return [];
    if (all.length <= 11) return all; // 2015..2025 같은 범위 전체 사용
    return all.sublist(all.length - 11);
  }

  List<int> _displayRanksFor(String team) {
    final all = teamRanks[team] ?? [];
    final years = displayYears.length;
    if (all.length >= years) return all.sublist(all.length - years);
    final res = List<int>.from(all);
    final fill = res.isNotEmpty ? res.last : 10;
    while (res.length < years) {
      res.insert(0, fill);
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    final yearsToShow = displayYears;
    final int n = yearsToShow.length;

    // 원래 전체 팀 목록 기준 인덱스 배열 (teamColors와 매칭하기 위한 기준)
    final List<String> baseOrder = teamRanks.keys.toList();

    // Series 생성 (색상은 baseOrder 기준 인덱스로 결정)
    final List<LineSeries<_ChartPoint, num>> seriesList =
        teams.asMap().entries.map((e) {
      final team = e.value;
      final ranks = _displayRanksFor(team);
      final data = <_ChartPoint>[];
      for (int i = 0; i < n; i++) {
        data.add(_ChartPoint(yearsToShow[i], ranks[i]));
      }
      // original index in full team list
      final originalIndex = baseOrder.indexOf(team);
      final seriesColor = colors[originalIndex % colors.length];
      return LineSeries<_ChartPoint, num>(
        dataSource: data,
        xValueMapper: (_ChartPoint d, _) => d.year,
        yValueMapper: (_ChartPoint d, _) => d.rank,
        name: team,
        color: seriesColor,
        width: 2.2,
        markerSettings:
            const MarkerSettings(isVisible: true, width: 6, height: 6),
      );
    }).toList();

    return Column(
      children: [
        if (teams.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Wrap(
              spacing: 12,
              children: teams.asMap().entries.map((e) {
                final t = e.value;
                final originalIndex = baseOrder.indexOf(t);
                final c = colors[originalIndex % colors.length];
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        width: 10,
                        height: 10,
                        decoration:
                            BoxDecoration(color: c, shape: BoxShape.circle)),
                    const SizedBox(width: 6),
                    Text(t, style: const TextStyle(fontSize: 12)),
                  ],
                );
              }).toList(),
            ),
          ),
        const SizedBox(height: 6),
        Expanded(
          child: SfCartesianChart(
            plotAreaBorderWidth: 0,
            tooltipBehavior: TooltipBehavior(
              enable: true,
              activationMode: ActivationMode.singleTap, // 탭으로 토글
              shouldAlwaysShow: false, // 다시 탭하면 닫히도록
              animationDuration: 0,
              color: Colors.transparent, // 외부 오버레이 투명
              // builder에서 series.name을 사용해 원래 색을 적용
              builder: (dynamic data, dynamic point, dynamic series,
                  int pointIndex, int seriesIndex) {
                final seriesName = series?.name ?? '';
                final year = (data as _ChartPoint).year;
                final rank = (data).rank;
                // seriesName으로 originalIndex 계산
                final originalIndex = baseOrder.indexOf(seriesName);
                final borderColor = colors[originalIndex % colors.length];
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: borderColor, width: 1.6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(seriesName,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Text('$year : $rank등',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w800)),
                    ],
                  ),
                );
              },
            ),
            primaryXAxis: NumericAxis(
              minimum: yearsToShow.first.toDouble(),
              maximum: yearsToShow.last.toDouble(),
              interval: 1, // 모든 연도 라벨 표시
              majorGridLines: const MajorGridLines(color: Colors.transparent),
              labelStyle: TextStyle(color: Colors.grey.shade600, fontSize: 11),
            ),
            primaryYAxis: NumericAxis(
              isInversed: true,
              minimum: 1,
              maximum: 10,
              interval: 1,
              majorGridLines: MajorGridLines(color: Colors.grey.shade300),
              labelStyle: TextStyle(color: Colors.grey.shade600, fontSize: 11),
            ),
            legend: const Legend(isVisible: false),
            series: seriesList,
          ),
        ),
      ],
    );
  }
}

class _ChartPoint {
  final num year;
  final int rank;
  _ChartPoint(this.year, this.rank);
}
