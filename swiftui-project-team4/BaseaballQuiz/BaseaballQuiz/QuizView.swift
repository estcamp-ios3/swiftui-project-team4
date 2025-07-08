//
//  QuizView.swift
//  BaseaballQuiz
//
//  Created by Yesung Yoon on 7/4/25.
//

import SwiftUI

struct QuizView: View {
    @State private var showResult: Bool = false
    @State private var isCorrect: Bool = false
    @State private var currentQuiz: Quiz?
    @State private var score: Int = 0
    @State private var correctCount: Int = 0
    @State private var totalQuestionCount: Int = 0
    
    private let quizGenerator = QuizGenerator()
    
    var body: some View {
            ScrollView {
                VStack(spacing: 20) {
                    if let quiz = currentQuiz {
                        HStack {
                            Text("\(correctCount)" + " / " + "\(totalQuestionCount)")
                                    .font(.title)
                                    .foregroundColor(.orange)
                                    .bold()
                                    .padding(.leading)
                                    .opacity(0.6)
                            Spacer()
                            Text("점수: \(score)")
                                .font(.title)
                                .foregroundColor(.blue)
                                .bold()
                                .padding(.trailing)
                                .opacity(0.6)
                        }
                        
                        Text("\(quizTypeString(quiz.type))")
                            .font(.title)
                            //.padding()
                                                
                        Text(quiz.question)
                            .font(.title2)
                            .multilineTextAlignment(.center)
                        
                        if let imageUrl = quiz.imageUrl {
                            AsyncImage(url: imageUrl) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 380, height: 200)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 380, height: 350)
                            }
                            .padding(.bottom)
                        }
                        
                        if let options = quiz.options {
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(options, id: \.self) { option in
                                    Button(action: {
                                        isCorrect = (option == quiz.correctAnswer ? true : false)
                                        // 디버깅용
                                        //print("선택: \(option), 정답: \(quiz.correctAnswer)")
                                        showResult = true
                                    }) {
                                        Text(option)
                                            .font(.title3)
                                            .padding(.vertical, 8)
                                            .padding(.horizontal, 15)
                                            .frame(minWidth: 80, idealWidth: 100, maxWidth: 210, minHeight: 40, idealHeight: 40, maxHeight: 50, alignment: .center)
                                            .background(Color.blue.opacity(0.1))
                                            .cornerRadius(8)
                                    }
                                    .disabled(showResult)
                                }
                                if showResult {
                                    if isCorrect {
                                        Text("✅ 정답입니다!")
                                            .font(.title)
                                            .foregroundColor(.green)
                                            .bold()
                                    } else {
                                        Text("❌ 오답입니다! 정답은 \(quiz.correctAnswer)")
                                            .font(.title)
                                            .foregroundColor(.red)
                                            .bold()
                                    }
                                    
                                    Text("설명: \(quiz.explanation ?? "설명 없음")")
                                        .font(.title2)
                                        .padding(.top)
                                }
                            }
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
                            if showResult {
                                if isCorrect {
                                    Text("✅ 정답입니다!")
                                        .font(.title)
                                        .foregroundColor(.green)
                                        .bold()
                                } else {
                                    Text("❌ 오답입니다! 정답은 \(quiz.correctAnswer)")
                                        .font(.title)
                                        .foregroundColor(.red)
                                        .bold()
                                }
                                
                                Text("설명: \(quiz.explanation ?? "설명 없음")")
                                    .font(.title2)
                                    .padding(.top)
                            }
                        }
                    } else {
                        Text("퀴즈를 더 이상 로드할 수 없습니다. 돈을 내세요!!")
                    }
                    
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
                //.animation(.easeInOut, value: isCorrect)
            }

    }
    
    private func quizTypeString(_ type: QuizType) -> String {
        switch type {
        case .imageQuiz: return "이미지 퀴즈"
        case .oxQuiz: return "OX 퀴즈"
        case .questionQuiz: return "질문 퀴즈"
        }
    }
}

#Preview {
    QuizView()
}


