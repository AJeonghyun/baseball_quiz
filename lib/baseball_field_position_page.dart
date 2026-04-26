import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'app_ui.dart';
import 'data/content_repository.dart';
import 'models/content_models.dart';

const Map<String, Color> _teamColorsByName = {
  'LG': Color(0xFFC30452),
  '한화': Color(0xFFFC4E00),
  'SSG': Color(0xFFCE0E2D),
  '삼성': Color(0xFF074CA1),
  '롯데': Color(0xFF041E42),
  'KIA': Color(0xFFEA0029),
  '두산': Color(0xFF131230),
  'KT': Color(0xFF000000),
  'NC': Color(0xFF315288),
  '키움': Color(0xFF570514),
};

class BaseballFieldPositionPage extends StatefulWidget {
  final ContentRepository repository;

  const BaseballFieldPositionPage({
    super.key,
    required this.repository,
  });

  @override
  State<BaseballFieldPositionPage> createState() =>
      _BaseballFieldPositionPageState();
}

class _BaseballFieldPositionPageState extends State<BaseballFieldPositionPage> {
  final Color primary = AppPalette.primary;
  final Color surface = AppPalette.surface;
  final Color background = AppPalette.background;

  final Set<String> selectedTeams = {'LG'};
  late final Future<RecordRoomData> _recordRoomFuture;

  String? selectedHitterMetric;
  String? selectedPitcherMetric;

  @override
  void initState() {
    super.initState();
    _recordRoomFuture = widget.repository.loadRecordRoom();
  }

  Widget _buildRecordRow(Map<String, String> item) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppPalette.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: primary.withValues(alpha: 0.10),
            child: Text(
              item['rank'] ?? '',
              style: TextStyle(color: primary, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'] ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item['team'] ?? '',
                  style: const TextStyle(
                      fontSize: 13, color: AppPalette.textMuted),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                item['value'] ?? '',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: primary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item['year'] ?? '',
                style:
                    const TextStyle(fontSize: 12, color: AppPalette.textMuted),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _metricChips(
    List<String> metrics,
    String selected,
    ValueChanged<String> onSelect,
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      child: Row(
        children: metrics.map((metric) {
          final isSelected = metric == selected;
          final bgColor =
              isSelected ? primary.withValues(alpha: 0.10) : surface;
          final txtColor = isSelected ? primary : AppPalette.textMuted;
          final borderColor = isSelected
              ? primary.withValues(alpha: 0.9)
              : primary.withValues(alpha: 0.14);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: InkWell(
              onTap: () => onSelect(metric),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: borderColor, width: 1),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: primary.withValues(alpha: 0.08),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ]
                      : null,
                ),
                child: Text(
                  metric,
                  style: TextStyle(
                    color: txtColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
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
      length: 3,
      child: Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          title: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '기록실',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 2),
              Text(
                '역대 기록 기준',
                style: TextStyle(fontSize: 12, color: Colors.white70),
              ),
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
        body: FutureBuilder<RecordRoomData>(
          future: _recordRoomFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const AppStatePanel(
                icon: Icons.leaderboard_rounded,
                title: '기록을 불러오는 중입니다',
                message: '선수와 팀 기록 데이터를 정리하고 있어요.',
              );
            }
            if (snapshot.hasError) {
              return const AppStatePanel(
                icon: Icons.wifi_off_rounded,
                title: '기록을 불러오지 못했습니다',
                message: '네트워크 상태를 확인한 뒤 다시 시도해 주세요.',
              );
            }
            final data = snapshot.data;
            if (data == null ||
                data.hitterRecords.isEmpty ||
                data.pitcherRecords.isEmpty ||
                data.teamRanks.isEmpty) {
              return const AppStatePanel(
                icon: Icons.search_off_rounded,
                title: '표시할 기록 데이터가 없습니다',
                message: 'Supabase에 기록 데이터가 추가되면 이곳에 표시됩니다.',
              );
            }
            return _buildLoadedTabs(data);
          },
        ),
      ),
    );
  }

