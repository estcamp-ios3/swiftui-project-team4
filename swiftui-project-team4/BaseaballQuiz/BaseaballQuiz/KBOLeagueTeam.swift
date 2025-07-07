//
//  KBOLeagueTeam.swift
//  KBOLeagueInfo
//
//  Created by applys on 7/6/25.
//

import Foundation
import SwiftData


@Model
class KBOLeagueTeam {
    @Attribute(.unique) var id: Int
    public var name: String             // 구단이름 "한화 이글스"
    public var engName: String          // 구단이름 영문명 "Hanhwa Eagles"
    public var location: String         // 연고지 "대전"
    public var birthday: Date           // 창단일 "
    public var homeStadium: String      // 홈구장
    public var manager: String          // 감독
    public var officialURL: URL         // 구단공식 홈페이지 링크
    public var color: String            // 구단색
    public var logoImage: String        // 구단로고이미지
    
    public var standings: Int           // 구단현재순위 (업데이트 가능)
    public var standingsDesc: String    // "48승 2무 33패" (25년 7/7일 현재)
    
    @Relationship(inverse: \Player.team)
    public var players: [Player]        // 선수정보
    
    
    init(id: Int, name: String, engName: String, location: String, birthday: Date, homeStadium: String, manager: String, officialURL: URL, color: String, logoImage: String, standings: Int, standingsDesc: String, players: [Player]) {
        self.id = id
        self.name = name
        self.engName = engName
        self.location = location
        self.birthday = birthday
        self.homeStadium = homeStadium
        self.manager = manager
        self.officialURL = officialURL
        self.color = color
        self.logoImage = logoImage
        self.standings = standings
        self.standingsDesc = standingsDesc
        self.players = players
    }
}
