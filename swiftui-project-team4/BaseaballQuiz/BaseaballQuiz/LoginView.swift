import SwiftUI
import AuthenticationServices

// LoginView: 앱 시작 시 첫 화면으로 표시되는 로그인 화면
// 1. 단일 버튼으로 UI 단순화 (버튼 누르면 바로 퀴즈 시작하기)
// 2. 3D 회전 효과가 있는 타자 이미지 추가
// 3. 그라데이션 배경과 반투명 이미지 오버레이 적용

struct LoginView: View {
    // 상태 관리를 위한 프로퍼티
    @State private var showQuiz = false          // 퀴즈 화면 표시 여부
    @State private var swingAngle: Double = 0    // 타자 이미지 회전 각도
    
    // 배경 그라데이션 색상 정의
    private let backgroundGradient = LinearGradient(
        colors: [Color(red: 0.1, green: 0.1, blue: 0.2), Color(red: 0.2, green: 0.2, blue: 0.3)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    var body: some View {
        // 조건부 뷰 전환: showQuiz가 true면 QuizView 표시
        if showQuiz {
            QuizView()
        } else {
            ZStack {
                // 배경 그라데이션 적용
                backgroundGradient
                    .ignoresSafeArea()
                
                // 배경 이미지 (반투명 효과)
                Image("김서현")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .opacity(0.10)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Spacer()
                    
                    // 앱 타이틀
                    Text("Hi, KBO Quiz")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    // 퀴즈 시작 버튼
                    Button(action: {
                        showQuiz = true
                    }) {
                        HStack {
                            // 3D 회전 효과가 있는 타자 이미지
                            Image("야구공")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .rotation3DEffect(
                                    .degrees(swingAngle),
                                    axis: (x: 0.0, y: 0.0, z: 1.0)  // Y축 기준 회전
                                )
                                .onAppear {
                                    // 지속적인 회전 애니메이션
                                    withAnimation(
                                        Animation.linear(duration: 3)
                                            .repeatForever(autoreverses: false)
                                    ) {
                                        swingAngle = 360
                                    }
                                }
                            
                            // 버튼 텍스트
                            Text("Quiz 시작하기 !")
                                .font(.system(size: 40, weight: .medium))
                        }
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(.horizontal, 120)
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
