//
//  QuizView.swift
//  BaseaballQuiz
//
//  Created by Yesung Yoon on 7/4/25.
//

import SwiftUI
import SwiftData
import Observation

// QuizView: 메인 퀴즈 화면 및 탭바 구현
// 1. TabView 추가하여 퀴즈, 구단정보, 내정보 탭 구현
// 2. 각 탭에 NavigationStack 적용하여 화면 전환 구현
// 3. SwiftData 모델 컨테이너 연결하여 팀 데이터 관리

struct QuizView: View {
    // Observable QuizManager 인스턴스 - 퀴즈 정보와 내 정보 간 데이터 공유
    @State private var quizManager = QuizManager()
    
    @State private var showResult: Bool = false
    // 퀴즈 결과 표시 여부
    @State private var isCorrect: Bool = false
    // 정답 여부
    @State private var currentQuiz: Quiz?
    // 현재 퀴즈 데이터
    
    @State private var isVisible: Bool = true
    @State private var isBlinkingActive: Bool = false
    
    let timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    
    private let quizGenerator = QuizGenerator()
    
    var body: some View {
        TabView {
            // 첫 번째 탭: 퀴즈 풀기
            NavigationStack {
                ScrollView {
                    VStack(spacing: 20) {
                        if let quiz = currentQuiz {
                            HStack {
                                Text("\(quizManager.correctAnswers)" + " / " + "\(quizManager.totalQuestions)")
                                    .font(.title3)
                                    .foregroundColor(.primary)
                                    .bold()
                                    .padding(.leading)
                                
                                Spacer()
                                Text("     \(quizTypeString(quiz.type))")
                                    .font(.system(size: 25))
                                    .fontWeight(.medium)
                                    .opacity(isBlinkingActive ? (isVisible ? 1.0 : 0.0) : 0.7)
                                    .animation(.easeIn(duration: 0.2), value: isVisible)
                                
                                Button("", systemImage: "arrowshape.right.fill") {
                                    // QuizManager를 통해 퀴즈 결과 업데이트
                                    quizManager.updateQuizResult(isCorrect: isCorrect)
                                    
                                    showResult = false
                                    
                                    if isCorrect {
                                        startBlinkingForDuration(duration: 2.0)
                                    }
                                    isCorrect = false
                                    currentQuiz = quizGenerator.generateRandomQuiz()
                                }
                                .font(.title)
                                .fontWeight(.medium)
                                .frame(width: 10, height: 10)
                                .padding()
                                .foregroundColor(.black)
                                .opacity(0.7)
                                .cornerRadius(20)
                                
                                Spacer()
                                Text("\(quizManager.totalScore)")
                                    .font(.largeTitle)
                                    .foregroundColor(.primary)
                                    .bold()
                                    .opacity(isBlinkingActive ? (isVisible ? 1.0 : 0.0) : 1.0)
                                    .animation(.easeIn(duration: 0.2), value: isVisible)
                                    .padding(.trailing)
                            }
                            .onReceive(timer) { _ in
                                if isBlinkingActive {
                                    isVisible.toggle()
                                }
                            }
                            .padding(15)
                            
                            Text(quiz.question)
                                .font(.title)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: 360, alignment: .center)
                            
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
                                            Spacer()
                                            Text(option)
                                                .font(.title2)
                                                .fontWeight(.semibold)
                                                .foregroundColor(showResult ? .gray : .primary)
                                                .kerning(1)
                                                .multilineTextAlignment(.center)
                                                .padding(.vertical, 8)
                                                .padding(.horizontal, 15)
                                                .frame(minWidth: 80, idealWidth: 100, maxWidth: 210, minHeight: 45, idealHeight: 45, maxHeight: 50, alignment: .center)
                                                .background(showResult ? Color.gray.opacity(0.3) : Color.blue.opacity(0.1))
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
                                VStack {
                                    HStack(spacing: 20) {
                                        Button(action: {
                                            isCorrect = (quiz.correctAnswer == "O" ? true : false)
                                            showResult = true
                                        }) {
                                            Text("O")
                                                .font(.system(size: 60))
                                                .fontWeight(.bold)
                                                .frame(width: 80, height: 80)
                                                .foregroundColor(showResult ? .gray : .green)
                                                .background(showResult ? Color.gray.opacity(0.5) : Color.gray.opacity(0.2))
                                                .clipShape(Circle())
                                        }
                                        Button(action: {
                                            isCorrect = (quiz.correctAnswer == "X" ? true : false)
                                            showResult = true
                                        }) {
                                            Text("X")
                                                .font(.system(size: 57))
                                                .fontWeight(.bold)
                                                .frame(width: 80, height: 80)
                                                .foregroundColor(showResult ? .gray : .red)
                                                .background(showResult ? Color.gray.opacity(0.5) : Color.gray.opacity(0.2))
                                                .clipShape(Circle())
                                        }
                                    }
                                    .padding(20)
                                    .disabled(showResult)
                                }
                                .padding(.top)
                                
                                
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
                                        .frame(maxWidth: 300, alignment: .center)
                                        .padding(.top)
                                        .multilineTextAlignment(.center)
                                }
                            }
                        } else {
                            Text("퀴즈를 더 이상 로드할 수 없습니다. 돈을 내세요!!")
                        }
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
            
            TeamListView()
                .tabItem {
                    Label("구단정보", systemImage: "baseball.fill")
                }
                .tag(1)
            
            MyPage(quizManager: quizManager)
                .tabItem {
                    Label("내 정보", systemImage: "person.crop.circle.fill")
                }
                .tag(2)
        }
    }
    
    private func quizTypeString(_ type: QuizType) -> String {
        switch type {
        case .imageQuiz: return "이미지 퀴즈"
        case .oxQuiz: return "OX 퀴즈"
        case .questionQuiz: return "질문 퀴즈"
        }
    }
    
    // 지정된 시간(duration)동안 깜박임을 시작하는 함수
    private func startBlinkingForDuration(duration: TimeInterval) {
        // 이미 깜박이는 중이라면 다시 시작하지 않음
        guard !isBlinkingActive else { return }
        
        isBlinkingActive = true
        isVisible = true
        
        // 지정된 시간(duration) 후에 깜박임 중지
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            isBlinkingActive = false
            isVisible = true // 깜박임이 끝난 후에는 항상 보이게..
        }
    }
}


// SwiftUI 프리뷰
#Preview {
    QuizView()
}


