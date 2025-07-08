//
//  QuizGenerator.swift
//  BaseaballQuiz
//
//  Created by applys on 7/8/25.
//

import Foundation
import SwiftData


// 퀴즈 유형 열거형
enum QuizType: CaseIterable {
    case imageQuiz // 이미지 퀴즈
    case oxQuiz    // OX 퀴즈
    case questionQuiz // 질문 퀴즈 (4지선다형)
}

// 퀴즈 데이터를 담을 구조체
struct Quiz: Identifiable {
    let id = UUID() // 각 퀴즈를 고유하게 식별하기 위한 ID
    let type: QuizType // 퀴즈 유형
    let question: String // 퀴즈 질문
    let imageUrl: URL? // 이미지 퀴즈일 경우 이미지 URL (옵션)
    let options: [String]? // 4지선다형 퀴즈일 경우 선택지 (옵션)
    let correctAnswer: String // 정답
    let explanation: String? // 정답에 대한 추가 설명 (옵션)
}


class QuizGenerator {
    private let allQuizzes: [Quiz] = [
        // 이미지 퀴즈
        Quiz(type: .imageQuiz,
             question: "이 선수는 누구일까요?",
             imageUrl: URL(string: "https://dimg.donga.com/wps/NEWS/IMAGE/2024/09/06/126884040.2.jpg")!,
             options: ["김광현", "류현진", "양의지", "이정후"],
             correctAnswer: "류현진",
             explanation: "한국 야구의 괴물 투수, 류현진 선수입니다."),
        Quiz(type: .imageQuiz,
             question: "다음은 어떤 구단의 로고일까요?",
             imageUrl: URL(string: "https://search.pstatic.net/common?type=o&size=150x112&expire=1&refresh=true&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fkeypage%2Fimage%2Fdss%2F146%2F48%2F40%2F09%2F146_2484009_team_image_url_1489031317245.jpg")!,
             options: ["두산 베어스", "LG 트윈스", "SSG 랜더스", "NC 다이노스"],
             correctAnswer: "LG 트윈스",
             explanation: "서울을 연고로 하는 LG 트윈스 로고입니다."),

        // OX 퀴즈
        Quiz(type: .oxQuiz,
             question: "KBO 리그는 1982년에 출범했다. (O/X)",
             imageUrl: nil,
             options: nil,
             correctAnswer: "O",
             explanation: "KBO 리그는 1982년 6개 구단으로 시작했습니다."),
        Quiz(type: .oxQuiz,
             question: "롯데 자이언츠의 홈구장은 잠실 야구장이다. (O/X)",
             imageUrl: nil,
             options: nil,
             correctAnswer: "X",
             explanation: "롯데 자이언츠의 홈구장은 부산 사직 야구장입니다."),
        Quiz(type: .oxQuiz,
             question: "삼성 라이온즈는 KBO 리그 최다 우승팀이다. (O/X)",
             imageUrl: nil,
             options: nil,
             correctAnswer: "X",
             explanation: "KIA 타이거즈가 11회 우승으로 최다 우승팀입니다."),

        // 질문 퀴즈 (선다형)
        Quiz(type: .questionQuiz,
             question: "다음 중 KBO 리그에 속하지 않는 구단은?",
             imageUrl: nil,
             options: ["키움 히어로즈", "kt wiz", "고양 히어로즈", "한화 이글스"],
             correctAnswer: "고양 히어로즈",
             explanation: "고양 히어로즈는 키움 히어로즈 퓨처스 팀입니다."),
        Quiz(type: .questionQuiz,
             question: "2024년 정규리그 우승팀은 어디일까요?",
             imageUrl: nil,
             options: ["LG 트윈스", "KT 위즈", "SSG 랜더스", "두산 베어스"],
             correctAnswer: "LG 트윈스", // 2024년 우승팀이 LG 트윈스라고 가정
             explanation: "2024년 KBO 정규리그 우승팀은 LG 트윈스입니다."),
        Quiz(type: .questionQuiz,
             question: "다음 중 '최정' 선수의 소속팀은?",
             imageUrl: nil,
             options: ["두산 베어스", "SSG 랜더스", "NC 다이노스", "삼성 라이온즈"],
             correctAnswer: "SSG 랜더스",
             explanation: "KBO 홈런왕 최정 선수는 SSG 랜더스 소속입니다."),
        Quiz(type: .questionQuiz,
             question: "다음 중 '엘리저 에르난데스' 선수의 소속팀은?",
             imageUrl: nil,
             options: ["두산 베어스", "SSG 랜더스", "LG 트윈스"],
             correctAnswer: "LG 트윈스",
             explanation: "2024년 6월까지 LA 다저스 소속이었던 엘리저 에르난데스 선수는 LG 트윈스 소속입니다.")

    ]

    func generateRandomQuiz() -> Quiz? {
        guard let randomQuizType = QuizType.allCases.randomElement() else {
            return nil
        }

        let quizzesOfType = allQuizzes.filter { $0.type == randomQuizType }

        return quizzesOfType.randomElement()
    }
}

