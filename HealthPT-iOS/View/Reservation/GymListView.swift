//
//  GymListView.swift
//  HealthPT-iOS
//
//  Created by 정승균 on 2023/05/22.
//

import SwiftUI

struct GymListView: View {
    var body: some View {
        NavigationStack {
            VStack {
                TextField("🔍 키워드를 검색해 주세요.", text: .constant(""))
                    .padding(.horizontal, 30)
                    .textFieldStyle(.roundedBorder)
                
                Text("📍 내 위치 : ~~")
                
                List {
                    ForEach(0..<4, id: \.self) { i in
                        NavigationLink {
//                            TrainerList(dismissButton: .constant(false), gymName: .constant(""))
                        } label: {
                            GymRow()
                                .padding(.bottom)
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.inset)
            }
            .navigationTitle("헬스장 리스트")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        MyPageView()
                    } label: {
                        Label("마이페이지", systemImage: "person.crop.circle")
                    }
                }
            }
        }
    }
}

struct GymListView_Previews: PreviewProvider {
    static var previews: some View {
        GymListView()
    }
}
