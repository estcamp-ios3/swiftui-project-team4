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
             explanation: "한국 야구의 괴물 투수, \n 류현진 선수입니다."),
        Quiz(type: .imageQuiz,
             question: "다음은 어떤 구단의 로고일까요?",
             imageUrl: URL(string: "https://upload.wikimedia.org/wikipedia/ko/8/8a/LG_%ED%8A%B8%EC%9C%88%EC%8A%A4_%EB%A1%9C%EA%B3%A0.png")!,
             options: ["두산 베어스", "LG 트윈스", "SSG 랜더스", "NC 다이노스"],
             correctAnswer: "LG 트윈스",
             explanation: "서울을 연고로 하는 \n LG 트윈스 로고입니다."),
        Quiz(type: .imageQuiz,
             question: "이 야구장은 서울의 어느 구단이 함께 홈으로 사용하는 곳일까요?",
             imageUrl: URL(string: "https://img.sbs.co.kr/newimg/news/20230918/201834693.jpg")!,
             options: ["두산 & 키움", "LG & 키움", "두산 & LG", "SSG & KT"],
             correctAnswer: "두산 & LG",
             explanation: "서울을 연고로 하는 두 팀인 \n 두산베어스와 LG트윈스입니다."),
        Quiz(type: .imageQuiz,
             question: "아래 이미지에서 시구를 하는 사람은 누구일까요?",
             imageUrl: URL(string: "https://spnimage.edaily.co.kr/images/photo/files/NP/S/2016/04/PS16041000071.jpg")!,
             options: ["김범수", "하하", "노홍철", "유재석"],
             correctAnswer: "하하",
             explanation: "이미지 속 시구자는 방송인 '하하' 입니다."),
        Quiz(type: .imageQuiz,
             question: "두산:LG전 일명 '레깅스 시구'로 일약 스타덤에 오른 인물은 누구일까요?",
             imageUrl: URL(string: "https://dimg.donga.com/wps/SPORTS/IMAGE/2013/08/29/57313806.2.jpg")!,
             options: ["에스파", "제시", "카리나", "클라라"],
             correctAnswer: "클라라",
             explanation: "이미지 속 시구자는 배우 '클라라'로 이 시구로 인해 엄청난 바이럴을 일으키며 스타덤에 올랐습니다."),
        Quiz(type: .imageQuiz,
             question: "사진 속 팬들이 입고 있는 '유광 점퍼'는 어떤 구단의 상징적인 응원 아이템일까요?",
             imageUrl: URL(string: "https://images.khan.co.kr/article/2016/09/21/l_2016092102000777300184231.jpg")!,
             options: ["LG 트윈스", "롯데 자이언츠", "한화 이글스", "KIA 타이거즈"],
             correctAnswer: "LG 트윈스",
             explanation: "서울을 연고로 하는 \n LG 트윈스 팬들의 응원 아이템입니다."),
        Quiz(type: .imageQuiz,
             question: "아래 이미지속의 선수가 마지막으로 소속했던 KBO리그 팀은?",
             imageUrl: URL(string: "https://www.chosun.com/resizer/v2/SYJ4BA7HJBOZHNUNWNOAQCXV2E.jpg?auth=c1e637c5d2d45105039118da38746def18d8963c3eb7bfe959b2a6ae8b8db4d1&width=616")!,
             options: ["두산 베어스", "LG 트윈스", "SSG 랜더스", "키움 히어로즈"],
             correctAnswer: "키움 히어로즈",
             explanation: "사진 속 선수는 이정후 선수이며, 현재 MLB 리그 샌프란시스코의 유격수로 활약하고 있습니다. 이정후 선수가 마지막으로 속했던 KBO리그 팀은 키움 히어로즈입니다."),

        // OX 퀴즈
        Quiz(type: .oxQuiz,
             question: "KBO 리그는 \n 1982년에 출범했다. (O/X)",
             imageUrl: nil,
             options: nil,
             correctAnswer: "O",
             explanation: "KBO 리그는 1982년 \n 6개 구단으로 시작했습니다."),
        Quiz(type: .oxQuiz,
             question: "롯데 자이언츠의 홈구장은 \n 잠실 야구장이다. (O/X)",
             imageUrl: nil,
             options: nil,
             correctAnswer: "X",
             explanation: "롯데 자이언츠의 홈구장은 \n 부산 사직 야구장입니다."),
        Quiz(type: .oxQuiz,
             question: "삼성 라이온즈는 \n KBO 리그 최다 우승팀이다. (O/X)",
             imageUrl: nil,
             options: nil,
             correctAnswer: "X",
             explanation: "KIA 타이거즈가 \n 11회 우승으로 최다 우승팀입니다."),
        Quiz(type: .oxQuiz,
             question: "잠실에 새로 들어설 야구장은 \n3만3천 석 규모로, \n돔구장이 아닌 개방형 구장으로 \n지어질 예정이다. (O/X)",
             imageUrl: nil,
             options: nil,
             correctAnswer: "O",
             explanation: "3만3천석 규모의 개방형 구장으로 지어질 \n예정이며 새로운 잠실 야구장은 \n2029년 완공이 목표인 것으로 \n알려져 있다."),
        Quiz(type: .oxQuiz,
             question: "삼성 라이온즈는 \n KBO 리그 최다 우승팀이다. (O/X)",
             imageUrl: nil,
             options: nil,
             correctAnswer: "X",
             explanation: "KIA 타이거즈가 \n 11회 우승으로 최다 우승팀입니다."),
        
        // 질문 퀴즈 (선다형)
        Quiz(type: .questionQuiz,
             question: "다음 중 KBO 리그에 속하지 않는 \n 구단은?",
             imageUrl: nil,
             options: ["키움 히어로즈", "kt wiz", "고양 히어로즈", "한화 이글스"],
             correctAnswer: "고양 히어로즈",
             explanation: "고양 히어로즈는 \n 키움 히어로즈 퓨처스 팀입니다."),
        Quiz(type: .questionQuiz,
             question: "2024년 정규리그 우승팀은 \n 어디일까요?",
             imageUrl: nil,
             options: ["LG 트윈스", "KT 위즈", "SSG 랜더스", "두산 베어스"],
             correctAnswer: "LG 트윈스", // 2024년 우승팀이 LG 트윈스라고 가정
             explanation: "2024년 KBO 정규리그 우승팀은 \n LG 트윈스입니다."),
        Quiz(type: .questionQuiz,
             question: "다음 중 '최정' 선수의 \n 소속팀은?",
             imageUrl: nil,
             options: ["두산 베어스", "SSG 랜더스", "NC 다이노스", "삼성 라이온즈"],
             correctAnswer: "SSG 랜더스",
             explanation: "KBO 홈런왕 최정 선수는 \n SSG 랜더스 소속입니다."),
        Quiz(type: .questionQuiz,
             question: "다음 중 '엘리저 에르난데스'\n 선수의 소속팀은?",
             imageUrl: nil,
             options: ["두산 베어스", "SSG 랜더스", "LG 트윈스"],
             correctAnswer: "LG 트윈스",
             explanation: "2024년 6월까지 \n LA 다저스 소속이었던 \n 엘리저 에르난데스 선수는 LG 트윈스 소속입니다.")

    ]

    func generateRandomQuiz() -> Quiz? {
        guard let randomQuizType = QuizType.allCases.randomElement() else {
            return nil
        }

        let quizzesOfType = allQuizzes.filter { $0.type == randomQuizType }

        return quizzesOfType.randomElement()
    }
}

