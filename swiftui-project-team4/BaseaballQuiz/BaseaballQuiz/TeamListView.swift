//
//  TeamListView.swift
//  KBOLeagueInfo
//
//  Created by applys on 7/6/25.
//

import SwiftUI
import SwiftData


struct TeamListView: View {
    @Query(sort: \KBOLeagueTeam.standings) public var teams: [KBOLeagueTeam]
    @Query(sort: \Player.name) var players: [Player]
    
    @Environment(\.modelContext) private var context
    //@State var teamID: Int = 0
    
    // 구단 리스트
    var body: some View {
        // 첫 번째 탭: 구단정보
        NavigationStack {
            VStack {
                List {
                    ForEach(teams) { team in
                        NavigationLink(destination: TeamDetailView(teamID: team.id), label: {
                            Image("\(team.logoImage)")
                                .resizable()
                                .frame(width: 70, height: 50)
                            VStack(alignment: .leading) {
                                Text(team.name)
                                    .font(.headline)
                                Text("\(team.standings)위   \(team.standingsDesc)")
                            }
                        })
                        .frame(width: 300, height: 40)
                    }
                }
                .navigationBarTitle("KBO League", displayMode: .automatic)
            }
        }

    }
}

#Preview {
    TeamListView()
    //        .modelContainer(for: KBOLeagueTeam.self, inMemory: true)
        .modelContainer(for: [KBOLeagueTeam.self, Player.self], inMemory: true)
}
