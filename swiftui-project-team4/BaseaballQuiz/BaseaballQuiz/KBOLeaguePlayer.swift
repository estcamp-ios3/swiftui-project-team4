//
//  KBOLeaguePlayer.swift
//  KBOLeagueInfo
//
//  Created by applys on 7/6/25.
//

import Foundation
import SwiftData



struct Record: Codable {
    var playerName: String      // 선수이름
    var position: String        // 포지션
    var gamePlayed: Int         // 경기수
    
    // 타자
    var battingAverage: Double  // 타율
    var homerun: Int            // 홈런
    var atBats: Int             // 타수
    var hit: Int                // 안타
    var runBattedIn: Int        // 타점
    var runScored: Int          // 득점
    var steal: Int              // 도루
    var onBase: Double          // 출루율
    var OPS: Double             // 출루율과 장타율을 합한 지표로, 타자의 공격력을 종합적으로 평가
    
    
    // 투수
    var era: Double             // 평균자책점
    var win: Int                // 승
    var lose: Int               // 패
    var inning: Int             // 이닝
    var strikeouts: Int         // 탈삼진
    var hitsAllowed: Int        // 피안타
    var homeRunsAllowed: Int    // 피홈런
    var walks: Int              // 볼넷
    var WHIP: Double            // (피안타 + 볼넷)/이닝 : 1이하면 우수, 1.2미만이면 에이스, 1.4이상이면 평균이하
    var save: Int               // 세이브
    var shutOut: Int            // 완봉승
    
    var ranking: Int            // 베스트플레이어 랭킹
    
    init(playerName: String = "", position: String = "", gamePlayed: Int = 0, battingAverage: Double = 0.0, homerun: Int = 0, atBats: Int = 0, hit: Int = 0, runBattedIn: Int = 0, runScored: Int = 0, steal: Int = 0, onBase: Double = 0.0, OPS: Double = 0.0, era: Double = 0.0, win: Int = 0, lose: Int = 0, inning: Int = 0, strikeouts: Int = 0, hitsAllowed: Int = 0, homeRunsAllowed: Int = 0, walks: Int = 0, WHIP: Double = 0.0, save: Int = 0, shutOut: Int = 0, ranking: Int = 0) {
            self.playerName = playerName
            self.position = position
            self.gamePlayed = gamePlayed
            self.battingAverage = battingAverage
            self.homerun = homerun
            self.atBats = atBats
            self.hit = hit
            self.runBattedIn = runBattedIn
            self.runScored = runScored
            self.steal = steal
            self.onBase = onBase
            self.OPS = OPS
            self.era = era
            self.win = win
            self.lose = lose
            self.inning = inning
            self.strikeouts = strikeouts
            self.hitsAllowed = hitsAllowed
            self.homeRunsAllowed = homeRunsAllowed
            self.walks = walks
            self.WHIP = WHIP
            self.save = save
            self.shutOut = shutOut
            self.ranking = ranking
        }
}


@Model
class Player {
    var name: String
    var birth: String            // 출생
    var height: Int              // 신장
    var weight: Int              // 몸무게
    var company: String          // 소속사
    var teamName: String         // 소속팀
    var number: Int              // 등번호
    var position: String         // 포지션
    var national_entry: Bool     // 국대경험유무
    var official_page: URL       // 공식홈페이지
    var image: String?              // 선수사진
    
    var team: KBOLeagueTeam?
    var seasonRecord: [Record]?   // 시즌기록
    var totalRecord: Record?      // 통산기록
    
    init(name: String, birth: String, height: Int, weight: Int, company: String, teamName: String, number: Int, position: String, national_entry: Bool, official_page: URL, image: String?, team: KBOLeagueTeam? = nil, seasonRecord: [Record]? = nil, totalRecord: Record? = nil) {
        self.name = name
        self.birth = birth
        self.height = height
        self.weight = weight
        self.company = company
        self.teamName = teamName
        self.number = number
        self.position = position
        self.national_entry = national_entry
        self.official_page = official_page
        self.image = image
        self.seasonRecord = seasonRecord
        self.totalRecord = totalRecord
    }
}