  Widget _buildLoadedTabs(RecordRoomData data) {
    final hitterMetrics = data.hitterRecords.keys.toList();
    final pitcherMetrics = data.pitcherRecords.keys.toList();
    final selectedHitter = data.hitterRecords.containsKey(selectedHitterMetric)
        ? selectedHitterMetric!
        : hitterMetrics.first;
    final selectedPitcher =
        data.pitcherRecords.containsKey(selectedPitcherMetric)
            ? selectedPitcherMetric!
            : pitcherMetrics.first;
    final availableTeams = data.teamRanks.keys.toList();
    final selectedTeamsToShow = selectedTeams
        .where((team) => data.teamRanks.containsKey(team))
        .toList(growable: false);
    final chartTeams = selectedTeamsToShow.isEmpty && availableTeams.isNotEmpty
        ? [availableTeams.first]
        : selectedTeamsToShow;

    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _recordTab(
          metrics: hitterMetrics,
          selectedMetric: selectedHitter,
          records: data.hitterRecords[selectedHitter] ?? const [],
          onSelect: (metric) => setState(() => selectedHitterMetric = metric),
        ),
        _recordTab(
          metrics: pitcherMetrics,
          selectedMetric: selectedPitcher,
          records: data.pitcherRecords[selectedPitcher] ?? const [],
          onSelect: (metric) => setState(() => selectedPitcherMetric = metric),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: availableTeams.asMap().entries.map((entry) {
                  final team = entry.value;
                  final selected = chartTeams.contains(team);
                  final color = _teamColorsByName[team] ?? primary;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedTeams.contains(team)) {
                          selectedTeams.remove(team);
                        } else {
                          selectedTeams.add(team);
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color:
                            selected ? color.withValues(alpha: 0.10) : surface,
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(
                          color: selected
                              ? color.withValues(alpha: 0.8)
                              : AppPalette.border,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            team,
                            style: TextStyle(
                              color: selected ? color : AppPalette.textMuted,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 12),
              Text(
                '선택 팀: ${chartTeams.join(', ')}',
                style: const TextStyle(
                  color: AppPalette.textMuted,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppPalette.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppPalette.border),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: TeamRankingChart(
                    years: data.years,
                    teamRanks: data.teamRanks,
                    teams: chartTeams,
                    teamColors: _teamColorsByName,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _recordTab({
    required List<String> metrics,
    required String selectedMetric,
    required List<Map<String, String>> records,
    required ValueChanged<String> onSelect,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _metricChips(metrics, selectedMetric, onSelect),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.separated(
              itemCount: records.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, idx) => _buildRecordRow(records[idx]),
            ),
          ),
        ],
      ),
    );
  }
}

class TeamRankingChart extends StatelessWidget {
  final List<int> years;
  final Map<String, List<int>> teamRanks;
  final List<String> teams;
  final Map<String, Color> teamColors;

  const TeamRankingChart({
    super.key,
    required this.years,
    required this.teamRanks,
    required this.teams,
    required this.teamColors,
  });

  List<int> get displayYears {
    final all = years;
    if (all.isEmpty) return [];
    if (all.length <= 11) return all;
    return all.sublist(all.length - 11);
  }

  List<int> _displayRanksFor(String team) {
    final all = teamRanks[team] ?? [];
    final yearCount = displayYears.length;
    if (all.length >= yearCount) return all.sublist(all.length - yearCount);
    final result = List<int>.from(all);
    final fill = result.isNotEmpty ? result.last : 10;
    while (result.length < yearCount) {
      result.insert(0, fill);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final yearsToShow = displayYears;
    if (yearsToShow.isEmpty || teams.isEmpty) {
      return const Center(child: Text('팀을 선택하세요'));
    }

    final seriesList = teams.asMap().entries.map((entry) {
      final team = entry.value;
      final ranks = _displayRanksFor(team);
      final data = <_ChartPoint>[
        for (int i = 0; i < yearsToShow.length; i++)
          _ChartPoint(yearsToShow[i], ranks[i]),
      ];
      return LineSeries<_ChartPoint, num>(
        dataSource: data,
        xValueMapper: (_ChartPoint data, _) => data.year,
        yValueMapper: (_ChartPoint data, _) => data.rank,
        name: team,
        color: _teamColor(team),
        width: 2.2,
        markerSettings:
            const MarkerSettings(isVisible: true, width: 6, height: 6),
      );
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Wrap(
            spacing: 12,
            children: teams.asMap().entries.map((entry) {
              final team = entry.value;
              final color = _teamColor(team);
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(team, style: const TextStyle(fontSize: 12)),
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
              activationMode: ActivationMode.singleTap,
              shouldAlwaysShow: false,
              animationDuration: 0,
              color: Colors.transparent,
              builder: (
                dynamic data,
                dynamic point,
                dynamic series,
                int pointIndex,
                int seriesIndex,
              ) {
                final seriesName = series?.name ?? '';
                final chartPoint = data as _ChartPoint;
                final borderColor = _teamColor(seriesName);
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppPalette.surface,
                    border: Border.all(color: borderColor, width: 1.6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        seriesName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${chartPoint.year} : ${chartPoint.rank}등',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            primaryXAxis: NumericAxis(
              minimum: yearsToShow.first.toDouble(),
              maximum: yearsToShow.last.toDouble(),
              interval: 1,
              majorGridLines: const MajorGridLines(color: Colors.transparent),
              labelStyle:
                  const TextStyle(color: AppPalette.textMuted, fontSize: 11),
            ),
            primaryYAxis: const NumericAxis(
              isInversed: true,
              minimum: 1,
              maximum: 10,
              interval: 1,
              majorGridLines: MajorGridLines(color: AppPalette.border),
              labelStyle: TextStyle(color: AppPalette.textMuted, fontSize: 11),
            ),
            legend: const Legend(isVisible: false),
            series: seriesList,
          ),
        ),
      ],
    );
  }

  Color _teamColor(String team) {
    return teamColors[team] ?? const Color(0xFF1E3A8A);
  }
}

class _ChartPoint {
  final num year;
  final int rank;

  _ChartPoint(this.year, this.rank);
}
