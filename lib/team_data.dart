import 'package:flutter/material.dart';

const List<int> years = [
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

const Map<String, List<int>> teamRanks = {
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

const List<Color> teamColors = [
  Color(0xFFC30452),
  Color(0xFFFC4E00),
  Color(0xFFce0e2d),
  Color(0xFF074CA1),
  Color(0xFF041E42),
  Color(0xFFEA0029),
  Color(0xFF1A1748),
  Color(0xFF000000),
  Color(0xFF315288),
  Color(0xFF570514),
];

// 초기 선택팀 (Stateless 파일이므로 mutable로 사용하려면 main에서 Set.from(...)으로 복사)
const List<String> initialSelectedTeams = ['LG'];
