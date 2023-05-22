//
//  ContentView.swift
//  HealthPT-iOS
//
//  Created by 정승균 on 2023/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
