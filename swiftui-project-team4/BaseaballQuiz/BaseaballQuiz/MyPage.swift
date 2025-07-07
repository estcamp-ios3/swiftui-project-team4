
import SwiftUI

struct MyPage: View {
    // 마이페이지에 표시될 사용자 데이터 (예시)
    @State private var nickname = "홈런왕"
    @State private var bio = "KBO를 좋아하는 1인 ⚾️"

    var body: some View {
       
        NavigationStack {
       
            ScrollView {
                VStack(spacing: 25) {
                   
                    VStack(spacing: 10) {
                    
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                            .foregroundColor(.gray.opacity(0.4))
                            .padding(.top, 20)

                        
                        Text("\(nickname)")
                            .font(.largeTitle)
                            .fontWeight(.bold)

                    
                        Text(bio)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }

                 
                    HStack(spacing: 15) {
                        
                        ActionButton(icon: "pencil.circle.fill", title: "프로필 수정") {
                          
                        }
                    }
          
    
                    VStack {
                        SettingRow(icon: "key.fill", title: "계정")
                        Divider()
                        SettingRow(icon: "bell.fill", title: "알림")
                        Divider()
                        SettingRow(icon: "shield.lefthalf.filled", title: "개인정보 보호")
                        Divider()
                        SettingRow(icon: "questionmark.circle.fill", title: "도움말 센터")
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
          
                    Button(action: {
                     
                    }) {
                        Text("로그아웃")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red.opacity(0.1))
                            .foregroundColor(.red)
                            .cornerRadius(12)
                    }
                    Button(action: {
                        
                    }) {
                        Text("회원 탈퇴")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red.opacity(0.1))
                            .foregroundColor(.red)
                            .cornerRadius(12)
                    }
                }
            }
            .navigationTitle("마이페이지")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

// 재사용을 위한 커스텀 버튼 컴포넌트
struct ActionButton: View {
    let icon: String
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.title2)
                Text(title)
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 15)
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .foregroundColor(.primary)
        }
    }
}

struct SettingRow: View {
    let icon: String
    let title: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
            Text(title)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray.opacity(0.5))
        }
        .padding(.vertical, 8)
    }
}


#Preview {
    MyPage()
}
