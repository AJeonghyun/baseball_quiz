import 'package:flutter/material.dart';
import 'kbo_teams.dart';

class TeamSelectPage extends StatefulWidget {
  final int selectedTeam;
  const TeamSelectPage({super.key, required this.selectedTeam});

  @override
  State<TeamSelectPage> createState() => _TeamSelectPageState();
}

class _TeamSelectPageState extends State<TeamSelectPage> {
  late int selectedTeam;

  @override
  void initState() {
    super.initState();
    selectedTeam = widget.selectedTeam;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KBO 팀 선택'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Column(
          children: [
            const Text(
              '응원하는 팀을 선택하세요!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView.builder(
                itemCount: kboTeams.length,
                itemBuilder: (context, idx) {
                  final team = kboTeams[idx];
                  final isSelected = selectedTeam == idx;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: team["color"] as Color,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: isSelected ? 4 : 0,
                      ),
                      onPressed: () {
                        Navigator.pop(context, idx);
                      },
                      child: Text(
                        team["name"] as String,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
