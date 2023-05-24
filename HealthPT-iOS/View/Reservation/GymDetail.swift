//
//  GymDetail.swift
//  HealthPT-iOS
//
//  Created by 정승균 on 2023/05/24.
//

import SwiftUI

struct GymDetail: View {
    var body: some View {
        VStack {
            List {
                ForEach(0..<3) { _ in
                    TrainerRow(trainerName: "박영현", trainerPhoneNumber: "010-0000-0000")
                        .padding(.bottom)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.inset)
        }
    }
}

struct GymDetail_Previews: PreviewProvider {
    static var previews: some View {
        GymDetail()
    }
}
