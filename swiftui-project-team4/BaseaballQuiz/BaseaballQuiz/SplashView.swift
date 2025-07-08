import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var scale: CGFloat = 0.5 // 크기
    @State private var opacity: Double = 0.3 // 투명도

    var body: some View {
        if isActive == true {
            LoginView()
        } else {
            ZStack {
                Color.black
                    .ignoresSafeArea()

                VStack {
                    //
                    Image("야구공")
                        .resizable() // 크기 조절 가능하게 하는 모디파이어
                        .scaledToFit() // 이미지 원본 비율을 유지하면서 주어진 공간에 맞추어 이미지 조절
                        .frame(width: 150, height: 150) // 뷰의 너비와 높이를 지정
                        .scaleEffect(scale) // 뷰를 스케일 하여 보여줌
                        .opacity(opacity) // 투명도
                }
            }
            .onAppear {
                // 1.5초 동안 부드럽게 애니메이션 적용
                withAnimation(.easeInOut(duration: 1.5)) {
                    self.scale = 1.2 // 최종 크기
                    self.opacity = 1.0 // 최종 투명도
                }

                // 2.5초 후에 로그인 화면으로 전환
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
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
