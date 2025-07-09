//
//  QuizView.swift
//  BaseaballQuiz
//
//  Created by Yesung Yoon on 7/4/25.
//

import SwiftUI
import SwiftData

// QuizView: 메인 퀴즈 화면 및 탭바 구현
// 1. TabView 추가하여 퀴즈, 구단정보, 내정보 탭 구현
// 2. 각 탭에 NavigationStack 적용하여 화면 전환 구현
// 3. SwiftData 모델 컨테이너 연결하여 팀 데이터 관리

struct QuizView: View {
    // 상태 관리를 위한 프로퍼티
    @State private var showResult: Bool = false      // 퀴즈 결과 표시 여부
    @State private var isCorrect: Bool = false       // 정답 여부
    @State private var currentQuiz: Quiz?            // 현재 퀴즈 데이터
    @State private var score: Int = 0                // 총 점수
    @State private var correctCount: Int = 0         // 맞춘 문제 수
    @State private var totalQuestionCount: Int = 0   // 전체 문제 수
    
    // 퀴즈 생성기 인스턴스
    private let quizGenerator = QuizGenerator()
    
    var body: some View {
        // TabView를 사용하여 하단 탭바 구현
        TabView {
            // 첫 번째 탭: 퀴즈 풀기
            // NavigationStack으로 감싸서 화면 전환 가능하도록 구현
            NavigationStack {
                ScrollView {
                    VStack(spacing: 20) {
                        // 퀴즈 상단 정보 (맞춘 개수, 점수)
                        if let quiz = currentQuiz {
                            HStack {
                                Text("\(correctCount)" + " / " + "\(totalQuestionCount)")
                                    .font(.largeTitle)
                                    .foregroundColor(.orange)
                                    .bold()
                                    .padding(.leading)
                                    .opacity(0.6)
                                
                                Spacer()
                                Text("점수")
                                    .font(.title)
                                    .foregroundColor(.blue)
                                    .bold()
                                    .opacity(0.6)
                                    .kerning(1)
                                Text(": \(score)")
                                    .font(.largeTitle)
                                    .foregroundColor(.blue)
                                    .bold()
                                    .padding(.trailing)
                                    .opacity(0.6)
                                    .kerning(1)
                            }
                            
                            // 퀴즈 타입과 질문
                            Text("\(quizTypeString(quiz.type))")
                                .font(.title)
                            
                            Text(quiz.question)
                                .font(.title2)
                                .multilineTextAlignment(.center)
                            
                            // 이미지 퀴즈인 경우 이미지 표시
                            if let imageUrl = quiz.imageUrl {
                                AsyncImage(url: imageUrl) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 340, height: 270)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))

                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 340, height: 300)
                                    
                                }
                                .padding(.bottom)
                            }
                            
                            // 객관식 퀴즈 구현
                            if let options = quiz.options {
                                VStack(alignment: .leading, spacing: 10) {
                                    ForEach(options, id: \.self) { option in
                                        Button(action: {
                                            isCorrect = (option == quiz.correctAnswer ? true : false)
                                            showResult = true
                                        }) {
                                            Text(option)
                                                .font(.title3)
                                                .kerning(2)
                                                .multilineTextAlignment(.center)
                                                .padding(.vertical, 8)
                                                .padding(.horizontal, 15)
                                                .frame(minWidth: 80, idealWidth: 100, maxWidth: 210, minHeight: 40, idealHeight: 40, maxHeight: 50, alignment: .center)
                                                .background(Color.blue.opacity(0.1))
                                                .cornerRadius(8)
                                                .multilineTextAlignment(.center)
                                                .frame(maxWidth: .infinity, alignment: .center)


                                        }
                                        .disabled(showResult)
                                    }
                                    // 결과 표시 (정답/오답)
                                    if showResult {
                                        if isCorrect {
                                                Text("✅ 정답입니다!")
                                                    .font(.title)
                                                    .foregroundColor(.green)
                                                    .bold()
                                                    .frame(maxWidth: .infinity, alignment: .center)

                                        } else {
                                                Text("❌ 오답입니다! \n 정답 \(quiz.correctAnswer)")
                                                    .font(.title)
                                                    .foregroundColor(.red)
                                                    .bold()
                                                    .frame(maxWidth: .infinity, alignment: .center)

                                                
                                        }
                                        Text("설명: \(quiz.explanation ?? "설명 없음")")
                                            .font(.title2)
                                            .kerning(2)
                                            .padding(.top)
                                            .frame(maxWidth: .infinity, alignment: .center)
                                    }
                                }
                                // OX 퀴즈 구현
                            } else if quiz.type == .oxQuiz {
                                HStack(spacing: 20) {
                                    Button(action: {
                                        isCorrect = (quiz.correctAnswer == "O" ? true : false)
                                        showResult = true
                                    }) {
                                        Text("O")
                                            .font(.largeTitle)
                                            .frame(width: 80, height: 80)
                                            .background(Color.green.opacity(0.2))
                                            .clipShape(Circle())
                                    }
                                    Button(action: {
                                        isCorrect = (quiz.correctAnswer == "X" ? true : false)
                                        showResult = true
                                    }) {
                                        Text("X")
                                            .font(.largeTitle)
                                            .frame(width: 80, height: 80)
                                            .background(Color.red.opacity(0.2))
                                            .clipShape(Circle())
                                    }
                                }
                                
                                // OX 퀴즈 결과 표시
                                if showResult {
                                    if isCorrect {
                                        Text(" ✅ 정답입니다!")
                                            .font(.title)
                                            .foregroundColor(.green)
                                            .bold()
                                            .multilineTextAlignment(.center)

                                    } else {
                                        Text("❌ 오답입니다! \n 정답은 \(quiz.correctAnswer)")
                                            .font(.title)
                                            .foregroundColor(.red)
                                            .bold()
                                            .multilineTextAlignment(.center)

                                    }
                                    
                                    Text("설명: \(quiz.explanation ?? "설명 없음")")
                                        .font(.title2)
                                        .kerning(2)
                                        .padding(.top)
                                        .multilineTextAlignment(.center)

                                }
                            }
                        } else {
                            Text("퀴즈를 더 이상 로드할 수 없습니다. 돈을 내세요!!")
                        }
                        
