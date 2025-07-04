import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var firstText = ""
    @State private var secondText = ""
    @State private var titleText = ""
    
    var body: some View {
        if isActive {
            LoginView()
        } else {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    Text(firstText)
                        .font(.system(size: 30))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    
                    Text(secondText)
                        .font(.system(size: 30))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    
                    Text(titleText)
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                }
            }
            .onAppear {
                // 첫번째 애니메이션 실행
                withAnimation(.easeIn(duration: 1.0)) {
                    firstText = "야구를 사랑하는 당신을 위한"
                }
                
                // 첫번째 텍스트 실행 후 1초 뒤 실행
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation(.easeIn(duration: 1.0)) {
                        secondText = "재미있는 야구 퀴즈"
                    }
                }
                
                // 애니메이션이 나타난 2초 뒤 제목 보여줌
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation(.easeIn(duration: 1.0)) {
                        titleText = "국내 야구 퀴즈 모음"
                    }
                }
                
                // 제목 나온 4초 뒤 로그인 화면 으로 넘어감
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
} 
