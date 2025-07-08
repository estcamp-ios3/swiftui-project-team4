import SwiftUI

// 사용자의 프로필, 게임 진행 상황, 뱃지, 통계 등을 보여주는 메인 페이지
struct MyPage: View {
    // 사용자의 기본 프로필 정보를 저장하는 상태 변수들
    @State private var nickname = "홈런왕"
    @State private var bio = "KBO를 좋아하는 1인 ⚾️"
    @State private var profileImage = "⚾️"
    @State private var playerPosition = "타자"
    @State private var favoriteTeam = "한화 이글스"
    
    // 퀴즈 점수 기록을 저장하는 배열
    @State private var quizScores = [85, 90, 75, 95, 80]  // 더 현실적인 점수로 변경
    
    // 일일 목표와 진행 상황을 추적하는 변수들
    @State private var dailyGoal = 3
    @State private var todayGames = 2
    @State private var currentStreak = 5
    
    // 프로필 편집 화면 표시 여부를 제어하는 상태 변수
    @State private var showingProfileEdit = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    // 야구장 분위기를 연출하는 그라데이션 배경과 프로필 정보
                    LinearGradient(
                        gradient: Gradient(colors: [
                            favoriteTeamColor.opacity(0.8), 
                            favoriteTeamColor.opacity(0.4),
                            Color.green.opacity(0.3)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 220)
                    .overlay(
                        VStack(spacing: 15) {
                            // 프로필 이미지 (야구 이모지 또는 포지션)
                            Text(profileImage)
                                .font(.system(size: 80))
                                .frame(width: 120, height: 120)
                                .background(Color.white)
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
                    )
                    
                    VStack(spacing: 20) {
                        // 오늘의 게임 진행 상황과 연속 달성 일수를 표시
                        DailyProgressView(
                            dailyGoal: dailyGoal,
                            todayGames: todayGames,
                            currentStreak: currentStreak
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
                        BaseballBadgeView(quizScores: quizScores)
                            .padding(.horizontal)
                        
                        // 게임 통계를 야구 기록 형식으로 표시
                        BaseballStatsView(quizScores: quizScores)
                            .padding(.horizontal)
                        
                        // 프로필 수정 등 주요 액션 버튼
                        HStack(spacing: 15) {
                            ActionButton(icon: "pencil.circle.fill", title: "프로필 수정", color: .blue) {
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
    let quizScores: [Int]
    
    var totalScore: Int {
        quizScores.reduce(0, +)
    }
    
    var baseballRank: (title: String, emoji: String, description: String, color: Color) {
        switch totalScore {
        case 0...100:
            return ("신인 선수", "🏃‍♂️", "이제 시작이야!", .brown)
        case 101...200:
            return ("1군 선수", "⚾️", "실력이 늘고 있어!", .gray)
        case 201...300:
            return ("주전 선수", "🏆", "팀의 핵심!", .yellow)
        case 301...400:
            return ("올스타", "⭐️", "리그 최고 수준!", .orange)
        default:
            return ("명예의 전당", "👑", "전설이 되었다!", .purple)
        }
    }
    
    var nextRankInfo: (threshold: Int, name: String) {
        switch totalScore {
        case 0...100:
            return (101, "1군 선수")
        case 101...200:
            return (201, "주전 선수")
        case 201...300:
            return (301, "올스타")
        case 301...400:
            return (401, "명예의 전당")
        default:
            return (500, "최고 등급")
        }
    }
    
    var progressToNext: Double {
        let currentThreshold = max(0, nextRankInfo.threshold - 101)
        let scoreInRange = totalScore % 101
        return Double(scoreInRange) / Double(currentThreshold > 0 ? 101 : 100)
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
                if totalScore < 401 {
                    VStack(spacing: 8) {
                        HStack {
                            Text("다음 등급: \(nextRankInfo.name)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Spacer()
                            Text("\(nextRankInfo.threshold - totalScore)점 남음")
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
    let quizScores: [Int]
    
    var totalScore: Int {
        quizScores.reduce(0, +)
    }
    
    var averageScore: Double {
        guard !quizScores.isEmpty else { return 0 }
        return Double(totalScore) / Double(quizScores.count)
    }
    
    var battingAverage: Double {
        // 타율을 실제 정답률처럼 계산 (100점 만점 기준)
        guard !quizScores.isEmpty else { return 0 }
        let correctAnswers = quizScores.reduce(0.0) { total, score in
            total + (Double(score) / 100.0)
        }
        return correctAnswers / Double(quizScores.count)
    }
    
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
                StatCard(title: "총 경기", value: "\(quizScores.count)", subtitle: "게임", color: .blue)
                StatCard(title: "평균 점수", value: String(format: "%.1f", averageScore), subtitle: "점", color: .red)
                StatCard(title: "정답률", value: String(format: "%.3f", battingAverage), subtitle: "AVG", color: .green)
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
    @State private var selectedImage: String = "⚾️"
    @State private var selectedPosition: String = "타자"
    @State private var selectedTeam: String = "한화 이글스"
    
    @Environment(\.dismiss) private var dismiss
    
    // 야구 관련 이미지들
    let baseballImages = ["⚾️", "🥎", "🏟", "🥇", "🏆", "⭐️", "🔥", "💪", "👊", "🎯", "⚡️", "🌟"]
    let playerPositions = ["타자", "투수", "포수", "내야수", "외야수", "감독", "팬", "해설가"]
    let kboTeams = ["한화 이글스", "KIA 타이거즈", "LG 트윈스", "롯데 자이언츠", "SSG 랜더스", "KT 위즈", "삼성 라이온즈", "NC 다이노스", "두산 베어스", "키움 히어로즈"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("프로필 이미지") {
                    HStack {
                        Spacer()
                        Text(selectedImage)
                            .font(.system(size: 80))
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
                                Text(image)
                                    .font(.system(size: 30))
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
    MyPage()
}
