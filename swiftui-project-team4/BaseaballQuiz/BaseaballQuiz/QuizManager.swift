import SwiftUI
import Foundation

// QuizManager: 퀴즈 정보와 내 정보 간 데이터 공유를 위한 Observable 클래스
// 퀴즈 결과를 실시간으로 MyPage에 반영하고, 야구 등급과 기록을 관리합니다.
@Observable
class QuizManager {
    // 퀴즈 통계 정보
    var totalScore: Int = 0                    // 총 점수
    var correctAnswers: Int = 0                // 맞춘 문제 수
    var totalQuestions: Int = 0                // 전체 문제 수
    var todayQuestions: Int = 0                // 오늘 푼 문제 수
    var dailyGoal: Int = 20                    // 일일 목표 문제 수
    
    // 야구 등급 계산 (총 점수 기준)
    var baseballRank: String {
        switch totalScore {
        case 0...99: return "신인"
        case 100...199: return "주전"
        case 200...299: return "에이스"
        case 300...499: return "올스타"
        case 500...: return "레전드"
        default: return "신인"
        }
    }
    
    // 정답률 계산
    var accuracyRate: Double {
        if totalQuestions == 0 { return 0.0 }
        return Double(correctAnswers) / Double(totalQuestions) * 100
    }
    
    // 오늘의 진행률 (일일 목표 대비)
    var todayProgress: Double {
        return min(Double(todayQuestions) / Double(dailyGoal), 1.0)
    }
    
    // 퀴즈 결과 업데이트 함수
    func updateQuizResult(isCorrect: Bool) {
        totalQuestions += 1
        todayQuestions += 1
        
        if isCorrect {
            correctAnswers += 1
            totalScore += 10 // 정답 시 10점 추가
        }
    }
    
    // 일일 데이터 초기화 (새로운 날이 되었을 때)
    func resetDailyData() {
        todayQuestions = 0
    }
    
    // 전체 데이터 초기화
    func resetAllData() {
        totalScore = 0
        correctAnswers = 0
        totalQuestions = 0
        todayQuestions = 0
    }
} 

