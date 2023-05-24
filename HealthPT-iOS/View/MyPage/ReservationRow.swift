//
//  ReservationRow.swift
//  HealthPT-iOS
//
//  Created by 정승균 on 2023/05/24.
//

import SwiftUI

struct ReservationRow: View {
    let resevedDate: String
    let trainerName: String
    let gymName: String
    
    var body: some View {
        VStack(spacing: 15) {
            Text(resevedDate)
            HStack {
                Text(trainerName)
                Spacer()
                Text(gymName)
            }
        }
        .padding()
    }
}

struct ReservationRow_Previews: PreviewProvider {
    static var previews: some View {
        ReservationRow(resevedDate: "2023/04/16 18:00", trainerName: "박영현", gymName: "경산시 하양읍 크리스 컨테이너")
    }
}
