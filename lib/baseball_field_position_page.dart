import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BaseballFieldPositionPage extends StatefulWidget {
  const BaseballFieldPositionPage({super.key});

  @override
  State<BaseballFieldPositionPage> createState() =>
      _BaseballFieldPositionPageState();
}

class _BaseballFieldPositionPageState extends State<BaseballFieldPositionPage> {
  // 색상 및 스타일
  final Color primary = const Color(0xFF1E3A8A); // 모던 인디고
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
  final Set<String> selectedTeams = {'LG'};

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

  // 역대 최고 기록 데이터 (명시적 항목으로 변경)
  final Map<String, List<Map<String, String>>> hitterRecords = {
    '타율': [
      {
        'rank': '1',
        'name': '타자1',
        'team': '팀1',
        'value': '0.400',
        'year': '1980'
      },
      {
        'rank': '2',
        'name': '타자2',
        'team': '팀2',
        'value': '0.395',
        'year': '1981'
      },
      {
        'rank': '3',
        'name': '타자3',
        'team': '팀3',
        'value': '0.390',
        'year': '1982'
      },
      {
        'rank': '4',
        'name': '타자4',
        'team': '팀4',
        'value': '0.385',
        'year': '1983'
      },
      {
        'rank': '5',
        'name': '타자5',
        'team': '팀5',
        'value': '0.380',
        'year': '1984'
      },
      {
        'rank': '6',
        'name': '타자6',
        'team': '팀6',
        'value': '0.375',
        'year': '1985'
      },
      {
        'rank': '7',
        'name': '타자7',
        'team': '팀7',
        'value': '0.370',
        'year': '1986'
      },
      {
        'rank': '8',
        'name': '타자8',
        'team': '팀8',
        'value': '0.365',
        'year': '1987'
      },
      {
        'rank': '9',
        'name': '타자9',
        'team': '팀9',
        'value': '0.360',
        'year': '1988'
      },
      {
        'rank': '10',
        'name': '타자10',
        'team': '팀10',
        'value': '0.355',
        'year': '1989'
      },
    ],
    '안타': [
      {
        'rank': '1',
        'name': '타자1',
        'team': '팀1',
        'value': '350',
        'year': '1999'
      },
      {
        'rank': '2',
        'name': '타자2',
        'team': '팀2',
        'value': '340',
        'year': '1998'
      },
      {
        'rank': '3',
        'name': '타자3',
        'team': '팀3',
        'value': '330',
        'year': '2001'
      },
      {
        'rank': '4',
        'name': '타자4',
        'team': '팀4',
        'value': '320',
        'year': '1997'
      },
      {
        'rank': '5',
        'name': '타자5',
        'team': '팀5',
        'value': '310',
        'year': '2000'
      },
      {
        'rank': '6',
        'name': '타자6',
        'team': '팀6',
        'value': '305',
        'year': '2002'
      },
      {
        'rank': '7',
        'name': '타자7',
        'team': '팀7',
        'value': '300',
        'year': '2003'
      },
      {
        'rank': '8',
        'name': '타자8',
        'team': '팀8',
        'value': '295',
        'year': '2004'
      },
      {
        'rank': '9',
        'name': '타자9',
        'team': '팀9',
        'value': '290',
        'year': '2005'
      },
      {
        'rank': '10',
        'name': '타자10',
        'team': '팀10',
        'value': '285',
        'year': '2006'
      },
    ],
    '홈런': [
      {
        'rank': '1',
        'name': '타자1',
        'team': '팀1',
        'value': '762',
        'year': '1974'
      },
      {
        'rank': '2',
        'name': '타자2',
        'team': '팀2',
        'value': '660',
        'year': '1998'
      },
      {
        'rank': '3',
        'name': '타자3',
        'team': '팀3',
        'value': '612',
        'year': '2005'
      },
      {
        'rank': '4',
        'name': '타자4',
        'team': '팀4',
        'value': '590',
        'year': '1990'
      },
      {
        'rank': '5',
        'name': '타자5',
        'team': '팀5',
        'value': '575',
        'year': '1988'
      },
      {
        'rank': '6',
        'name': '타자6',
        'team': '팀6',
        'value': '560',
        'year': '1985'
      },
      {
        'rank': '7',
        'name': '타자7',
        'team': '팀7',
        'value': '540',
        'year': '1982'
      },
      {
        'rank': '8',
        'name': '타자8',
        'team': '팀8',
        'value': '520',
        'year': '1979'
      },
      {
        'rank': '9',
        'name': '타자9',
        'team': '팀9',
        'value': '510',
        'year': '1976'
      },
      {
        'rank': '10',
        'name': '타자10',
        'team': '팀10',
        'value': '500',
        'year': '1973'
      },
    ],
    '득점': [
      {
        'rank': '1',
        'name': '타자1',
        'team': '팀1',
        'value': '2000',
        'year': '1995'
      },
      {
        'rank': '2',
        'name': '타자2',
        'team': '팀2',
        'value': '1950',
        'year': '1990'
      },
      {
        'rank': '3',
        'name': '타자3',
        'team': '팀3',
        'value': '1900',
        'year': '1985'
      },
      {
        'rank': '4',
        'name': '타자4',
        'team': '팀4',
        'value': '1850',
        'year': '1980'
      },
      {
        'rank': '5',
        'name': '타자5',
        'team': '팀5',
        'value': '1800',
        'year': '1975'
      },
      {
        'rank': '6',
        'name': '타자6',
        'team': '팀6',
        'value': '1750',
        'year': '1970'
      },
      {
        'rank': '7',
        'name': '타자7',
        'team': '팀7',
        'value': '1700',
        'year': '1965'
      },
      {
        'rank': '8',
        'name': '타자8',
        'team': '팀8',
        'value': '1650',
        'year': '1960'
      },
      {
        'rank': '9',
        'name': '타자9',
        'team': '팀9',
        'value': '1600',
        'year': '1955'
      },
      {
        'rank': '10',
        'name': '타자10',
        'team': '팀10',
        'value': '1550',
        'year': '1950'
      },
    ],
    '타점': [
      {
        'rank': '1',
        'name': '타자1',
        'team': '팀1',
        'value': '1900',
        'year': '1996'
      },
      {
        'rank': '2',
        'name': '타자2',
        'team': '팀2',
        'value': '1850',
        'year': '1991'
      },
      {
        'rank': '3',
        'name': '타자3',
        'team': '팀3',
        'value': '1800',
        'year': '1986'
      },
      {
        'rank': '4',
        'name': '타자4',
        'team': '팀4',
        'value': '1750',
        'year': '1981'
      },
      {
        'rank': '5',
        'name': '타자5',
        'team': '팀5',
        'value': '1700',
        'year': '1976'
      },
      {
        'rank': '6',
        'name': '타자6',
        'team': '팀6',
        'value': '1650',
        'year': '1971'
      },
      {
        'rank': '7',
        'name': '타자7',
        'team': '팀7',
        'value': '1600',
        'year': '1966'
      },
      {
        'rank': '8',
        'name': '타자8',
        'team': '팀8',
        'value': '1550',
        'year': '1961'
      },
      {
        'rank': '9',
        'name': '타자9',
        'team': '팀9',
        'value': '1500',
        'year': '1956'
      },
      {
        'rank': '10',
        'name': '타자10',
        'team': '팀10',
        'value': '1450',
        'year': '1951'
      },
    ],
    '도루': [
      {
        'rank': '1',
        'name': '타자1',
        'team': '팀1',
        'value': '755',
        'year': '1982'
      },
      {
        'rank': '2',
        'name': '타자2',
        'team': '팀2',
        'value': '700',
        'year': '1990'
      },
      {
        'rank': '3',
        'name': '타자3',
        'team': '팀3',
        'value': '650',
        'year': '1975'
      },
      {
        'rank': '4',
        'name': '타자4',
        'team': '팀4',
        'value': '610',
        'year': '1988'
      },
      {
        'rank': '5',
        'name': '타자5',
        'team': '팀5',
        'value': '580',
        'year': '1979'
      },
      {
        'rank': '6',
        'name': '타자6',
        'team': '팀6',
        'value': '550',
        'year': '1970'
      },
      {
        'rank': '7',
        'name': '타자7',
        'team': '팀7',
        'value': '520',
        'year': '1965'
      },
      {
        'rank': '8',
        'name': '타자8',
        'team': '팀8',
        'value': '500',
        'year': '1960'
      },
      {
        'rank': '9',
        'name': '타자9',
        'team': '팀9',
        'value': '480',
        'year': '1955'
      },
      {
        'rank': '10',
        'name': '타자10',
        'team': '팀10',
        'value': '470',
        'year': '1950'
      },
    ],
    '장타율': [
      {
        'rank': '1',
        'name': '타자1',
        'team': '팀1',
        'value': '0.900',
        'year': '1998'
      },
      {
        'rank': '2',
        'name': '타자2',
        'team': '팀2',
        'value': '0.850',
        'year': '2000'
      },
      {
        'rank': '3',
        'name': '타자3',
        'team': '팀3',
        'value': '0.820',
        'year': '1995'
      },
      {
        'rank': '4',
        'name': '타자4',
        'team': '팀4',
        'value': '0.800',
        'year': '1990'
      },
      {
        'rank': '5',
        'name': '타자5',
        'team': '팀5',
        'value': '0.780',
        'year': '1985'
      },
      {
        'rank': '6',
        'name': '타자6',
        'team': '팀6',
        'value': '0.760',
        'year': '1980'
      },
      {
        'rank': '7',
        'name': '타자7',
        'team': '팀7',
        'value': '0.740',
        'year': '1975'
      },
      {
        'rank': '8',
        'name': '타자8',
        'team': '팀8',
        'value': '0.720',
        'year': '1970'
      },
      {
        'rank': '9',
        'name': '타자9',
        'team': '팀9',
        'value': '0.700',
        'year': '1965'
      },
      {
        'rank': '10',
        'name': '타자10',
        'team': '팀10',
        'value': '0.680',
        'year': '1960'
      },
    ],
    '출루율': [
      {
        'rank': '1',
        'name': '타자1',
        'team': '팀1',
        'value': '0.500',
        'year': '2004'
      },
      {
        'rank': '2',
        'name': '타자2',
        'team': '팀2',
        'value': '0.490',
        'year': '2002'
      },
      {
        'rank': '3',
        'name': '타자3',
        'team': '팀3',
        'value': '0.485',
        'year': '2000'
      },
      {
        'rank': '4',
        'name': '타자4',
        'team': '팀4',
        'value': '0.480',
        'year': '1998'
      },
      {
        'rank': '5',
        'name': '타자5',
        'team': '팀5',
        'value': '0.475',
        'year': '1996'
      },
      {
        'rank': '6',
        'name': '타자6',
        'team': '팀6',
        'value': '0.470',
        'year': '1994'
      },
      {
        'rank': '7',
        'name': '타자7',
        'team': '팀7',
        'value': '0.465',
        'year': '1992'
      },
      {
        'rank': '8',
        'name': '타자8',
        'team': '팀8',
        'value': '0.460',
        'year': '1990'
      },
      {
        'rank': '9',
        'name': '타자9',
        'team': '팀9',
        'value': '0.455',
        'year': '1988'
      },
      {
        'rank': '10',
        'name': '타자10',
        'team': '팀10',
        'value': '0.450',
        'year': '1986'
      },
    ],
    '루타': [
      {
        'rank': '1',
        'name': '타자1',
        'team': '팀1',
        'value': '4300',
        'year': '2006'
      },
      {
        'rank': '2',
        'name': '타자2',
        'team': '팀2',
        'value': '4200',
        'year': '2004'
      },
      {
        'rank': '3',
        'name': '타자3',
        'team': '팀3',
        'value': '4100',
        'year': '2002'
      },
      {
        'rank': '4',
        'name': '타자4',
        'team': '팀4',
        'value': '4000',
        'year': '2000'
      },
      {
        'rank': '5',
        'name': '타자5',
        'team': '팀5',
        'value': '3900',
        'year': '1998'
      },
      {
        'rank': '6',
        'name': '타자6',
        'team': '팀6',
        'value': '3800',
        'year': '1996'
      },
      {
        'rank': '7',
        'name': '타자7',
        'team': '팀7',
        'value': '3700',
        'year': '1994'
      },
      {
        'rank': '8',
        'name': '타자8',
        'team': '팀8',
        'value': '3600',
        'year': '1992'
      },
      {
        'rank': '9',
        'name': '타자9',
        'team': '팀9',
        'value': '3500',
        'year': '1990'
      },
      {
        'rank': '10',
        'name': '타자10',
        'team': '팀10',
        'value': '3400',
        'year': '1988'
      },
    ],
  };

