//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by PeterPachMu on 13/03/23.
//

import SwiftUI

@main //Punto de inicio de una aplicacion
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
