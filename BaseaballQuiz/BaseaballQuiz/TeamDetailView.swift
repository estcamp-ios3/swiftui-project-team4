//
//  TeamDetailView.swift
//  KBOLeagueInfo
//
//  Created by applys on 7/6/25.
//

import SwiftUI
import SwiftData


struct TeamDetailView: View {
    @Query(sort: \Player.name) var players: [Player]
    @Environment(\.modelContext) private var context
//    @Binding var teamID: Int
    
    @Query(sort: \KBOLeagueTeam.id) var selectedTeamQuery: [KBOLeagueTeam]
    
//    init(teamID: Binding<Int>) {
//        self._teamID = teamID
//        self._selectedTeamQuery = Query(filter: #Predicate<KBOLeagueTeam> { team in
//            team.id == teamID.wrappedValue
//        })
//    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
//            Text("\(selectedTeamQuery[teamID].name) 팀 상세 정보")
//                .font(.largeTitle)
//                .foregroundColor(.purple)
//                .bold()
//            
//            Text("영문명: \(selectedTeamQuery[teamID].engName)")
//            Text("연고지: \(selectedTeamQuery[teamID].location)")
//            Text("매니저: \(selectedTeamQuery[teamID].manager)")
//            Text("현재 순위: \(selectedTeamQuery[teamID].standings)위 (\(selectedTeamQuery[teamID].standingsDesc))")
//            
//            // team.players가 논-옵셔널 [Player] 타입인 경우:
//            if !selectedTeamQuery[teamID].players.isEmpty {
//                Divider()
//                Text("주요 선수:")
//                    .font(.headline)
//                // team.players는 이미 배열이므로 직접 ForEach에 사용
//                ForEach(selectedTeamQuery[teamID].players) { player in
//                    Text("- \(player.name) (\(player.position))")
//                }
//            } else {
//                Text("소속 선수 정보 없음.")
//            }
            
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var selectedTeam: KBOLeagueTeam = KBOLeagueTeam(
        id: 0,
        name: "한화 이글스",
        engName: "Hanhwa Eagles",
        location: "대전광역시",
        birthday: Date(),
        homeStadium: "한화생명 이글스파크",
        manager: "김경문",
        officialURL: URL(string: "https://www.hanwhaeagles.co.kr")!,
        color: "주황, 검정",
        logoImage: "Hanhwa",
        standings: 7,
        standingsDesc: "30승 1무 40패",
        players: []
    )
//    TeamDetailView(teamID: $selectedTeam.id)
    TeamDetailView()
        .modelContainer(for: [KBOLeagueTeam.self, Player.self], inMemory: true)
}
