//
//  TrainerRow.swift
//  HealthPT-iOS
//
//  Created by 정승균 on 2023/05/24.
//

import SwiftUI

struct TrainerRow: View {
    let trainerName: String
    let trainerPhoneNumber: String
    @State var isLiked: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 100)
                    
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("이름 : ") + Text(trainerName)
                    Text("전화번호 : ") + Text(trainerPhoneNumber)
                }
                
            }
            HStack {
                LikeButton
            }
        }
        .padding()
    }
}

extension TrainerRow {
    private var LikeButton: some View {
        Label {
            Text("예약하기")
                .foregroundColor(.white)
                .bold()
        } icon: {
            Image(systemName: "heart.fill")
                .foregroundColor(isLiked ? .red : .secondary)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(Color.accentColor.opacity(0.5))
        .cornerRadius(8)
        .onTapGesture {
            isLiked.toggle()
        }
    }
    
    private var ReservationButton: some View {
        Nav
        Label {
            Text("예약하기")
                .foregroundColor(.white)
                .bold()
        } icon: {
            Image(systemName: "heart.fill")
                .foregroundColor(isLiked ? .red : .secondary)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(Color.accentColor.opacity(0.5))
        .cornerRadius(8)
        .onTapGesture {
            isLiked.toggle()
        }
    }
}

struct TrainerRow_Previews: PreviewProvider {
    static var previews: some View {
        TrainerRow(trainerName: "박영현", trainerPhoneNumber: "010-0000-0000")
    }
}
