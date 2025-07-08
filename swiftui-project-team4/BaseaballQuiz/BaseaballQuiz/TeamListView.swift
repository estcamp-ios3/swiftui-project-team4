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
        TabView {
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
            // 메인 탭
            .tabItem { Label("구단정보", systemImage: "baseball.fill") }
            
            // 두번째 탭
            QuizView()
                .tabItem { Label("퀴즈풀기", systemImage: "figure.baseball") }
            
            // 세번째 탭
            MyPage()
                .tabItem { Label("내 정보", systemImage: "person.crop.circle.fill") }
        }
        .task {
            let ryu =
                Player(
                    name: "류현진",
                    birth: "1987-03-25",
                    height: 186,
                    weight: 108,
                    company: "에이스",
                    teamName: "한화 이글스",
                    number: 99,
                    position: "투수",
                    national_entry: true,
                    official_page: URL(string: "https://www.example.com/ryu")!,
                    image: "ryuhyunjin")
            let nos = Player(
                    name: "노시환",
                    birth: "2000-12-03",
                    height: 185,
                    weight: 100,
                    company: "스타",
                    teamName: "한화 이글스",
                    number: 8,
                    position: "3루수",
                    national_entry: true,
                    official_page: URL(string: "https://www.example.com/noh")!,
                    image: "ryuhyunjin")
            
            context.insert(ryu)
            context.insert(nos)
            
            context.insert(KBOLeagueTeam(
                id: 0,
                name: "한화 이글스",
                engName: "Hanwha Eagles",
                location: "대전광역시",
                birthday: "1986년 3월 8일",
                homeStadium: "한화생명 볼파크",
                manager: "김경문",
                officialURL: URL(string: "https://www.hanwhaeagles.co.kr/index.do")!,
                color: "주황, 검정",
                logoImage: "Hanhwa",
                standings: 1,
                standingsDesc: "48승 2무 33패",
                players: [ryu, nos]
            ))

            let fyu =
                Player(
                    name: "류현진",
                    birth: "1987-03-25",
                    height: 186,
                    weight: 108,
                    company: "에이스",
                    teamName: "한화 이글스",
                    number: 99,
                    position: "투수",
                    national_entry: true,
                    official_page: URL(string: "https://www.example.com/ryu")!,
                    image: "ryuhyunjin")
            let mos = Player(
                    name: "노시환",
                    birth: "2000-12-03",
                    height: 185,
                    weight: 100,
                    company: "스타",
                    teamName: "한화 이글스",
                    number: 8,
                    position: "3루수",
                    national_entry: true,
                    official_page: URL(string: "https://www.example.com/noh")!,
                    image: "ryuhyunjin")
            
            context.insert(fyu)
            context.insert(mos)

            context.insert(KBOLeagueTeam(
                id: 1,
                name: "KIA 타이거즈",
                engName: "KIA Tigers",
                location: "광주광역시",
                birthday: "1982년 1월 30일",
                homeStadium: "기아 챔피언스 필드",
                manager: "이범호",
                officialURL: URL(string: "https://www.tigers.co.kr/")!,
                color: "빨강, 검정",
                logoImage: "Kia",
                standings: 2,
                standingsDesc: "45승 3무 36패",
                //players: [fyu, mos]
            ))
            
            
            context.insert(KBOLeagueTeam(
                id: 2,
                name: "LG 트윈스",
                engName: "LG Twins",
                location: "서울",
                birthday: "1990년 3월 15일",
                homeStadium: "잠실 야구장",
                manager: "염경엽",
                officialURL: URL(string: "https://www.lgtwins.com/")!,
                color: "빨강, 검정, 회색",
                logoImage: "LG",
                standings: 3,
                standingsDesc: "45승 2무 37패",
                //players: []
            ))
            context.insert(KBOLeagueTeam(
                id: 3,
                name: "롯데 자이언츠",
                engName: "Lotte Giants",
                location: "부산광역시",
                birthday: "1982년 2월 12일",
                homeStadium: "사직 야구장",
                manager: "김태형",
                officialURL: URL(string: "https://www.giantsclub.com/")!,
                color: "빨강, 파랑, 네이비",
                logoImage: "Lotte",
                standings: 4,
                standingsDesc: "45승 3무 37패",
                //players: []
            ))
            context.insert(KBOLeagueTeam(
                id: 4,
                name: "SSG 랜더스",
                engName: "SSG Landers",
                location: "인천광역시",
                birthday: "2021년 3월 30일",
                homeStadium: "SSG 랜더스 필드",
                manager: "이숭용",
                officialURL: URL(string: "https://www.ssglanders.com/")!,
                color: "주홍, 노랑",
                logoImage: "SSG",
                standings: 5,
                standingsDesc: "42승 3무 38패",
                //players: []
            ))
            context.insert(KBOLeagueTeam(
                id: 5,
                name: "KT 위즈",
                engName: "KT Wiz",
                location: "수원시",
                birthday: "2013년 4월 1일",
                homeStadium: "KT위즈파크",
                manager: "이강철",
                officialURL: URL(string: "https://www.ktwiz.co.kr/")!,
                color: "빨강, 검정",
                logoImage: "KT",
                standings: 6,
                standingsDesc: "43승 3무 39패",
                //players: []
            ))
            context.insert(KBOLeagueTeam(
                id: 6,
                name: "삼성 라이온즈",
                engName: "Samsung Lions",
                location: "대구광역시",
                birthday: "1982년 2월 3일",
                homeStadium: "삼성 라이온즈 파크",
                manager: "박진만",
                officialURL: URL(string: "https://www.samsunglions.com/")!,
                color: "파랑, 회색",
                logoImage: "Samsung",
                standings: 7,
                standingsDesc: "43승 1무 40패",
                //players: []
            ))
            context.insert(KBOLeagueTeam(
                id: 7,
                name: "NC 다이노스",
                engName: "NC Dinos",
                location: "창원시",
                birthday: "2011년 3월 31일",
                homeStadium: "NC파크",
                manager: "이호준",
                officialURL: URL(string: "https://www.ncdinos.com/")!,
                color: "네이비, 골드",
                logoImage: "NC",
                standings: 8,
                standingsDesc: "36승 5무 40패",
                //players: []
            ))
            context.insert(KBOLeagueTeam(
                id: 8,
                name: "두산 베어스",
                engName: "Doosan Bears",
                location: "서울특별시",
                birthday: "1982년 1월 15일",
                homeStadium: "잠실 야구장",
                manager: "조성환",
                officialURL: URL(string: "https://www.doosanbears.com/")!,
                color: "네이비, 빨강",
                logoImage: "Doosan",
                standings: 9,
                standingsDesc: "33승 3무 48패",
                //players: []
            ))
            context.insert(KBOLeagueTeam(
                id: 9,
                name: "키움 히어로즈",
                engName: "Kiwoom Heroes",
                location: "서울특별시",
                birthday: "2008년 3월 24일",
                homeStadium: "고척 스카이돔",
                manager: "홍원기",
                officialURL: URL(string: "https://heroesbaseball.co.kr/")!,
                color: "자주, 빨강",
                logoImage: "Kiwoom",
                standings: 10,
                standingsDesc: "26승 3무 59패",
                //players: []
            ))
        }
    }
}

#Preview {
    TeamListView()
//        .modelContainer(for: KBOLeagueTeam.self, inMemory: true)
        .modelContainer(for: [KBOLeagueTeam.self, Player.self], inMemory: true)
}
