import SwiftUI

// 사용자의 프로필, 게임 진행 상황, 뱃지, 통계 등을 보여주는 메인 페이지
struct MyPage: View {
    // Observable QuizManager 인스턴스 - 퀴즈 정보 실시간 공유
    let quizManager: QuizManager
    
    // 사용자의 기본 프로필 정보를 저장하는 상태 변수들
    @State private var nickname = "홈런왕"
    @State private var bio = "KBO를 좋아하는 1인 ⚾️"
    @State private var profileImage = "Doosan"  // 기본 이미지 변경
    @State private var playerPosition = "타자"
    @State private var favoriteTeam = "두산 베어스"
    
    // 프로필 편집 화면 표시 여부를 제어하는 상태 변수
    @State private var showingProfileEdit = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    // 배경을 슬로건 이미지로 변경
                    ZStack {
                        GeometryReader { geometry in
                            Image("\(profileImage)슬로건")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width, height: 220)
                                .clipped()
                                .overlay(
                                    Color.black.opacity(0.3)
                                )
                        }
                        .frame(height: 220)
                        
                        VStack(spacing: 15) {
                            // 프로필 이미지 (구단 로고)
                            Image(profileImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                                .background(Color.white.opacity(0.7)) // 로고 백그라운드 투명도 설정
                                .clipShape(Circle())
                                .shadow(color: .black.opacity(0.2), radius: 10)
                            
                            VStack(spacing: 5) {
                                Text(nickname)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                HStack(spacing: 10) {
                                    Text(playerPosition)
                                        .font(.subheadline)
                                        .foregroundColor(.white.opacity(0.9))
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(Color.black.opacity(0.3))
                                        .cornerRadius(8)
                                    
                                    Text(favoriteTeam)
                                        .font(.subheadline)
                                        .foregroundColor(.white.opacity(0.9))
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(favoriteTeamColor.opacity(0.7))
                                        .cornerRadius(8)
                                }
                            }
                        }
                        .padding(.top, 20)
                    }
                    .frame(height: 220)
                    
                    VStack(spacing: 20) {
                        // 오늘의 게임 진행 상황과 연속 달성 일수를 표시
                        DailyProgressView(
                            dailyGoal: quizManager.dailyGoal,
                            todayGames: quizManager.todayQuestions,
                            currentStreak: 5 // 기본값 유지
                        )
                        .padding(.horizontal)
                        
                        // 사용자의 자기소개를 표시하는 카드형 뷰
                        VStack(spacing: 12) {
                            HStack {
                                Image(systemName: "quote.opening")
                                    .foregroundColor(.gray)
                                Text("자기소개")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                            
                            Text(bio)
                                .font(.body)
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(15)
                        .padding(.horizontal)
                        
                        // 사용자의 등급과 진행 상황을 표시
                        BaseballBadgeView(quizManager: quizManager)
                            .padding(.horizontal)
                        
                        // 게임 통계를 야구 기록 형식으로 표시
                        BaseballStatsView(quizManager: quizManager)
                            .padding(.horizontal)
                        
                        // 프로필 수정 등 주요 액션 버튼
                        HStack(spacing: 15) {
                            ActionButton(icon: "person.fill", title: "프로필 수정", color: .blue) {
                                showingProfileEdit = true
                            }
                        }
                        .padding(.horizontal)
                        
                        Spacer(minLength: 30)
                    }
                    .padding(.top, 20)
                }
            }
            .navigationTitle("내 정보")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showingProfileEdit) {
                BaseballProfileEditView(
                    nickname: $nickname,
                    bio: $bio,
                    profileImage: $profileImage,
                    playerPosition: $playerPosition,
                    favoriteTeam: $favoriteTeam
                )
            }
        }
    }
    
    // 선택된 팀에 따라 적절한 테마 색상을 반환하는 계산 프로퍼티
    var favoriteTeamColor: Color {
        switch favoriteTeam {
        case "한화 이글스": return .orange
        case "KIA 타이거즈": return .red
        case "LG 트윈스": return .red
        case "롯데 자이언츠": return .blue
        case "SSG 랜더스": return .red
        case "KT 위즈": return .black
        case "삼성 라이온즈": return .blue
        case "NC 다이노스": return .blue
        case "두산 베어스": return .blue
        case "키움 히어로즈": return .purple
        default: return .green
        }
    }
}