  final Map<String, List<Map<String, String>>> pitcherRecords = {
    '승리': [
      {
        'rank': '1',
        'name': '투수1',
        'team': '팀1',
        'value': '400',
        'year': '1970'
      },
      {
        'rank': '2',
        'name': '투수2',
        'team': '팀2',
        'value': '390',
        'year': '1975'
      },
      {
        'rank': '3',
        'name': '투수3',
        'team': '팀3',
        'value': '380',
        'year': '1980'
      },
      {
        'rank': '4',
        'name': '투수4',
        'team': '팀4',
        'value': '370',
        'year': '1985'
      },
      {
        'rank': '5',
        'name': '투수5',
        'team': '팀5',
        'value': '360',
        'year': '1990'
      },
      {
        'rank': '6',
        'name': '투수6',
        'team': '팀6',
        'value': '350',
        'year': '1995'
      },
      {
        'rank': '7',
        'name': '투수7',
        'team': '팀7',
        'value': '340',
        'year': '2000'
      },
      {
        'rank': '8',
        'name': '투수8',
        'team': '팀8',
        'value': '330',
        'year': '2005'
      },
      {
        'rank': '9',
        'name': '투수9',
        'team': '팀9',
        'value': '320',
        'year': '2010'
      },
      {
        'rank': '10',
        'name': '투수10',
        'team': '팀10',
        'value': '310',
        'year': '2015'
      },
    ],
    '평균자책점': [
      {
        'rank': '1',
        'name': '투수1',
        'team': '팀1',
        'value': '1.50',
        'year': '1972'
      },
      {
        'rank': '2',
        'name': '투수2',
        'team': '팀2',
        'value': '1.70',
        'year': '1976'
      },
      {
        'rank': '3',
        'name': '투수3',
        'team': '팀3',
        'value': '1.90',
        'year': '1980'
      },
      {
        'rank': '4',
        'name': '투수4',
        'team': '팀4',
        'value': '2.10',
        'year': '1984'
      },
      {
        'rank': '5',
        'name': '투수5',
        'team': '팀5',
        'value': '2.30',
        'year': '1988'
      },
      {
        'rank': '6',
        'name': '투수6',
        'team': '팀6',
        'value': '2.50',
        'year': '1992'
      },
      {
        'rank': '7',
        'name': '투수7',
        'team': '팀7',
        'value': '2.70',
        'year': '1996'
      },
      {
        'rank': '8',
        'name': '투수8',
        'team': '팀8',
        'value': '2.90',
        'year': '2000'
      },
      {
        'rank': '9',
        'name': '투수9',
        'team': '팀9',
        'value': '3.10',
        'year': '2004'
      },
      {
        'rank': '10',
        'name': '투수10',
        'team': '팀10',
        'value': '3.30',
        'year': '2008'
      },
    ],
    '승률': [
      {
        'rank': '1',
        'name': '투수1',
        'team': '팀1',
        'value': '0.900',
        'year': '1960'
      },
      {
        'rank': '2',
        'name': '투수2',
        'team': '팀2',
        'value': '0.880',
        'year': '1965'
      },
      {
        'rank': '3',
        'name': '투수3',
        'team': '팀3',
        'value': '0.860',
        'year': '1970'
      },
      {
        'rank': '4',
        'name': '투수4',
        'team': '팀4',
        'value': '0.840',
        'year': '1975'
      },
      {
        'rank': '5',
        'name': '투수5',
        'team': '팀5',
        'value': '0.820',
        'year': '1980'
      },
      {
        'rank': '6',
        'name': '투수6',
        'team': '팀6',
        'value': '0.800',
        'year': '1985'
      },
      {
        'rank': '7',
        'name': '투수7',
        'team': '팀7',
        'value': '0.780',
        'year': '1990'
      },
      {
        'rank': '8',
        'name': '투수8',
        'team': '팀8',
        'value': '0.760',
        'year': '1995'
      },
      {
        'rank': '9',
        'name': '투수9',
        'team': '팀9',
        'value': '0.740',
        'year': '2000'
      },
      {
        'rank': '10',
        'name': '투수10',
        'team': '팀10',
        'value': '0.720',
        'year': '2005'
      },
    ],
    '탈삼진': [
      {
        'rank': '1',
        'name': '투수1',
        'team': '팀1',
        'value': '4000',
        'year': '1995'
      },
      {
        'rank': '2',
        'name': '투수2',
        'team': '팀2',
        'value': '3800',
        'year': '1990'
      },
      {
        'rank': '3',
        'name': '투수3',
        'team': '팀3',
        'value': '3600',
        'year': '1985'
      },
      {
        'rank': '4',
        'name': '투수4',
        'team': '팀4',
        'value': '3400',
        'year': '1980'
      },
      {
        'rank': '5',
        'name': '투수5',
        'team': '팀5',
        'value': '3200',
        'year': '1975'
      },
      {
        'rank': '6',
        'name': '투수6',
        'team': '팀6',
        'value': '3000',
        'year': '1970'
      },
      {
        'rank': '7',
        'name': '투수7',
        'team': '팀7',
        'value': '2800',
        'year': '1965'
      },
      {
        'rank': '8',
        'name': '투수8',
        'team': '팀8',
        'value': '2600',
        'year': '1960'
      },
      {
        'rank': '9',
        'name': '투수9',
        'team': '팀9',
        'value': '2400',
        'year': '1955'
      },
      {
        'rank': '10',
        'name': '투수10',
        'team': '팀10',
        'value': '2200',
        'year': '1950'
      },
    ],
    '세이브': [
      {
        'rank': '1',
        'name': '투수1',
        'team': '팀1',
        'value': '600',
        'year': '2008'
      },
      {
        'rank': '2',
        'name': '투수2',
        'team': '팀2',
        'value': '580',
        'year': '2005'
      },
      {
        'rank': '3',
        'name': '투수3',
        'team': '팀3',
        'value': '560',
        'year': '2002'
      },
      {
        'rank': '4',
        'name': '투수4',
        'team': '팀4',
        'value': '540',
        'year': '1999'
      },
      {
        'rank': '5',
        'name': '투수5',
        'team': '팀5',
        'value': '520',
        'year': '1996'
      },
      {
        'rank': '6',
        'name': '투수6',
        'team': '팀6',
        'value': '500',
        'year': '1993'
      },
      {
        'rank': '7',
        'name': '투수7',
        'team': '팀7',
        'value': '480',
        'year': '1990'
      },
      {
        'rank': '8',
        'name': '투수8',
        'team': '팀8',
        'value': '460',
        'year': '1987'
      },
      {
        'rank': '9',
        'name': '투수9',
        'team': '팀9',
        'value': '440',
        'year': '1984'
      },
      {
        'rank': '10',
        'name': '투수10',
        'team': '팀10',
        'value': '420',
        'year': '1981'
      },
    ],
    '홀드': [
      {
        'rank': '1',
        'name': '투수1',
        'team': '팀1',
        'value': '500',
        'year': '2010'
      },
      {
        'rank': '2',
        'name': '투수2',
        'team': '팀2',
        'value': '480',
        'year': '2008'
      },
      {
        'rank': '3',
        'name': '투수3',
        'team': '팀3',
        'value': '460',
        'year': '2006'
      },
      {
        'rank': '4',
        'name': '투수4',
        'team': '팀4',
        'value': '440',
        'year': '2004'
      },
      {
        'rank': '5',
        'name': '투수5',
        'team': '팀5',
        'value': '420',
        'year': '2002'
      },
      {
        'rank': '6',
        'name': '투수6',
        'team': '팀6',
        'value': '400',
        'year': '2000'
      },
      {
        'rank': '7',
        'name': '투수7',
        'team': '팀7',
        'value': '380',
        'year': '1998'
      },
      {
        'rank': '8',
        'name': '투수8',
        'team': '팀8',
        'value': '360',
        'year': '1996'
      },
      {
        'rank': '9',
        'name': '투수9',
        'team': '팀9',
        'value': '340',
        'year': '1994'
      },
      {
        'rank': '10',
        'name': '투수10',
        'team': '팀10',
        'value': '320',
        'year': '1992'
      },
    ],
  };

  // 선택된 metric 상태
  // 즉시 초기화하여 LateInitializationError 방지
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
          title: const Text('역대 기록실',
              style: TextStyle(fontWeight: FontWeight.bold)),
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
                  const Text('팀 선택',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                  const SizedBox(height: 8),
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
                            if (selected)
                              selectedTeams.remove(team);
                            else
                              selectedTeams.add(team);
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
    while (res.length < years) res.insert(0, fill);
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
      final idx = e.key;
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
                final idx = e.key;
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
