import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @State private var isLoggedIn = false
    @State private var showQuiz = false
    @State private var rotation: Double = 0  // 야구공 회전
    @State private var swingAngle: Double = 0  // 타자 회전
    
    // 배경 그라데이션 색상 정의
    private let backgroundGradient = LinearGradient(
        colors: [Color(red: 0.1, green: 0.1, blue: 0.2), Color(red: 0.2, green: 0.2, blue: 0.3)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    var body: some View {
        if showQuiz {
            QuizView()
        } else if isLoggedIn {
            TeamListView()
                .modelContainer(for: KBOLeagueTeam.self, inMemory: true)
        } else {
            ZStack {
                // 배경 그라데이션 적용
                backgroundGradient
                    .ignoresSafeArea()
                
                // 야구 이미지 배경 (반투명)
                Image("KimSeoHyeon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .opacity(0.10) // (반투명) 밝기 조절
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Spacer()
                    
                    // 제목
                    Text("Hi, KBO Quiz")
                        .font(.system(size: 40, weight: .bold, design: .rounded ))
                        .foregroundColor(.white)
                    
                    Spacer() // 로그인 버튼과 간격 조절
                    // 퀴즈 풀기
                    Button(action: {
                        showQuiz = true
                    })
                    {
                        HStack {
                            Image("타자2")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .rotation3DEffect(
                                    .degrees(swingAngle),
                                    axis: (x: 0.0, y: 1.0, z: 0.0)  
                                )
                                .onAppear {
                                    withAnimation(
                                        Animation.linear(duration: 3)
                                        .repeatForever(autoreverses: false)
                                    ) {
                                        swingAngle = 360
                                    }
                                }
                            Text("Quiz 시작하기 !")
                                .font(.system(size: 40, weight: .medium))
                                
                        }
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .padding(.horizontal, 120)
                     
                    }
                    
                    // 로그인 버튼들을 담은 VStack
                    VStack(spacing: 12) { // 각 버튼 간격
                        // 애플 로그인 버튼
                        Button(action: {
                            // 애플 로그인 처리
                            isLoggedIn = true
                        }) {
                            HStack {
                                Image("야구공")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .rotationEffect(.degrees(rotation))
                                    .onAppear {
                                        withAnimation(
                                            Animation.linear(duration: 3)
                                            .repeatForever(autoreverses: false)
                                        ) {
                                            rotation = 360
                                        }
                                    }
                                Text(" 정보 먼저보기 !")
                                    .font(.system(size: 40, weight: .medium, design: .rounded))
                            }
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .padding(.top)
                            .padding(.horizontal, 120)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

// SwiftUI 프리뷰
#Preview {
    LoginView()
} 