// 오늘의 게임 진행 상황과 연속 달성 일수를 시각적으로 표시하는 컴포넌트
struct DailyProgressView: View {
    let dailyGoal: Int
    let todayGames: Int
    let currentStreak: Int
    
    var progressPercent: Double {
        min(Double(todayGames) / Double(dailyGoal), 1.0)
    }
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Image(systemName: "target")
                    .foregroundColor(.red)
                Text("오늘의 목표")
                    .font(.headline)
                Spacer()
                Text("\(todayGames)/\(dailyGoal)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            // 진행률 바
            VStack(spacing: 8) {
                ProgressView(value: progressPercent)
                    .progressViewStyle(LinearProgressViewStyle(tint: .red))
                    .scaleEffect(x: 1, y: 2, anchor: .center)
                
                HStack {
                    Text("목표까지 \(max(0, dailyGoal - todayGames))게임 남음")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Spacer()
                    
                    HStack(spacing: 4) {
                        Image(systemName: "flame.fill")
                            .foregroundColor(.orange)
                            .font(.caption)
                        Text("\(currentStreak)일 연속")
                            .font(.caption)
                            .foregroundColor(.orange)
                            .fontWeight(.semibold)
                    }
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(15)
    }
}

// 사용자의 등급과 다음 등급까지의 진행 상황을 표시하는 컴포넌트
struct BaseballBadgeView: View {
    let quizManager: QuizManager
    
    var baseballRank: (title: String, emoji: String, description: String, color: Color) {
        let rank = quizManager.baseballRank
        switch rank {
        case "신인":
            return ("신인", "🏃‍♂️", "야구의 세계에 첫 발을 내딛었다!", .brown)
        case "주전":
            return ("주전", "🏆", "팀의 핵심 멤버!", .blue)
        case "에이스":
            return ("에이스", "⭐️", "팀을 이끄는 선수!", .orange)
        case "올스타":
            return ("올스타", "🌟", "리그 최고 수준!", .yellow)
        case "레전드":
            return ("레전드", "👑", "야구계의 전설!", .purple)
        default:
            return ("신인", "🏃‍♂️", "야구의 세계에 첫 발을 내딛었다!", .brown)
        }
    }
    
    var nextRankInfo: (threshold: Int, name: String) {
        let score = quizManager.totalScore
        switch score {
        case 0...99:
            return (100, "주전")
        case 100...199:
            return (200, "에이스")
        case 200...299:
            return (300, "올스타")
        case 300...499:
            return (500, "레전드")
        default:
            return (500, "최고 등급")
        }
    }
    
    var progressToNext: Double {
        let score = quizManager.totalScore
        let nextThreshold = nextRankInfo.threshold
        let previousThreshold: Int
        
        switch score {
        case 0...99: previousThreshold = 0
        case 100...199: previousThreshold = 100
        case 200...299: previousThreshold = 200
        case 300...499: previousThreshold = 300
        default: return 1.0
        }
        
        let range = nextThreshold - previousThreshold
        let progress = score - previousThreshold
        return range > 0 ? Double(progress) / Double(range) : 0
    }
    
    var body: some View {
        VStack(spacing: 15) {
            // 뱃지 타이틀
            HStack {
                Image(systemName: "rosette")
                    .foregroundColor(baseballRank.color)
                Text("야구 등급")
                    .font(.headline)
                    .foregroundColor(.primary)
                Spacer()
            }
            
            // 메인 뱃지
            VStack(spacing: 15) {
                VStack(spacing: 10) {
                    Text(baseballRank.emoji)
                        .font(.system(size: 50))
                    
                    Text(baseballRank.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(baseballRank.color)
                    
                    Text(baseballRank.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [baseballRank.color.opacity(0.1), baseballRank.color.opacity(0.05)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(baseballRank.color.opacity(0.3), lineWidth: 2)
                )
                .cornerRadius(15)
                
                // 다음 등급까지 진행률
                if quizManager.totalScore < 500 {
                    VStack(spacing: 8) {
                        HStack {
                            Text("다음 등급: \(nextRankInfo.name)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Spacer()
                            Text("\(nextRankInfo.threshold - quizManager.totalScore)점 남음")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        ProgressView(value: progressToNext)
                            .progressViewStyle(LinearProgressViewStyle(tint: baseballRank.color))
                            .scaleEffect(x: 1, y: 2, anchor: .center)
                    }
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(15)
    }
}

// 게임 통계를 야구 기록 형식으로 표시하는 컴포넌트
struct BaseballStatsView: View {
    let quizManager: QuizManager
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Image(systemName: "chart.line.uptrend.xyaxis")
                    .foregroundColor(.green)
                Text("야구 기록")
                    .font(.headline)
                Spacer()
            }
            
            HStack(spacing: 20) {
                StatCard(title: "총 경기", value: "\(quizManager.totalQuestions)", subtitle: "게임", color: .blue)
                StatCard(title: "총 점수", value: "\(quizManager.totalScore)", subtitle: "점", color: .red)
                StatCard(title: "정답률", value: String(format: "%.1f%%", quizManager.accuracyRate), subtitle: "AVG", color: .green)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(15)
    }
}

// 개별 통계 항목을 카드 형태로 표시하는 재사용 가능한 컴포넌트
struct StatCard: View {
    let title: String
    let value: String
    let subtitle: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
            
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(color)
            
            Text(subtitle)
                .font(.caption2)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(Color.white.opacity(0.8))
        .cornerRadius(10)
    }
}

// 사용자 프로필 정보를 수정할 수 있는 폼 형식의 편집 화면
struct BaseballProfileEditView: View {
    @Binding var nickname: String
    @Binding var bio: String
    @Binding var profileImage: String
    @Binding var playerPosition: String
    @Binding var favoriteTeam: String
    
    @State private var tempNickname: String = ""
    @State private var tempBio: String = ""
    @State private var selectedImage: String = ""
    @State private var selectedPosition: String = ""
    @State private var selectedTeam: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    // 야구 관련 이미지들을 구단 이미지로 변경
    let baseballImages = ["Doosan", "Hanhwa", "Kia", "Kiwoom", "KT", "LG", "Lotte", "NC", "Samsung", "SSG"]
    let playerPositions = ["타자", "투수", "포수", "내야수", "외야수", "감독", "팬", "해설가"]
    let kboTeams = ["한화 이글스", "KIA 타이거즈", "LG 트윈스", "롯데 자이언츠", "SSG 랜더스", "KT 위즈", "삼성 라이온즈", "NC 다이노스", "두산 베어스", "키움 히어로즈"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("최애 구단을 선택하시면 프로필 이미지가 됩니다.") {
                    HStack {
                        Spacer()
                        Image(selectedImage)  // Text를 Image로 변경
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .background(Color(.systemGray6))
                            .clipShape(Circle())
                        Spacer()
                    }
                    .padding(.vertical)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 15) {
                        ForEach(baseballImages, id: \.self) { image in
                            Button {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                                    selectedImage = image
                                }
                            } label: {
                                Image(image)  // Text를 Image로 변경
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .background(selectedImage == image ? Color.blue.opacity(0.2) : Color(.systemGray6))
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle()
                                            .stroke(selectedImage == image ? Color.blue : Color.clear, lineWidth: 2)
                                    )
                                    .scaleEffect(selectedImage == image ? 1.1 : 1.0)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                }
                
                Section("즐겨찾는 팀") {
                    Picker("팀", selection: $selectedTeam) {
                        ForEach(kboTeams, id: \.self) { team in
                            Text(team).tag(team)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section("포지션") {
                    Picker("포지션", selection: $selectedPosition) {
                        ForEach(playerPositions, id: \.self) { position in
                            Text(position).tag(position)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section("닉네임") {
                    TextField("닉네임을 입력하세요", text: $tempNickname)
                }
                
                Section("자기소개") {
                    TextEditor(text: $tempBio)
                        .frame(minHeight: 100)
                }
            }
            .navigationTitle("프로필 편집")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("취소") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("저장") {
                        // 모든 변경사항을 한번에 저장
                        withAnimation {
                            nickname = tempNickname
                            bio = tempBio
                            profileImage = selectedImage
                            playerPosition = selectedPosition
                            favoriteTeam = selectedTeam
                            dismiss()
                        }
                    }
                    .fontWeight(.semibold)
                }
            }
            .onAppear {
                // 기존 값들로 초기화
                tempNickname = nickname
                tempBio = bio
                selectedImage = profileImage
                selectedPosition = playerPosition
                selectedTeam = favoriteTeam
            }
        }
    }
}

// 아이콘과 텍스트를 포함한 커스텀 버튼 컴포넌트
struct ActionButton: View {
    let icon: String
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(color)
                Text(title)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 15)
            .background(Color(.systemGray6))
            .cornerRadius(12)
        }
    }
}

#Preview {
    MyPage(quizManager: QuizManager())
}
