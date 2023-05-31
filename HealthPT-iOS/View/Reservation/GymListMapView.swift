//
//  GymListMapView.swift
//  HealthPT-iOS
//
//  Created by 정승균 on 2023/05/29.
//

import SwiftUI
import MapKit

struct GymListMapView: View {
    @StateObject var viewModel = ContentViewModel()
    @State var showModal: Bool = false
    @State var isGymSeleted: Bool = false
    @State var showTrainerList: Bool = false
    @State var selectedGym: Gym = Gym(id: 0, gymName: "", gymWeekday: "", gymWeekend: "", gymInfo: "", gymLocation: "", gymPrice: "", gymEvent: "", gymNumber: "", latitude: 0, longitude: 0)
    
    @StateObject var gymModel: GymModel = GymModel()
    
    @State var stack = NavigationPath()
    struct test: Identifiable {
        var id: String = UUID().uuidString
        var content: String
        var coordinate: CLLocationCoordinate2D
    }
    
    let testList: [test] = [.init(content: "he", coordinate: .init(latitude: 36.0141446, longitude: 129.328)), .init(content: "hi", coordinate: .init(latitude: 36.0141446, longitude: 129.3257511))]
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true , annotationItems: gymModel.gymList) { item in
                MapAnnotation(coordinate: item.coordinate) {
                    VStack {
                        Image(systemName: "circle.fill")
                        Text(item.gymName)
                    }
                    .onTapGesture {
                        selectedGym = item
                        showModal.toggle()
                    }
                }
            }
            
            VStack {
                TextBar()
                    .zIndex(1)
                    .clipShape(RoundedRectangle(cornerRadius: 11))
                    .overlay {
                        RoundedRectangle(cornerRadius: 8).stroke(.gray, lineWidth: 0)
                    }
                    .shadow(color: .secondary, radius: 3, x: 0, y: 3)
                Spacer()
            }
        }
        .sheet(isPresented: $showModal, onDismiss: didDismiss) {
            GymDetail(gym: $selectedGym, isSelected: $isGymSeleted)
        }
        .fullScreenCover(isPresented: $showTrainerList, content: {
            TrainerList(dismissButton: $showTrainerList, gym: $selectedGym)
        })
    }
    
    func didDismiss() {
        if isGymSeleted {
            showTrainerList.toggle()
            isGymSeleted = false
        }
    }
}

struct TextBar: View {
    @State private var placeAddress: String = ""
    
    var body: some View {
        ZStack {
            HStack {
                TextField("키워드 검색", text: $placeAddress)
                    .background(.white)
                    .frame(width: 280, height: 56.0)
                    .padding(.leading, 30)
                
                Image(systemName: "magnifyingglass")
                    .padding(.trailing, 30)
            }
            .zIndex(1)
            
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 0)
                .frame(width: 358, height: 56)
                .background(.white)
        }

    }
}

struct GymListMapView_Previews: PreviewProvider {
    static var previews: some View {
        GymListMapView()
    }
}

final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager?
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.9088931, longitude: 128.8137027), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    func checkIfLoactionServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("Show an alert letting them know this is off and to go turn it on.")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restriced likely due to parental controls.")
        case .denied:
            print("Your location is denied.")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
