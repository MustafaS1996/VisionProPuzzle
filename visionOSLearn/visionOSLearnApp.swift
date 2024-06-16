//
//  visionOSLearnApp.swift
//  visionOSLearn
//
//  Created by Mustafa on 9/10/23.
//

import SwiftUI

@main
struct visionOSLearnApp: App {
    var body: some Scene {
        WindowGroup {
            SphereView()
        }.windowStyle(.volumetric)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }

}
