//
//  TeamDetailView.swift
//  KBOLeagueInfo
//
//  Created by applys on 7/6/25.
//

import SwiftUI
import SwiftData


struct TeamDetailView: View {
    @Query(sort: \KBOLeagueTeam.id) var selectedTeamQuery: [KBOLeagueTeam]
    @Query(sort: \Player.name) var players: [Player]
    @Environment(\.modelContext) private var context
//    @State private var teamPlayers: [Player]
//    @State private var selectedTeamName: String
    
    var teamID: Int
    var selectedTeam: KBOLeagueTeam? {
        selectedTeamQuery.first(where: { $0.id == teamID })
    }
    
    var teamName: String {
        selectedTeam?.name ?? "Not Found"
    }
    
    var body: some View {
        let teamPlayers = selectedTeam?.players ?? []

        VStack(alignment: .leading, spacing: 10) {
            Text("   \(selectedTeam?.name ?? "Not Found")")
                .font(.title)
                .foregroundColor(.accentColor)
                .bold()
            
            List {
                Section {
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(teamPlayers, id: \.id) { player in
                                NavigationLink(destination: PlayerDetailView()) {
                                    VStack {
                                        Image("\(player.image ?? "이미지 없음")")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 120, height: 120)
                                        
                                        Text(player.name)
                                            .font(.headline)
                                            .foregroundColor(.black)
                                            .lineLimit(1)
                                    }
//                                    AsyncImage(url: player.image) { image in
//                                        image
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fit)
//                                            .frame(width: 200, height: 200)
//                                    } placeholder: {
//                                        ProgressView()
//                                    }
                                }
                            }
                        }
                        .frame(width: 300, height: 150)
                    }
                    .padding()
                } header: {
                    Text("대표선수")
                        .bold()
                        .font(.title2)
                        .foregroundStyle(.black)
                }
                
                Section {
                    Grid {
                        GridRow {
                            Image("\(selectedTeam?.logoImage ?? "logoImage 없음")")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 110, height: 110)
                            
                            
                            VStack(alignment: .leading) {
                                Text("연고지: \(selectedTeam?.location ?? "Not Found")")
                                Text("홈구장: \(selectedTeam?.homeStadium ?? "Not Found")")
                                Text("창단일: \(selectedTeam?.birthday ?? "Not Found")")
                                Text("감독: \(selectedTeam?.manager ?? "Not Found")")
                                                            }
                        }
                    }
                    Text("영문 표기: \(selectedTeam?.engName ?? "Not Found")")
                        .bold()

                    Text("현재 순위: \(selectedTeam?.standings ?? 0)위" + "  /  \(selectedTeam?.standingsDesc ?? "Not Found")")
                        .bold()
                        .foregroundColor(.red)

                    Link("🔗 \(selectedTeam?.name ?? "Not Found") 구단 홈페이지", destination: (selectedTeam?.officialURL ?? URL(string: "https://allstar.koreabaseball.com/"))!)
                        .bold()
                    
                } header: {
                    Text("구단정보")
                        .bold()
                        .font(.title2)
                        .foregroundStyle(.black)
                }
            }
            
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
    }
}

#Preview {
//    @Previewable @State var selectedPlayer: Player = Player(
//        name: "류현진",
//        birth: "1987-03-25",
//        height: 186,
//        weight: 108,
//        company: "에이스",
//        teamName: "한화 이글스",
//        number: 99,
//        position: "투수",
//        national_entry: true,
//        official_page: URL(string: "https://www.example.com/ryu")!,)
//    
    
    
    @Previewable @State var selectedTeam: KBOLeagueTeam = KBOLeagueTeam(
        id: 0,
        name: "한화 이글스",
        engName: "Hanhwa Eagles",
        location: "대전광역시",
        birthday: "2008년 3월 24일",
        homeStadium: "한화생명 이글스파크",
        manager: "김경문",
        officialURL: URL(string: "https://www.hanwhaeagles.co.kr")!,
        color: "주황, 검정",
        logoImage: "Hanhwa",
        standings: 7,
        standingsDesc: "30승 1무 40패",
        //players: []
    )
    
    TeamDetailView(teamID: $selectedTeam.id)
//    TeamDetailView()
        .modelContainer(for: [KBOLeagueTeam.self, Player.self], inMemory: true)
}
