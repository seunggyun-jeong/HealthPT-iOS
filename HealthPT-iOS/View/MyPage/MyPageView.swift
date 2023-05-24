//
//  MyPageView.swift
//  HealthPT-iOS
//
//  Created by 정승균 on 2023/05/24.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        List {
            ForEach(0..<3) { _ in
                ReservationRow(resevedDate: "2023/05/16 18:00", trainerName: "박영현", gymName: "경산시 하양읍 크리스 컨테이너")
            }
        }
        .navigationTitle("마이페이지")
        .navigationBarTitleDisplayMode(.large)
        .listStyle(.plain)
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
