int whoWins(Map<String, int> teamA, Map<String, int> teamB) {
  int teamAPoints = (teamA['Free throws'] ?? 0) + (teamA['2 pointer'] ?? 0) * 2 + (teamA['3 pointer'] ?? 0) * 3;
  int teamBPoints = (teamB['Free throws'] ?? 0) + (teamB['2 pointer'] ?? 0) * 2 + (teamB['3 pointer'] ?? 0) * 3;

  if (teamAPoints > teamBPoints) {
    return 1;
  } else if (teamAPoints < teamBPoints) {
    return 2;
  } else {
    return 0;
  }
}

