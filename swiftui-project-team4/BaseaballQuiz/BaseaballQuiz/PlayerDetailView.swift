//
//  PlayerDetailView.swift
//  BaseaballQuiz
//
//  Created by 박성관 on 7/7/25.
//

import SwiftUI

struct PlayerDetailView: View {
    
    var body: some View {
        @State var position: String = ""
        
        
        NavigationStack {
            Form {
                Section(header: Text("타자").bold() .font(.largeTitle)) {
                    
                    
                    Group {
                        HStack {
                            AsyncImage(url: URL(string: "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/middle/2025/53123.jpg")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 70, height: 100)
                            
                            Grid {
                                GridRow {
                                    Text("이   름 :")
                                    Text("오스틴")
                                }
                                
                                GridRow {
                                    Text("포지션 :")
                                    Text("내야수(우투우타)")
                                }
                                
                                GridRow {
                                    Text("출   생 :")
                                    Text("1999-07-02")
                                }
                                GridRow {
                                    Text("체   격 :")
                                    Text("183cm, 85kg")
                                }
                            }
                            .padding(1)
                        }
                        
                        
                    }
                    
                    HStack {
                        Text("홈런")
                        Text("타수")
                        Text("안타")
                        Text("타점")
                        Text("득점")
                        Text("도루")
                        Text("출루율")
                    }
                    .font(.headline)
                    
                    HStack {
                        Text("  0  ")
                        Text("  0  ")
                        Text("  0  ")
                        Text("  0  ")
                        Text("   0   ")
                        Text("  0  ")
                        Text("    0   ")
                        
                        
                        }
                    }
                Section(header: Text("투수").bold() .font(.largeTitle)) {
                    
                    
                    Group {
                        HStack {
                            AsyncImage(url: URL(string: "https://6ptotvmi5753.edge.naverncp.com/KBO_IMAGE/person/middle/2025/69159.jpg")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 70, height: 100)
                            Grid {
                                GridRow {
                                    Text("이   름 :")
                                    Text("정우영")
                                }
                                
                                GridRow {
                                    Text("포지션 :")
                                    Text("투수")
                                }
                                
                                GridRow {
                                    Text("출   생 :")
                                    Text("1999-09-19")
                                }
                                GridRow {
                                    Text("체   격 :")
                                    Text("193cm, 99kg")
                                }
                            }
                            .padding(1)
                        }
                        
                        
                    }
                    HStack {
                        Text("평균자책점")
                        Text(" 승 ")
                        Text(" 패 ")
                        Text(" 이닝 ")
                        Text(" 피안타 ")
                        Text("볼넷")
                    }
                    .font(.headline)
                    
                    HStack {
                        Text("       0      ")
                        Text("  0  ")
                        Text("  0  ")
                        Text("  0  ")
                        Text("      0     ")
                        Text("  0  ")
                        
                        
                        }
                    }
                }
            }
        }
    }


#Preview {
    PlayerDetailView()
}
