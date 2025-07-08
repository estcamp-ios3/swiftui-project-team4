//
//  PlayerDetailView.swift
//  BaseaballQuiz
//
//  Created by 박성관 on 7/7/25.
//

import SwiftUI
import Foundation

struct PlayerDetailView: View {
    var isPicher: Bool = false
    
    
    var body: some View {
        @State var position: String = ""
        
        NavigationStack {
            ZStack {
                Form {
                    if isPicher {
                        Section(header: Text("타자").kerning(4) .bold() .font(.largeTitle)) {
                            Group {
                                HStack {
                                    AsyncImage(url: URL(string: "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/middle/2025/53123.jpg")) { image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 80, height: 100)
                                    .padding(3)
                                    
                                    
                                    VStack (alignment: .leading) {
                                        HStack {
                                            Text("이  름 :")
                                                .kerning(1)
                                            
                                            Text("오스틴")
                                                .kerning(2)
                                            
                                        }
                                        .font(.title2)
                                        .padding(0.5)
                                        HStack {
                                            Text("포지션 :")
                                                .kerning(2.5)
                                            
                                            Text("내야수(우투우타)")
                                                .kerning(2)
                                            
                                        }
                                        
                                        HStack {
                                            Text("출   생 :")
                                                .kerning(2)
                                            
                                            Text("1999-07-02")
                                                .kerning(1)
                                        }
                                        HStack {
                                            Text("체   격 :")
                                                .kerning(2)
                                            
                                            Text("183cm, 85kg")
                                                .kerning(1)
                                        }
                                    }
                                    .padding(2)
                                }
                            }
                            ScrollView(.horizontal) {
                                HStack {
                                    VStack {
                                        Text("타율")
                                            .kerning(2)
                                        
                                        Text("0")
                                    }
                                    VStack {
                                        Text("홈런")
                                            .kerning(2)
                                        
                                        Text("0")
                                    }
                                    VStack {
                                        Text("타수")
                                            .kerning(2)
                                        
                                        Text("0")
                                    }
                                    VStack {
                                        Text("안타")
                                            .kerning(2)
                                        
                                        Text("0")
                                    }
                                    VStack {
                                        Text("타점")
                                            .kerning(2)
                                        
                                        Text("0")
                                    }
                                    VStack {
                                        Text("득점")
                                            .kerning(2)
                                        
                                        Text("0")
                                    }
                                    VStack {
                                        Text("도루")
                                            .kerning(2)
                                        
                                        Text("0")
                                    }
                                    VStack {
                                        Text("출루율")
                                            .kerning(2)
                                        
                                        Text("0")
                                    }
                                    VStack {
                                        Text("OPS")
                                            .kerning(2)
                                        
                                        Text("0")
                                    }
                                }
                            }
                        }
                    } else {
                        
                        Section(header: Text("투수").kerning(4) .bold() .font(.largeTitle)) {
                            Group {
                                HStack {
                                    AsyncImage(url: URL(string: "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/middle/2025/53123.jpg")) { image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 80, height: 100)
                                    .padding(3)
                                    
                                    
                                    VStack (alignment: .leading) {
                                        HStack {
                                            Text("이  름 :")
                                                .kerning(1)
                                            
                                            Text("오스틴")
                                                .kerning(2)
                                            
                                        }
                                        .font(.title2)
                                        .padding(0.5)
                                        HStack {
                                            Text("포지션 :")
                                                .kerning(2.5)
                                            
                                            Text("내야수(우투우타)")
                                                .kerning(2)
                                            
                                        }
                                        
                                        HStack {
                                            Text("출   생 :")
                                                .kerning(2)
                                            
                                            Text("1999-07-02")
                                                .kerning(1)
                                        }
                                        HStack {
                                            Text("체   격 :")
                                                .kerning(2)
                                            
                                            Text("183cm, 85kg")
                                                .kerning(1)
                                        }
                                    }
                                    .padding(2)
                                }
                            }
                            ScrollView(.horizontal) {
                                HStack {
                                    VStack {
                                        Text("평균자책점")
                                            .kerning(2)
                                        
                                        Text("0")
                                    }
                                    VStack {
                                        Text("승")
                                            .kerning(2)
                                        
                                        Text("0")
                                    }
                                    VStack {
                                        Text("패")
                                            .kerning(2)
                                        
                                        Text("0")
                                    }
                                    VStack {
                                        Text("이닝")
                                            .kerning(2)
                                        
                                        Text("0")
                                    }
                                    VStack {
                                        Text("탈삼진")
                                            .kerning(2)
                                        
                                        Text("0")
                                    }
                                    VStack {
                                        Text("피안타")
                                            .kerning(2)
                                        
                                        Text("0")
                                    }
                                    VStack {
                                        Text("피홈런")
                                            .kerning(2)
                                        
                                        Text("0")
                                    }
                                    VStack {
                                        Text("볼넷")
                                            .kerning(2)
                                        
                                        Text("0")
                                    }
                                    VStack {
                                        Text("WHIP")
                                            .kerning(2)
                                        
                                        Text("0")
                                    }
                                    VStack {
                                        Text("세이브")
                                            .kerning(2)
                                        
                                        Text("0")
                                    }
                                    VStack {
                                        Text("완봉승")
                                            .kerning(2)
                                        
                                        Text("0")
                                    }
                                }
                            }
                        }
                    }
                }
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                }
            }
        }
    }
    
#Preview {
    PlayerDetailView()
}



