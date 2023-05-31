//
//  GymDetail.swift
//  HealthPT-iOS
//
//  Created by 정승균 on 2023/05/31.
//

import SwiftUI

struct GymDetail: View {
    @Binding var gym: Gym
    @Binding var isSelected: Bool
    
    @Environment(\.dismiss) var dissmiss
    
    var body: some View {
        VStack {
            Group {
                Text(gym.gymName)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 15)
                Text("영업 시간")
                    .bold()
                Text(gym.gymWeekday)
                    .padding(.bottom, 10)
                
                Text("휴일")
                    .bold()
                Text(gym.gymWeekend)
                    .padding(.bottom, 10)
            }
            
            Group {
                Text("헬스장 정보")
                    .bold()
                Text(gym.gymInfo)
                    .padding(.bottom, 10)
                
                Text("헬스장 위치")
                    .bold()
                Text(gym.gymLocation)
                    .padding(.bottom, 10)
                
                Text("가격")
                    .bold()
                Text(gym.gymPrice)
                    .padding(.bottom, 10)
                
                Text("이벤트")
                    .bold()
                Text(gym.gymEvent)
                    .padding(.bottom, 10)
                
                Text("연락처")
                    .bold()
                Text(gym.gymNumber)
                    .padding(.bottom, 20)
            }
            
            Button {
                isSelected.toggle()
                dissmiss()
            } label: {
                Text("헬스장 선택하기")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .bold()
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 10)
        }
        .onAppear {
            print(gym)
        }
    }
}

struct GymDetail_Previews: PreviewProvider {
    static var previews: some View {
        GymDetail(gym: .constant(.init(id: 1, gymName: "크리스컨테이너", gymWeekday: "평일 : 오전 9시 ~ 오후 11시 30분", gymWeekend: "주말 : 오전 9시 ~ 오후 6시", gymInfo: "바디프로필 전문", gymLocation: "경상북도 경산시 하양읍", gymPrice: "1개월 20만원", gymEvent: "없음", gymNumber: "010-1234-5678", latitude: 35.9088931, longitude: 128.8137027)), isSelected: .constant(false))
    }
}
