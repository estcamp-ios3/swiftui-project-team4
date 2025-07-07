//
//  ContentView.swift
//  BaseaballQuiz
//
//  Created by Yesung Yoon on 7/4/25.
//
import SwiftUI

struct ContentView: View {
    @State private var selectedTeam = "LG 트윈스"
    
    let kboTeams = [
        "LG 트윈스", "두산 베어스", "SSG 랜더스", "KT 위즈",
        "삼성 라이온즈", "키움 히어로즈", "KIA 타이거즈", "롯데 자이언츠",
        "NC 다이노스", "한화 이글스"
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                // 팀 선택 메뉴
                Menu {
                    ForEach(kboTeams, id: \.self) { team in
                        Button(team) {
                            selectedTeam = team
                        }
                    }
                } label: {
                    HStack {
                        Text(selectedTeam)
                        Image(systemName: "chevron.up.chevron.down")
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                }
                
                Text("선택된 팀: \(selectedTeam)")
                    .font(.title2)
                
                // 퀴즈 시작 버튼
                NavigationLink(destination: QuizView()) {
                    Text("퀴즈 시작하기")
                        .font(.title2)
                        .padding()
                        
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
