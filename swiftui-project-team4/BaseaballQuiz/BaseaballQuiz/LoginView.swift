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
    @Environment(\.modelContext) private var context
    // 배경 그라데이션 색상 정의
    private let backgroundGradient = LinearGradient(
        colors: [Color(red: 0.1, green: 0.1, blue: 0.2), Color(red: 0.2, green: 0.2, blue: 0.3)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    var body: some View {
        // 조건부 뷰 전환: showQuiz가 true면 QuizView 표시
        Group {
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
        .task {
            let ryu =
            Player(
                name: "류현진",
                birth: "1987.03.25",
                height: 186,
                weight: 108,
                company: "에이스",
                teamName: "한화 이글스",
                number: 99,
                position: "투수",
                national_entry: true,
                official_page: URL(string: "http://ryu99corporation.com/")!,
                image: "ryuhyunjin")
            let nos = Player(
                name: "노시환",
                birth: "2000.12.03",
                height: 185,
                weight: 96,
                company: "스타",
                teamName: "한화 이글스",
                number: 8,
                position: "내야수",
                national_entry: true,
                official_page: URL(string: "https://www.hanwhaeagles.co.kr/PL/IF/PLIF02.do?&id=475&pcode=69737")!,
                image: "nohsihwan")
            let mdj = Player(
                name: "문동주",
                birth: "2003.12.23",
                height: 188,
                weight: 97,
                company: "스타",
                teamName: "한화 이글스",
                number: 1,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.hanwhaeagles.co.kr/PL/PC/PLPC02.do?&id=588&pcode=52701")!,
                image: "moondongjoo")
            let ponce = Player(
                name: "폰세",
                birth: "1994.04.25",
                height: 198,
                weight: 115,
                company: "스타",
                teamName: "한화 이글스",
                number: 30,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.hanwhaeagles.co.kr/PL/PC/PLPC02.do?&id=903&pcode=55730")!,
                image: "ponce")
            let ces = Player(
                name: "채은성",
                birth: "1990.02.06",
                height: 186,
                weight: 92,
                company: "스타",
                teamName: "한화 이글스",
                number: 22,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.hanwhaeagles.co.kr/PL/IF/PLIF02.do?&id=744&pcode=79192")!,
                image: "chaeeunsung")
            let cjh = Player(
                name: "최재훈",
                birth: "1989.08.27",
                height: 178,
                weight: 94,
                company: "스타",
                teamName: "한화 이글스",
                number: 30,
                position: "포수",
                national_entry: false,
                official_page: URL(string: "https://www.hanwhaeagles.co.kr/PL/CC/PLCC02.do?&id=426&pcode=78288")!,
                image: "choijaehun")
            let kimseohyun = Player(
                name: "김서현",
                birth: "2004.05.31",
                height: 188,
                weight: 86,
                company: "스타",
                teamName: "한화 이글스",
                number: 44,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.hanwhaeagles.co.kr/PL/PC/PLPC02.do?&id=903&pcode=55730")!,
                image: "kimseohyun")
            let moonhyunbin = Player(
                name: "문현빈",
                birth: "moonhyunbin",
                height: 174,
                weight: 82,
                company: "스타",
                teamName: "한화 이글스",
                number: 51,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.hanwhaeagles.co.kr/PL/PC/PLPC02.do?&id=903&pcode=55730")!,
                image: "moonhyunbin")
            let hwangyoungmuk = Player(
                name: "황영묵",
                birth: "1999.10.16",
                height: 177,
                weight: 80,
                company: "스타",
                teamName: "한화 이글스",
                number: 95,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.hanwhaeagles.co.kr/PL/IF/PLIF02.do?&id=837&pcode=54795")!,
                image: "hwangyoungmuk")
            let leejinyoung = Player(
                name: "이진영",
                birth: "1997.7.21",
                height: 183,
                weight: 89,
                company: "스타",
                teamName: "한화 이글스",
                number: 10,
                position: "외야수",
                national_entry: false,
                official_page: URL(string: "https://www.hanwhaeagles.co.kr/PL/OF/PLOF02.do?&id=623&pcode=66657")!,
                image: "leejinyoung")
            let liberato = Player(
                name: "리베라토",
                birth: "1995.12.18",
                height: 185,
                weight: 79,
                company: "스타",
                teamName: "한화 이글스",
                number: 0,
                position: "외야수",
                national_entry: false,
                official_page: URL(string: "https://www.hanwhaeagles.co.kr/PL/OF/PLOF02.do?&id=926&pcode=")!,
                image: "liberato")
            
            context.insert(ryu)
            context.insert(nos)
            context.insert(mdj)
            context.insert(ponce)
            context.insert(ces)
            context.insert(cjh)
            context.insert(kimseohyun)
            context.insert(moonhyunbin)
            context.insert(hwangyoungmuk)
            context.insert(leejinyoung)
            context.insert(liberato)
            
            
            context.insert(KBOLeagueTeam(
                id: 0,
                name: "한화 이글스",
                engName: "Hanwha Eagles",
                location: "대전광역시",
                birthday: "1986년 3월 8일",
                homeStadium: "한화생명 볼파크",
                manager: "김경문",
                officialURL: URL(string: "https://www.hanwhaeagles.co.kr/index.do")!,
                color: "주황, 검정",
                logoImage: "Hanhwa",
                standings: 1,
                standingsDesc: "48승 2무 33패",
                players: [ryu, nos, mdj, ponce, ces, cjh, kimseohyun, moonhyunbin, hwangyoungmuk, leejinyoung, liberato]
            ))
            // 키움 히어로즈
            let choijuhwan = Player(
                name: "최주환",
                birth: "1988년 2월 28일",
                height: 185,
                weight: 79,
                company: "스타",
                teamName: "키움히어로즈",
                number: 53,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://heroesbaseball.co.kr/players/all/view.do?num=485&searchType=name&searchWord=%EC%B5%9C%EC%A3%BC%ED%99%98")!,
                image: "choijuhwan")
            let kimdonghun = Player(
                name: "김동헌",
                birth: "2004년 7월 15일",
                height: 182,
                weight: 91,
                company: "스타",
                teamName: "키움히어로즈",
                number: 47,
                position: "포수",
                national_entry: false,
                official_page: URL(string: "https://heroesbaseball.co.kr/players/catcher/view.do?num=455")!,
                image: "kimdonghun")
            let alcantara = Player(
                name: "알칸타라",
                birth: "1992.12.04",
                height: 193,
                weight: 100,
                company: "스타",
                teamName: "키움히어로즈",
                number: 54,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://heroesbaseball.co.kr/players/pitcher/view.do?num=526")!,
                image: "alcantara")
            let joosuengwoo = Player(
                name: "주승우",
                birth: "2000.01.30",
                height: 186,
                weight: 85,
                company: "스타",
                teamName: "키움히어로즈",
                number: 30,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://heroesbaseball.co.kr/players/pitcher/view.do?num=423")!,
                image: "joosuengwoo")
            let junghyunwoo = Player(
                name: "정현우",
                birth: "2006년 4월 13일",
                height: 181,
                weight: 91,
                company: "스타",
                teamName: "키움히어로즈",
                number: 13,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://heroesbaseball.co.kr/players/pitcher/view.do?num=512")!,
                image: "junghyunwoo")
            let songsungmoon = Player(
                name: "송성문",
                birth: "1996년 8월 29일",
                height: 182,
                weight: 85,
                company: "스타",
                teamName: "키움히어로즈",
                number: 24,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://heroesbaseball.co.kr/players/infielder/view.do?num=239")!,
                image: "songsungmoon")
            let parkchaeul = Player(
                name: "박채울",
                birth: "2004년 11월 20일",
                height: 185,
                weight: 86,
                company: "스타",
                teamName: "키움히어로즈",
                number: 79,
                position: "외야수",
                national_entry: false,
                official_page: URL(string: "https://heroesbaseball.co.kr/players/outfielder/view.do?num=492")!,
                image: "parkchaeul")
            
            context.insert(choijuhwan)
            context.insert(kimdonghun)
            context.insert(alcantara)
            context.insert(joosuengwoo)
            context.insert(junghyunwoo)
            context.insert(songsungmoon)
            context.insert(parkchaeul)
            
            context.insert(KBOLeagueTeam(
                id: 9,
                name: "키움 히어로즈",
                engName: "Kiwoom Heroes",
                location: "서울특별시",
                birthday: "2008년 3월 24일",
                homeStadium: "고척 스카이돔",
                manager: "홍원기",
                officialURL: URL(string: "https://heroesbaseball.co.kr/")!,
                color: "자주, 빨강",
                logoImage: "Kiwoom",
                standings: 10,
                standingsDesc: "26승 3무 59패",
                players: [choijuhwan, kimdonghun, alcantara, joosuengwoo, junghyunwoo, songsungmoon, parkchaeul]
            ))
            
            // 기아 타이거즈
            let yanghyunjong = Player(
                name: "양현종",
                birth: "1988년 03월 01일",
                height: 183,
                weight: 91,
                company: "스타",
                teamName: "기아 타이거즈",
                number: 54,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://tigers.co.kr/players/pitcher/77637")!,
                image: "yanghyunjong")
            let nasungbum = Player(
                name: "나성범",
                birth: "1989년 10월 03일",
                height: 183,
                weight: 100,
                company: "스타",
                teamName: "기아 타이거즈",
                number: 47,
                position: "외야수",
                national_entry: false,
                official_page: URL(string: "https://tigers.co.kr/players/outfielder/62947")!,
                image: "nasungbum")
            let kimdoyoung = Player(
                name: "김도영",
                birth: "2003년 10월 02일",
                height: 183,
                weight: 85,
                company: "스타",
                teamName: "기아 타이거즈",
                number: 5,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://tigers.co.kr/players/infielder/52605")!,
                image: "kimdoyoung")
            let choihyungwoo = Player(
                name: "최형우",
                birth: "1983년 12월 16일",
                height: 180,
                weight: 106,
                company: "스타",
                teamName: "기아 타이거즈",
                number: 34,
                position: "외야수",
                national_entry: false,
                official_page: URL(string: "https://tigers.co.kr/players/outfielder/72443")!,
                image: "choihyungwoo")
            let yunyoungchul = Player(
                name: "윤영철",
                birth: "2004년 04월 20일",
                height: 187,
                weight: 87,
                company: "스타",
                teamName: "기아 타이거즈",
                number: 13,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://tigers.co.kr/players/pitcher/53613")!,
                image: "yunyoungchul")
            let junghaeyoung = Player(
                name: "정해영",
                birth: "1988년 03월 01일",
                height: 189,
                weight: 98,
                company: "스타",
                teamName: "기아 타이거즈",
                number: 62,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://tigers.co.kr/players/pitcher/50662")!,
                image: "junghaeyoung")
            let parkchanho = Player(
                name: "박찬호",
                birth: "1995년 06월 05일",
                height: 178,
                weight: 72,
                company: "스타",
                teamName: "기아 타이거즈",
                number: 1,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://tigers.co.kr/players/infielder/64646")!,
                image: "parkchanho")
            let imgiyoung = Player(
                name: "임기영",
                birth: "1993년 04월 16일",
                height: 184,
                weight: 86,
                company: "스타",
                teamName: "기아 타이거즈",
                number: 17,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://tigers.co.kr/players/pitcher/62754")!,
                image: "imgiyoung")
            let kimtaegun = Player(
                name: "김태군",
                birth: "1989년 12월 30일",
                height: 182,
                weight: 92,
                company: "스타",
                teamName: "기아 타이거즈",
                number: 42,
                position: "포수",
                national_entry: false,
                official_page: URL(string: "https://tigers.co.kr/players/catcher/78122")!,
                image: "kimtaegun")
            let wisdom = Player(
                name: "위즈덤",
                birth: "1991년 08월 27일",
                height: 188,
                weight: 99,
                company: "스타",
                teamName: "기아 타이거즈",
                number: 45,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://tigers.co.kr/players/infielder/55645")!,
                image: "wisdom")
            
            context.insert(yanghyunjong)
            context.insert(nasungbum)
            context.insert(kimdoyoung)
            context.insert(choihyungwoo)
            context.insert(yunyoungchul)
            context.insert(junghaeyoung)
            context.insert(parkchanho)
            context.insert(imgiyoung)
            context.insert(kimtaegun)
            context.insert(wisdom)
            
            
            context.insert(KBOLeagueTeam(
                id: 1,
                name: "KIA 타이거즈",
                engName: "KIA Tigers",
                location: "광주광역시",
                birthday: "1982년 1월 30일",
                homeStadium: "기아 챔피언스 필드",
                manager: "이범호",
                officialURL: URL(string: "https://www.tigers.co.kr/")!,
                color: "빨강, 검정",
                logoImage: "Kia",
                standings: 2,
                standingsDesc: "45승 3무 36패",
                players: [yanghyunjong, nasungbum, kimdoyoung, choihyungwoo, yunyoungchul, junghaeyoung, parkchanho, imgiyoung, kimtaegun, wisdom]
            ))
            
            // LG
            let ojihwan = Player(
                name: "오지환",
                birth: "1990년 03월 12일",
                height: 185,
                weight: 80,
                company: "스타",
                teamName: "LG 트윈스",
                number: 10,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.lgtwins.com/service/html.ncd")!,
                image: "ojihwan")
            let parkdongwon = Player(
                name: "박동원",
                birth: "1990년 04월 07일",
                height: 178,
                weight: 92,
                company: "스타",
                teamName: "LG 트윈스",
                number: 27,
                position: "포수",
                national_entry: false,
                official_page: URL(string: "https://www.lgtwins.com/service/html.ncd")!,
                image: "parkdongwon")
            let kimhyunsu = Player(
                name: "김현수",
                birth: "1988년 01월 12일",
                height: 188,
                weight: 105,
                company: "스타",
                teamName: "LG 트윈스",
                number: 22,
                position: "외야수",
                national_entry: false,
                official_page: URL(string: "https://www.lgtwins.com/service/html.ncd")!,
                image: "kimhyunsu")
            let hongchanggi = Player(
                name: "홍창기",
                birth: "1993년 11월 21일",
                height: 189,
                weight: 94,
                company: "스타",
                teamName: "LG 트윈스",
                number: 51,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.lgtwins.com/service/html.ncd")!,
                image: "hongchanggi")
            let imchangyu = Player(
                name: "임찬규",
                birth: "1992년 11월 20일",
                height: 185,
                weight: 80,
                company: "스타",
                teamName: "LG 트윈스",
                number: 1,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.lgtwins.com/service/html.ncd")!,
                image: "imchangyu")
            let moonbogyoung = Player(
                name: "문보경",
                birth: "2000년 07월 19일",
                height: 182,
                weight: 88,
                company: "스타",
                teamName: "LG 트윈스",
                number: 2,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.lgtwins.com/service/html.ncd")!,
                image: "moonbogyoung")
            let sinminjae = Player(
                name: "신민재",
                birth: "1996년 01월 21일",
                height: 171,
                weight: 67,
                company: "스타",
                teamName: "LG 트윈스",
                number: 4,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.lgtwins.com/service/html.ncd")!,
                image: "sinminjae")
            let ostin = Player(
                name: "오스틴",
                birth: "1993년 10월 14일",
                height: 183,
                weight: 97,
                company: "스타",
                teamName: "LG 트윈스",
                number: 23,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.lgtwins.com/service/html.ncd")!,
                image: "ostin")
            let goobonhyuk = Player(
                name: "구본혁",
                birth: "1997년 01월 11일",
                height: 177,
                weight: 75,
                company: "스타",
                teamName: "LG 트윈스",
                number: 6,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.lgtwins.com/service/html.ncd")!,
                image: "goobonhyuk")
            let sonjuyoung = Player(
                name: "손주영",
                birth: "1998년 12월 02일",
                height: 191,
                weight: 95,
                company: "스타",
                teamName: "LG 트윈스",
                number: 29,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.lgtwins.com/service/html.ncd")!,
                image: "sonjuyoung")
            
            
            context.insert(ojihwan)
            context.insert(parkdongwon)
            context.insert(kimhyunsu)
            context.insert(hongchanggi)
            context.insert(imchangyu)
            context.insert(moonbogyoung)
            context.insert(sinminjae)
            context.insert(ostin)
            context.insert(goobonhyuk)
            context.insert(sonjuyoung)
            
            context.insert(KBOLeagueTeam(
                id: 2,
                name: "LG 트윈스",
                engName: "LG Twins",
                location: "서울",
                birthday: "1990년 3월 15일",
                homeStadium: "잠실 야구장",
                manager: "염경엽",
                officialURL: URL(string: "https://www.lgtwins.com/")!,
                color: "빨강, 검정, 회색",
                logoImage: "LG",
                standings: 3,
                standingsDesc: "45승 2무 37패",
                players: [sonjuyoung, goobonhyuk, ostin, sinminjae, moonbogyoung, imchangyu, hongchanggi, kimhyunsu, parkdongwon, ojihwan]
            ))
            
            // 롯데자이언츠
            let junjunwoo = Player(
                name: "전준우",
                birth: "1986년 2월 25일",
                height: 184,
                weight: 98,
                company: "스타",
                teamName: "롯데자이언츠",
                number: 79,
                position: "외야수",
                national_entry: false,
                official_page: URL(string: "https://www.giantsclub.com/html/?pcode=822&pc=78513")!,
                image: "junjunwoo")
            let yundonghee = Player(
                name: "윤동희",
                birth: "2003년 09월 18일",
                height: 187,
                weight: 85,
                company: "스타",
                teamName: "롯데자이언츠",
                number: 91,
                position: "외야수",
                national_entry: false,
                official_page: URL(string: "https://www.giantsclub.com/html/?pcode=822&pc=52591")!,
                image: "yundonghee")
            let parksewoong = Player(
                name: "박세웅",
                birth: "1986년 2월 25일",
                height: 182,
                weight: 85,
                company: "스타",
                teamName: "롯데자이언츠",
                number: 21,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.giantsclub.com/html/?pcode=819&pc=64021")!,
                image: "parksewoong")
            let nagyunan = Player(
                name: "나균안",
                birth: "1998년 3월 16일",
                height: 184,
                weight: 98,
                company: "스타",
                teamName: "롯데자이언츠",
                number: 43,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.giantsclub.com/html/?pcode=819&pc=67539")!,
                image: "nagyunan")
            let yoogangnam = Player(
                name: "유강남",
                birth: "1992년 07월 15일",
                height: 184,
                weight: 98,
                company: "스타",
                teamName: "롯데자이언츠",
                number: 27,
                position: "포수",
                national_entry: false,
                official_page: URL(string: "https://www.giantsclub.com/html/?pcode=820&pc=61102")!,
                image: "yoogangnam")
            let gosuengmin = Player(
                name: "고승민",
                birth: "2000년 08월 11일",
                height: 189,
                weight: 92,
                company: "스타",
                teamName: "롯데자이언츠",
                number: 79,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.giantsclub.com/html/?pcode=821&pc=69517")!,
                image: "gosuengmin")
            let Gamboa = Player(
                name: "감보아",
                birth: "1997년 01월 17일",
                height: 185,
                weight: 92,
                company: "스타",
                teamName: "롯데자이언츠",
                number: 32,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.giantsclub.com/html/?pcode=819&pc=55532")!,
                image: "Gamboa")
            let Reyes = Player(
                name: "빅터 레이예스",
                birth: "1994년 10월 05일",
                height: 196,
                weight: 87,
                company: "스타",
                teamName: "롯데자이언츠",
                number: 29,
                position: "외야수",
                national_entry: false,
                official_page: URL(string: "https://www.giantsclub.com/html/?pcode=822&pc=54529")!,
                image: "Reyes")
            let junghun = Player(
                name: "정훈",
                birth: "1987년 07월 18일",
                height: 180,
                weight: 85,
                company: "스타",
                teamName: "롯데자이언츠",
                number: 9,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.giantsclub.com/html/?pcode=821&pc=60523")!,
                image: "junghun")
            let sonseongbin = Player(
                name: "손성빈",
                birth: "2002년 01월 14일",
                height: 186,
                weight: 92,
                company: "스타",
                teamName: "롯데자이언츠",
                number: 28,
                position: "포수",
                national_entry: false,
                official_page: URL(string: "https://www.giantsclub.com/html/?pcode=820&pc=51528")!,
                image: "sonseongbin")
            
            context.insert(junjunwoo)
            context.insert(yundonghee)
            context.insert(parksewoong)
            context.insert(nagyunan)
            context.insert(yoogangnam)
            context.insert(gosuengmin)
            context.insert(Gamboa)
            context.insert(Reyes)
            context.insert(junghun)
            context.insert(sonseongbin)
            
            context.insert(KBOLeagueTeam(
                id: 3,
                name: "롯데 자이언츠",
                engName: "Lotte Giants",
                location: "부산광역시",
                birthday: "1982년 2월 12일",
                homeStadium: "사직 야구장",
                manager: "김태형",
                officialURL: URL(string: "https://www.giantsclub.com/")!,
                color: "빨강, 파랑, 네이비",
                logoImage: "Lotte",
                standings: 4,
                standingsDesc: "45승 3무 37패",
                players: [junjunwoo, yundonghee, parksewoong, nagyunan, yoogangnam, gosuengmin, Gamboa, Reyes, junghun, sonseongbin]
            ))
            
            // SSG
            let choijung = Player(
                name: "최정",
                birth: "1987/02/28",
                height: 180,
                weight: 90,
                company: "스타",
                teamName: "SSG 랜더스",
                number: 14,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.ssglanders.com/players/60")!,
                image: "choijung")
            let kimgwanghyun = Player(
                name: "김광현",
                birth: "1988/07/22",
                height: 188,
                weight: 88,
                company: "스타",
                teamName: "SSG 랜더스",
                number: 29,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.ssglanders.com/players/617")!,
                image: "kimgwanghyun")
            let seojinyong = Player(
                name: "서진용",
                birth: "1992/10/02",
                height: 184,
                weight: 88,
                company: "스타",
                teamName: "SSG 랜더스",
                number: 22,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.ssglanders.com/players/224")!,
                image: "seojinyong")
            let parksunghan = Player(
                name: "박성한",
                birth: "1998/03/30",
                height: 180,
                weight: 77,
                company: "스타",
                teamName: "SSG 랜더스",
                number: 2,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.ssglanders.com/players/419")!,
                image: "parksunghan")
            let eredya = Player(
                name: "기예르모 에레디아",
                birth: "1991/01/31",
                height: 178,
                weight: 88,
                company: "스타",
                teamName: "SSG 랜더스",
                number: 27,
                position: "외야수",
                national_entry: false,
                official_page: URL(string: "https://www.ssglanders.com/players/638")!,
                image: "eredya")
            let choijihun = Player(
                name: "최지훈",
                birth: "1997/07/23",
                height: 178,
                weight: 82,
                company: "스타",
                teamName: "SSG 랜더스",
                number: 54,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.ssglanders.com/players/533")!,
                image: "choijihun")
            let nogyungeun = Player(
                name: "노경은",
                birth: "1984/03/11",
                height: 187,
                weight: 100,
                company: "스타",
                teamName: "SSG 랜더스",
                number: 38,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.ssglanders.com/players/598")!,
                image: "nogyungeun")
            let moonseungwon = Player(
                name: "문승원",
                birth: "1989/11/28",
                height: 180,
                weight: 88,
                company: "스타",
                teamName: "SSG 랜더스",
                number: 42,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.ssglanders.com/players/251")!,
                image: "moonseungwon")
            let gomyungjun = Player(
                name: "고명준",
                birth: "2002/07/08",
                height: 185,
                weight: 94,
                company: "스타",
                teamName: "SSG 랜더스",
                number: 18,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.ssglanders.com/players/572")!,
                image: "gomyungjun")
            let otaegon = Player(
                name: "오태곤",
                birth: "1991/11/18",
                height: 186,
                weight: 88,
                company: "스타",
                teamName: "SSG 랜더스",
                number: 37,
                position: "외야수",
                national_entry: false,
                official_page: URL(string: "https://www.ssglanders.com/players/542")!,
                image: "otaegon")
            
            
            context.insert(choijung)
            context.insert(kimgwanghyun)
            context.insert(seojinyong)
            context.insert(parksunghan)
            context.insert(eredya)
            context.insert(choijihun)
            context.insert(nogyungeun)
            context.insert(moonseungwon)
            context.insert(gomyungjun)
            context.insert(otaegon)
            
            
            context.insert(KBOLeagueTeam(
                id: 4,
                name: "SSG 랜더스",
                engName: "SSG Landers",
                location: "인천광역시",
                birthday: "2021년 3월 30일",
                homeStadium: "SSG 랜더스 필드",
                manager: "이숭용",
                officialURL: URL(string: "https://www.ssglanders.com/")!,
                color: "주홍, 노랑",
                logoImage: "SSG",
                standings: 5,
                standingsDesc: "42승 3무 38패",
                players: [choijung, kimgwanghyun, seojinyong, parksunghan, eredya, choijihun, nogyungeun, moonseungwon, gomyungjun, otaegon]
            ))
            
            // KT
            let kangbaekho = Player(
                name: "강백호",
                birth: "1999.07.29",
                height: 184,
                weight: 98,
                company: "스타",
                teamName: "KT 위즈",
                number: 50,
                position: "외야수",
                national_entry: false,
                official_page: URL(string: "https://www.ktwiz.co.kr/player/outfielder/detail?pcode=68050")!,
                image: "kangbaekho")
            let goyoungpyo = Player(
                name: "고영표",
                birth: "1991.09.16",
                height: 187,
                weight: 88,
                company: "스타",
                teamName: "KT 위즈",
                number: 1,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.ktwiz.co.kr/player/pitcher/detail?pcode=64001")!,
                image: "goyoungpyo")
            let parkyounghyun = Player(
                name: "박영현",
                birth: "2003.10.11",
                height: 183,
                weight: 91,
                company: "스타",
                teamName: "KT 위즈",
                number: 60,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.ktwiz.co.kr/player/outfielder/detail?pcode=68050")!,
                image: "parkyounghyun")
            let sohyungjun = Player(
                name: "소형준",
                birth: "2001.09.16",
                height: 189,
                weight: 92,
                company: "스타",
                teamName: "KT 위즈",
                number: 30,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.ktwiz.co.kr/player/pitcher/detail?pcode=50030")!,
                image: "sohyungjun")
            let hwangjaegyun = Player(
                name: "황재균",
                birth: "1987.07.28",
                height: 183,
                weight: 96,
                company: "스타",
                teamName: "KT 위즈",
                number: 10,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.ktwiz.co.kr/player/infielder/detail?pcode=76313")!,
                image: "hwangjaegyun")
            let baejungdae = Player(
                name: "배정대",
                birth: "1995.06.12",
                height: 185,
                weight: 80,
                company: "스타",
                teamName: "KT 위즈",
                number: 27,
                position: "외야수",
                national_entry: false,
                official_page: URL(string: "https://www.ktwiz.co.kr/player/outfielder/detail?pcode=64166")!,
                image: "baejungdae")
            let kimsangsu = Player(
                name: "김상수",
                birth: "1990.03.23",
                height: 175,
                weight: 68,
                company: "스타",
                teamName: "KT 위즈",
                number: 7,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.ktwiz.co.kr/player/infielder/detail?pcode=79402")!,
                image: "kimsangsu")
            let Cuevas = Player(
                name: "쿠에바스",
                birth: "1990.10.14",
                height: 188,
                weight: 98,
                company: "스타",
                teamName: "KT 위즈",
                number: 32,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.ktwiz.co.kr/player/pitcher/detail?pcode=69032")!,
                image: "Cuevas")
            let jangsungwoo = Player(
                name: "장성우",
                birth: "1990.01.17",
                height: 187,
                weight: 100,
                company: "스타",
                teamName: "KT 위즈",
                number: 22,
                position: "포수",
                national_entry: false,
                official_page: URL(string: "https://www.ktwiz.co.kr/player/catcher/detail?pcode=78548")!,
                image: "jangsungwoo")
            let moonsangchul = Player(
                name: "문상철",
                birth: "1991.04.06",
                height: 184,
                weight: 85,
                company: "스타",
                teamName: "KT 위즈",
                number: 24,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.ktwiz.co.kr/player/infielder/detail?pcode=64007")!,
                image: "moonsangchul")
            
            
            context.insert(kangbaekho)
            context.insert(goyoungpyo)
            context.insert(parkyounghyun)
            context.insert(sohyungjun)
            context.insert(hwangjaegyun)
            context.insert(baejungdae)
            context.insert(kimsangsu)
            context.insert(Cuevas)
            context.insert(jangsungwoo)
            context.insert(moonsangchul)
            
            
            context.insert(KBOLeagueTeam(
                id: 5,
                name: "KT 위즈",
                engName: "KT Wiz",
                location: "수원시",
                birthday: "2013년 4월 1일",
                homeStadium: "KT위즈파크",
                manager: "이강철",
                officialURL: URL(string: "https://www.ktwiz.co.kr/")!,
                color: "빨강, 검정",
                logoImage: "KT",
                standings: 6,
                standingsDesc: "43승 3무 39패",
                players: [kangbaekho, goyoungpyo, parkyounghyun, sohyungjun, hwangjaegyun, baejungdae, kimsangsu, Cuevas, jangsungwoo, moonsangchul]
            ))
            
            //삼성
            let goojawook = Player(
                name: "구자욱",
                birth: "1993년 02월 12일",
                height: 184,
                weight: 85,
                company: "스타",
                teamName: "삼성 라이온즈",
                number: 5,
                position: "외야수",
                national_entry: false,
                official_page: URL(string: "https://www.samsunglions.com/roster/roster_2.asp?pcode=A0033")!,
                image: "goojawook")
            let wontaein = Player(
                name: "원태인",
                birth: "2000년 04월 06일",
                height: 183,
                weight: 92,
                company: "스타",
                teamName: "삼성 라이온즈",
                number: 18,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.samsunglions.com/roster/roster_2.asp?pcode=A0399")!,
                image: "wontaein")
            let Diaz = Player(
                name: "디아즈",
                birth: "1996년 11월 19일",
                height: 188,
                weight: 105,
                company: "스타",
                teamName: "삼성 라이온즈",
                number: 0,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.samsunglions.com/roster/roster_2.asp?pcode=A0549")!,
                image: "Diaz")
            let kangminho = Player(
                name: "강민호",
                birth: "1985년 08월 18일",
                height: 185,
                weight: 100,
                company: "스타",
                teamName: "삼성 라이온즈",
                number: 47,
                position: "포수",
                national_entry: false,
                official_page: URL(string: "https://www.samsunglions.com/roster/roster_2.asp?pcode=A0354")!,
                image: "kangminho")
            let leejaehyun = Player(
                name: "이재현",
                birth: "2003년 02월 04일",
                height: 180,
                weight: 82,
                company: "스타",
                teamName: "삼성 라이온즈",
                number: 7,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.samsunglions.com/roster/roster_2.asp?pcode=A0466")!,
                image: "leejaehyun")
            let leeseunghyn = Player(
                name: "이승현",
                birth: "2002년 05월 19일",
                height: 183,
                weight: 102,
                company: "스타",
                teamName: "삼성 라이온즈",
                number: 57,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.samsunglions.com/roster/roster_2.asp?pcode=A0454")!,
                image: "leeseunghyn")
            let leesunggyu = Player(
                name: "이성규",
                birth: "1993년 08월 03일",
                height: 178,
                weight: 82,
                company: "스타",
                teamName: "삼성 라이온즈",
                number: 13,
                position: "외야수",
                national_entry: false,
                official_page: URL(string: "https://www.samsunglions.com/roster/roster_2.asp?pcode=A0245")!,
                image: "leesunggyu")
            let kimjichan = Player(
                name: "김지찬",
                birth: "2001년 03월 08일",
                height: 163,
                weight: 64,
                company: "스타",
                teamName: "삼성 라이온즈",
                number: 58,
                position: "외야수",
                national_entry: false,
                official_page: URL(string: "https://www.samsunglions.com/roster/roster_2.asp?pcode=A0428")!,
                image: "kimjichan")
            let garabito = Player(
                name: "가라비토",
                birth: "1995년 08월 19일",
                height: 183,
                weight: 100,
                company: "스타",
                teamName: "삼성 라이온즈",
                number: 5,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.samsunglions.com/roster/roster_2.asp?pcode=A0587")!,
                image: "garabito")
            let ohsuenghwan = Player(
                name: "오승환",
                birth: "1982년 07월 15일",
                height: 178,
                weight: 93,
                company: "스타",
                teamName: "삼성 라이온즈",
                number: 21,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.samsunglions.com/roster/roster_2.asp?pcode=A0432")!,
                image: "ohsuenghwan")
            
            
            context.insert(goojawook)
            context.insert(wontaein)
            context.insert(Diaz)
            context.insert(kangminho)
            context.insert(leejaehyun)
            context.insert(leeseunghyn)
            context.insert(leesunggyu)
            context.insert(kimjichan)
            context.insert(garabito)
            context.insert(ohsuenghwan)
            
            context.insert(KBOLeagueTeam(
                id: 6,
                name: "삼성 라이온즈",
                engName: "Samsung Lions",
                location: "대구광역시",
                birthday: "1982년 2월 3일",
                homeStadium: "삼성 라이온즈 파크",
                manager: "박진만",
                officialURL: URL(string: "https://www.samsunglions.com/")!,
                color: "파랑, 회색",
                logoImage: "Samsung",
                standings: 7,
                standingsDesc: "43승 1무 40패",
                players: [goojawook, wontaein, Diaz, kangminho, leejaehyun, leeseunghyn, leesunggyu, kimjichan]
            ))
            
            // NC
            let sonasup = Player(
                name: "손아섭",
                birth: "1988년 03월 18일",
                height: 174,
                weight: 84,
                company: "스타",
                teamName: "NC 다이노스",
                number: 31,
                position: "외야수",
                national_entry: false,
                official_page: URL(string: "https://www.ncdinos.com/player/all/view.do?playerId=890")!,
                image: "sonasup")
            let parkminwoo = Player(
                name: "박민우",
                birth: "1993년 02월 06일",
                height: 185,
                weight: 80,
                company: "스타",
                teamName: "NC 다이노스",
                number: 2,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.ncdinos.com/player/infielder/view.do?playerId=876")!,
                image: "parkminwoo")
            let goochangmo = Player(
                name: "구창모",
                birth: "1997년 02월 17일",
                height: 183,
                weight: 85,
                company: "스타",
                teamName: "NC 다이노스",
                number: 59,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.ncdinos.com/player/pitcher/view.do?playerId=894")!,
                image: "goochangmo")
            let kimjuwon = Player(
                name: "김주원",
                birth: "2002년 07월 30일",
                height: 185,
                weight: 83,
                company: "스타",
                teamName: "NC 다이노스",
                number: 7,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.ncdinos.com/player/infielder/view.do?playerId=872")!,
                image: "kimjuwon")
            let kimhyungjun = Player(
                name: "김형준",
                birth: "1999년 11월 02일",
                height: 187,
                weight: 98,
                company: "스타",
                teamName: "NC 다이노스",
                number: 25,
                position: "포수",
                national_entry: false,
                official_page: URL(string: "https://www.ncdinos.com/player/catcher/view.do?playerId=867")!,
                image: "kimhyungjun")
            let leeyongchan = Player(
                name: "이용찬",
                birth: "1989년 01월 02일",
                height: 185,
                weight: 85,
                company: "스타",
                teamName: "NC 다이노스",
                number: 45,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.ncdinos.com/player/pitcher/view.do?playerId=855")!,
                image: "leeyongchan")
            let RILEY = Player(
                name: "라일리",
                birth: "1996년 07월 09일",
                height: 190,
                weight: 100,
                company: "스타",
                teamName: "NC 다이노스",
                number: 3,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.ncdinos.com/player/pitcher/view.do?playerId=865")!,
                image: "RILEY")
            let seohochul = Player(
                name: "서호철",
                birth: "1996년 10월 16일",
                height: 179,
                weight: 85,
                company: "스타",
                teamName: "NC 다이노스",
                number: 5,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.ncdinos.com/player/infielder/view.do?playerId=877")!,
                image: "seohochul")
            let parkgunwoo = Player(
                name: "박건우",
                birth: "1990년 09월 08일",
                height: 184,
                weight: 80,
                company: "스타",
                teamName: "NC 다이노스",
                number: 37,
                position: "외야수",
                national_entry: false,
                official_page: URL(string: "https://www.ncdinos.com/player/outfielder/view.do?playerId=886")!,
                image: "parkgunwoo")
            let ryujinwook = Player(
                name: "류진욱",
                birth: "1996년 10월 10일",
                height: 189,
                weight: 88,
                company: "스타",
                teamName: "NC 다이노스",
                number: 41,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.ncdinos.com/player/pitcher/view.do?playerId=844")!,
                image: "ryujinwook")
            
            context.insert(sonasup)
            context.insert(parkminwoo)
            context.insert(goochangmo)
            context.insert(kimjuwon)
            context.insert(kimhyungjun)
            context.insert(leeyongchan)
            context.insert(RILEY)
            context.insert(seohochul)
            context.insert(parkgunwoo)
            context.insert(ryujinwook)
            
            context.insert(KBOLeagueTeam(
                id: 7,
                name: "NC 다이노스",
                engName: "NC Dinos",
                location: "창원시",
                birthday: "2011년 3월 31일",
                homeStadium: "NC파크",
                manager: "이호준",
                officialURL: URL(string: "https://www.ncdinos.com/")!,
                color: "네이비, 골드",
                logoImage: "NC",
                standings: 8,
                standingsDesc: "36승 5무 40패",
                players: [sonasup, parkminwoo, goochangmo, kimjuwon, kimhyungjun, leeyongchan, RILEY, seohochul, parkgunwoo, ryujinwook]
            ))
            
            // 두산
            let yanguiji = Player(
                name: "양의지",
                birth: "1987-06-05",
                height: 180,
                weight: 95,
                company: "스타",
                teamName: "두산 베어스",
                number: 25,
                position: "포수",
                national_entry: false,
                official_page: URL(string: "https://www.doosanbears.com/member/batters/76232")!,
                image: "yanguiji")
            let kimjaehwan = Player(
                name: "김재환",
                birth: "1988-09-22",
                height: 183,
                weight: 90,
                company: "스타",
                teamName: "두산 베어스",
                number: 32,
                position: "외야수",
                national_entry: false,
                official_page: URL(string: "https://www.doosanbears.com/member/batters/78224")!,
                image: "kimjaehwan")
            let jungsubin = Player(
                name: "정수빈",
                birth: "1990-10-07",
                height: 175,
                weight: 70,
                company: "스타",
                teamName: "두산 베어스",
                number: 31,
                position: "외야수",
                national_entry: false,
                official_page: URL(string: "https://www.doosanbears.com/member/batters/79231")!,
                image: "jungsubin")
            let yangsukhwan = Player(
                name: "양석환",
                birth: "1991-07-15",
                height: 185,
                weight: 90,
                company: "스타",
                teamName: "두산 베어스",
                number: 53,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.doosanbears.com/member/batters/64153")!,
                image: "yangsukhwan")
            let gwakbin = Player(
                name: "곽빈",
                birth: "1999-05-28",
                height: 187,
                weight: 95,
                company: "스타",
                teamName: "두산 베어스",
                number: 47,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.doosanbears.com/member/pitchers/68220")!,
                image: "gwakbin")
            let parkchiguk = Player(
                name: "박치국",
                birth: "1998-03-10",
                height: 177,
                weight: 78,
                company: "스타",
                teamName: "두산 베어스",
                number: 1,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.doosanbears.com/member/pitchers/67266")!,
                image: "parkchiguk")
            let choisuengyong = Player(
                name: "최승용",
                birth: "2001-05-11",
                height: 190,
                weight: 87,
                company: "스타",
                teamName: "두산 베어스",
                number: 28,
                position: "투수",
                national_entry: false,
                official_page: URL(string: "https://www.doosanbears.com/member/pitchers/51264")!,
                image: "choisuengyong")
            let leeyuchan = Player(
                name: "이유찬",
                birth: "1998-08-05",
                height: 175,
                weight: 68,
                company: "스타",
                teamName: "두산 베어스",
                number: 13,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.doosanbears.com/member/batters/67207")!,
                image: "leeyuchan")
            let kangsuengho = Player(
                name: "강승호",
                birth: "1994-02-09",
                height: 178,
                weight: 88,
                company: "스타",
                teamName: "두산 베어스",
                number: 23,
                position: "내야수",
                national_entry: false,
                official_page: URL(string: "https://www.doosanbears.com/member/batters/63123")!,
                image: "kangsuengho")
            let cave = Player(
                name: "케이브",
                birth: "1992-12-04",
                height: 183,
                weight: 90,
                company: "스타",
                teamName: "두산 베어스",
                number: 8,
                position: "외야수",
                national_entry: false,
                official_page: URL(string: "https://www.doosanbears.com/member/batters/55208")!,
                image: "cave")
            
            context.insert(yanguiji)
            context.insert(kimjaehwan)
            context.insert(jungsubin)
            context.insert(yangsukhwan)
            context.insert(gwakbin)
            context.insert(parkchiguk)
            context.insert(choisuengyong)
            context.insert(leeyuchan)
            context.insert(kangsuengho)
            context.insert(cave)
            
            context.insert(KBOLeagueTeam(
                id: 8,
                name: "두산 베어스",
                engName: "Doosan Bears",
                location: "서울특별시",
                birthday: "1982년 1월 15일",
                homeStadium: "잠실 야구장",
                manager: "조성환",
                officialURL: URL(string: "https://www.doosanbears.com/")!,
                color: "네이비, 빨강",
                logoImage: "Doosan",
                standings: 9,
                standingsDesc: "33승 3무 48패",
                players: [yanguiji, kimjaehwan, jungsubin, yangsukhwan, gwakbin, parkchiguk, choisuengyong, leeyuchan, kangsuengho, cave]
            ))
        }
    }
}

// SwiftUI 프리뷰
#Preview {
    LoginView()
} 
