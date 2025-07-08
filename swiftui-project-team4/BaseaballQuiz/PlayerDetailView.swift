//
//  PlayerDetailView.swift
//  BaseaballQuiz
//
//  Created by 박성관 on 7/7/25.
//

import SwiftUI

struct PlayerDetailView: View {
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("타자").bold() .font(.largeTitle)) {
                    HStack {
                        Text("이름")
                        Text("홈런")
                        Text("타수")
                        Text("안타")
                        Text("타점")
                        Text("득점")
                        Text("도루")
                        Text("출루율")
                        }
                    HStack {
                        Text("이름")
                        Text("홈런")
                        Text("타수")
                        Text("안타")
                        Text("타점")
                        Text("득점")
                        Text("도루")
                        Text("출루율")
                        }
                    HStack {
                        Text("이름")
                        Text("홈런")
                        Text("타수")
                        Text("안타")
                        Text("타점")
                        Text("득점")
                        Text("도루")
                        Text("출루율")
                        }
                    HStack {
                        Text("이름")
                        Text("홈런")
                        Text("타수")
                        Text("안타")
                        Text("타점")
                        Text("득점")
                        Text("도루")
                        Text("출루율")
                        }
                    HStack {
                        Text("이름")
                        Text("홈런")
                        Text("타수")
                        Text("안타")
                        Text("타점")
                        Text("득점")
                        Text("도루")
                        Text("출루율")
                        }
                    HStack {
                        Text("이름")
                        Text("홈런")
                        Text("타수")
                        Text("안타")
                        Text("타점")
                        Text("득점")
                        Text("도루")
                        Text("출루율")
                        }
                    HStack {
                        Text("이름")
                        Text("홈런")
                        Text("타수")
                        Text("안타")
                        Text("타점")
                        Text("득점")
                        Text("도루")
                        Text("출루율")
                        }
                    }
                Section(header: Text("투수").bold() .font(.largeTitle)) {
                    HStack {
                            Text("평균자책점")
                            Text("승")
                            Text("패")
                            Text("이닝")
                            Text("탈삼진")
                            Text("피안타")
                            Text("피홈런")
                            Text("볼넷")
                            }
                    .font(.subheadline)
                        HStack {
                            Text("이름")
                            Text("홈런")
                            Text("타수")
                            Text("안타")
                            Text("타점")
                            Text("득점")
                            Text("도루")
                            Text("출루율")
                            }
                        HStack {
                            Text("이름")
                            Text("홈런")
                            Text("타수")
                            Text("안타")
                            Text("타점")
                            Text("득점")
                            Text("도루")
                            Text("출루율")
                            }
                        HStack {
                            Text("이름")
                            Text("홈런")
                            Text("타수")
                            Text("안타")
                            Text("타점")
                            Text("득점")
                            Text("도루")
                            Text("출루율")
                            }
                        HStack {
                            Text("이름")
                            Text("홈런")
                            Text("타수")
                            Text("안타")
                            Text("타점")
                            Text("득점")
                            Text("도루")
                            Text("출루율")
                            }
                        HStack {
                            Text("이름")
                            Text("홈런")
                            Text("타수")
                            Text("안타")
                            Text("타점")
                            Text("득점")
                            Text("도루")
                            Text("출루율")
                            }
                }
            }
        }
    }
}

#Preview {
    PlayerDetailView()
}
