//
//  Gym.swift
//  HealthPT-iOS
//
//  Created by 정승균 on 2023/05/31.
//

import Foundation
import CoreLocation

class GymModel: ObservableObject {
    @Published var gymList: [Gym] = [.init(id: 1, gymName: "크리스컨테이너", gymWeekday: "평일 : 오전 9시 ~ 오후 11시 30분", gymWeekend: "주말 : 오전 9시 ~ 오후 6시", gymInfo: "바디프로필 전문", gymLocation: "경상북도 경산시 하양읍", gymPrice: "1개월 20만원", gymEvent: "없음", gymNumber: "010-1234-5678", latitude: 35.9088931, longitude: 128.8137027)]
    
    init() {
        print("============= gymModel Init ============")
        getGymList()
    }
    
    private func getGymList() {
        // 짐 리스트 불러오기
        NetworkManager.loadKeywordSearch(api: "/api/default_gym") { gym in
            self.gymList = gym
            print("======= 짐 리스트 ======")
            print(self.gymList)
            print("======= 짐 리스트 끝======")
        }
    }
}

struct Gym: Identifiable, Codable {
    var id: Int
    var gymName: String
    var gymWeekday: String
    var gymWeekend: String
    var gymInfo: String
    var gymLocation: String
    var gymPrice: String
    var gymEvent: String
    var gymNumber: String
    var latitude: Double
    var longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