                        // 다음 퀴즈 버튼
                        Button("다음 퀴즈", systemImage: "arrowshape.right.circle") {
                            showResult = false
                            if isCorrect {
                                correctCount += 1
                                score += 10
                            }
                            
                            totalQuestionCount += 1
                            currentQuiz = quizGenerator.generateRandomQuiz()
                        }
                        .font(.title)
                        .fontWeight(.medium)
                        .frame(width: 180, height: 40)
                        .padding()
                        .background(.black.opacity(0.65))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                    }
                    .onAppear {
                        currentQuiz = quizGenerator.generateRandomQuiz()
                    }
                }

            }
            .tabItem {
                Label("퀴즈풀기", systemImage: "figure.baseball")
            }
            .tag(0)
            
            // 두 번째 탭: 구단정보
            TeamListView()
//                .modelContainer(for: KBOLeagueTeam.self, inMemory: true)
                .tabItem {
                    Label("구단정보", systemImage: "baseball.fill")
                }
                .tag(1)
            
            // 세 번째 탭: 내 정보
            MyPage()
                .tabItem {
                    Label("내 정보", systemImage: "person.crop.circle.fill")
                }
                .tag(2)
        }
    }
    
    // 퀴즈 타입에 따른 문자열 반환 함수
    private func quizTypeString(_ type: QuizType) -> String {
        switch type {
        case .imageQuiz: return "이미지 퀴즈"
        case .oxQuiz: return "OX 퀴즈"
        case .questionQuiz: return "질문 퀴즈"
        }
    }
}

// SwiftUI 프리뷰
#Preview {
    QuizView()
}


