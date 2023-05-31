//
//  GymDetail.swift
//  HealthPT-iOS
//
//  Created by 정승균 on 2023/05/24.
//

import SwiftUI

struct TrainerList: View {
    @Binding var dismissButton: Bool
    @Binding var gym: Gym
    @State var trainers: [Trainer] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(gym.gymName)
                    .font(.title)
                    .bold()
                
                List {
                    ForEach(trainers) { trainer in
                        TrainerRow(trainerName: trainer.trainerName, trainerPhoneNumber: trainer.trainerPhone_Number)
                            .padding(.bottom)
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.inset)
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("취소") {
                        dismissButton.toggle()
                    }
                }
            }
        }
        .onAppear {
            NetworkManager.loadTrainerList(gymId: gym.id) { trainers in
                self.trainers = trainers
            }
        }
    }
}

struct TrainerList_Previews: PreviewProvider {
    static var previews: some View {
        TrainerList(dismissButton: .constant(false), gym: .constant(.init(id: 0, gymName: "", gymWeekday: "", gymWeekend: "", gymInfo: "", gymLocation: "", gymPrice: "", gymEvent: "", gymNumber: "", latitude: 0, longitude: 0)))
    }
}
