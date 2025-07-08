//
//  QuizView.swift
//  BaseaballQuiz
//
//  Created by Yesung Yoon on 7/4/25.
//

import SwiftUI

struct QuizView: View {
    @State private var selectedAnswer: String? = nil
    @State private var showResult = false
    
    let question = "이 선수는 누구인가요?"
    let choices = ["박지성", "이정후", "류현진", "김연아"]
    let correctAnswer = "이정후"
    
    var body: some View {
            ScrollView {
                VStack(spacing: 10) {
                    
                    Text(question)
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.center)
                    AsyncImage(url: URL(string: "https://file2.nocutnews.co.kr/newsroom/image/2025/04/02/202504021130549262_0.jpg"))
                    
                    ForEach(choices, id: \.self) { choice in
                        Button(action: {
                            selectedAnswer = choice
                            showResult = true
                        }) {
                            Text(choice)
                                .frame(maxWidth: .infinity)
                                .padding()
                            
                        }
                        .disabled(showResult) // 정답 선택 후 버튼 비활성화
                    }
                    
                    if showResult {
                        if selectedAnswer == correctAnswer {
                            Text("✅ 정답입니다!")
                                .foregroundColor(.green)
                                .bold()
                        } else {
                            Text("❌ 오답입니다! 정답은 \(correctAnswer)")
                                .foregroundColor(.red)
                                .bold()
                        }
                       
                    }
                    
                    
                }
                
            }
        }
    }

           

#Preview {
    QuizView()
}
