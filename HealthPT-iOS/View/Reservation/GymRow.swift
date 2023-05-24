//
//  GymRow.swift
//  HealthPT-iOS
//
//  Created by 정승균 on 2023/05/22.
//

import SwiftUI

struct GymRow: View {
    var body: some View {
        HStack {
            Circle()
                .frame(width: 100)
            
            Spacer()
            VStack(alignment: .leading) {
                Text("헬스장 이름: 크리스 컨테이너")
                Text("헬스장 정보: 바디프로필, 다이어트, 크로스핏 전문")
            }
        }
    }
}

struct GymRow_Previews: PreviewProvider {
    static var previews: some View {
        GymRow()
    }
}
