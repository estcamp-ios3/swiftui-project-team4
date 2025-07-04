import SwiftUI
import AuthenticationServices

struct LoginView: View {
    // 로그인 상태를 관리하는 상태 변수
    @State private var isLoggedIn = false
    
    // 배경 그라데이션 색상 정의
    private let backgroundGradient = LinearGradient(
        colors: [Color(red: 0.1, green: 0.1, blue: 0.2), Color(red: 0.2, green: 0.2, blue: 0.3)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    var body: some View {
        if isLoggedIn {
            // 로그인 성공시 ContentView로 전환
            ContentView()
        } else {
            ZStack {
                // 배경 그라데이션 적용
                backgroundGradient
                    .ignoresSafeArea()
                
                // 야구 이미지 배경 (반투명)
                Image("KimSeoHyeon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .opacity(0.2) // (반투명) 밝기 조절
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Spacer()
                    
                    // 앱 로고 또는 타이틀
                    Text("국내 야구 퀴즈 모음")
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    // 로그인 버튼들을 담은 VStack
                    VStack(spacing: 12) {
                        // 애플 로그인 버튼
                        Button(action: {
                            // 애플 로그인 처리
                            isLoggedIn = true
                        }) {
                            HStack {
                                Image(systemName: "apple.logo")
                                    .imageScale(.medium)
                                Text("Apple 로 로그인 하기")
                                    .font(.system(size: 20))
                            }
                            // .clipShape(Capsule())
                           // 버튼 UI 둥근 모양으로 처리
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.white)
                            .clipShape(Capsule())
                           
                            
                        }
                        
                        // 구글 로그인 버튼
                        Button(action: {
                            // 구글 로그인 처리
                            isLoggedIn = true
                        }) {
                            HStack {
                                Image(systemName: "g.circle.fill")
                                    .imageScale(.medium)
                                Text("Google 로 로그인 하기")
                                    .font(.system(size: 20))
                            }
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.white)
                            .clipShape(Capsule())
                        }
                        
                        // 이메일 로그인 버튼
                        Button(action: {
                            // 이메일 로그인 처리
                            isLoggedIn = true
                        }) {
                            HStack {
                                Image(systemName: "envelope.fill")
                                    .imageScale(.medium)
                                Text("Email 로 로그인 하기")
                                    .font(.system(size: 20))
                            }
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.white)
                            .clipShape(Capsule())
                        }
                        
                        // 비회원 로그인 버튼
                        Button(action: {
                            // 비회원 로그인 처리
                            isLoggedIn = true
                        }) {
                            HStack {
                                Image(systemName: "person.fill")
                                    .imageScale(.medium)
                                Text("비회원 로그인")
                                    .font(.system(size: 20))
                            }
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.white)
                            .clipShape(Capsule())
                        }
                       
                        
                        // 이용약관 텍스트
                        VStack(spacing: 4) {
                            Text("회원가입을 진행하면 다음에 동의 하게 됩니다.")
                                .font(.system(size: 13))
                                .foregroundColor(.gray)
                            
                            HStack(spacing: 4) {
                                Text("서비스 이용약관")
                                    .underline()
                                Text("&")
                                Text("개인정보 처리방침")
                                    .underline()
                            }
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                        }
                        .padding()
                    }
                    .padding(.horizontal, 100)
                    .padding()
                }
            }
        }
    }
}

// SwiftUI 프리뷰
#Preview {
    LoginView()
} 
