//
//  SphereView.swift
//  visionOSLearn
//
//  Created by Mustafa on 9/10/23.
//

import RealityKit
import RealityKitContent
import SwiftUI


struct SphereView: View {
    @State private var scale = true
    
    @State private var enlarge = true
    @State private var showImmersiveSpace = true
    @State private var immersiveSpaceIsShown = true

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        
        RealityView { content in
//            //FLOOR
//            let floor = ModelEntity(mesh: .generatePlane(width: 50, depth: 50), materials: [OcclusionMaterial()])
//            floor.generateCollisionShapes(recursive: true)
//            floor.components[PhysicsBodyComponent.self] = .init(
//                massProperties: .default,
//                mode: .static
//            )
//            
            //content.add(floor)
            var modelA:ModelEntity?, modelB:ModelEntity?, modelC:ModelEntity?, modelD:ModelEntity?, modelE:ModelEntity?, modelF:ModelEntity?
            
            // MODEL A
            async let usdzModelEntityA = ModelEntity(named: "A.usdz")
            if let usdzModelEntityA = try? await usdzModelEntityA {
                usdzModelEntityA.name = "A"
                
                usdzModelEntityA.generateCollisionShapes(recursive: true)
                usdzModelEntityA.components.set(InputTargetComponent())
                usdzModelEntityA.scale = [0.5, 0.5, 0.5]
                usdzModelEntityA.position = .init(0,0,0)
                
//                usdzModelEntityA.components[PhysicsBodyComponent.self] = .init(PhysicsBodyComponent(
//                    massProperties: .default,
//                    material: .generate(staticFriction: 0.8, dynamicFriction: 0.5, restitution: 0.1),
//                        mode: .dynamic
//                ))
                usdzModelEntityA.components[PhysicsMotionComponent.self] = .init()
                
                modelA = usdzModelEntityA
                
                //content.add(modelA)
                let tranform = Transform(pitch: 0, yaw: 0, roll: .pi)
//                usdzModelEntityA.playAnimation(<#T##animation: AnimationResource##AnimationResource#>, transitionDuration: <#T##TimeInterval#>, startsPaused: <#T##Bool#>)
                
                //content.add(usdzModelEntityA)

            }

            // MODEL B
            async let usdzModelEntityB = ModelEntity(named: "B.usdz")
            if let usdzModelEntityB = try? await usdzModelEntityB {
                usdzModelEntityB.name = "B"

                usdzModelEntityB.generateCollisionShapes(recursive: true)
                usdzModelEntityB.components.set(InputTargetComponent())
                usdzModelEntityB.transform.scale = [0.5, 0.5, 0.5]

//                usdzModelEntityB.components[PhysicsBodyComponent.self] = .init(PhysicsBodyComponent(
//                    massProperties: .default,
//                    material: .generate(staticFriction: 0.8, dynamicFriction: 0.5, restitution: 0.1),
//                        mode: .dynamic
//                ))
//                usdzModelEntityB.components[PhysicsMotionComponent.self] = .init()
                modelB = usdzModelEntityB

                //content.add(usdzModelEntityB)
            }

            async let usdzModelEntityC = ModelEntity(named: "C.usdz")
            if let usdzModelEntityC = try? await usdzModelEntityC {
                usdzModelEntityC.name = "C"
                
                usdzModelEntityC.generateCollisionShapes(recursive: true)
                usdzModelEntityC.components.set(InputTargetComponent())
                usdzModelEntityC.transform.scale = [0.5, 0.5, 0.5]
                
//                usdzModelEntityC.components[PhysicsBodyComponent.self] = .init(PhysicsBodyComponent(
//                    massProperties: .default,
//                    material: .generate(staticFriction: 0.8, dynamicFriction: 0.5, restitution: 0.1),
//                        mode: .dynamic
//                ))
//                usdzModelEntityC.components[PhysicsMotionComponent.self] = .init()
                modelC = usdzModelEntityC

                //content.add(usdzModelEntityC)

            }
            
            async let usdzModelEntityD = ModelEntity(named: "D.usdz")
            if let usdzModelEntityD = try? await usdzModelEntityD {
                usdzModelEntityD.name = "D"

                usdzModelEntityD.generateCollisionShapes(recursive: true)
                usdzModelEntityD.components.set(InputTargetComponent())
                usdzModelEntityD.transform.scale = [0.5, 0.5, 0.5]
                //usdzModelEntityD.position.y -= 0.25

                
                let transform = Transform(roll:0)
                usdzModelEntityD.move(to: transform, relativeTo: usdzModelEntityD) /*duration: 2, timingFunction: .linear)*/
//                usdzModelEntityD.move(to: usdzModelEntityD.position += SIMD3<Float>(-5, 0, 0), relativeTo: nil, duration: 3)
//
                
                
                //(to: usdzModelEntityD.position += (-5, 0, 0), relativeTo: nil)
                //(to: SIMD3<Float>(-5, -5, -5), relativeTo: nil)
//                let transform = Transform(scale: .one, rotation: simd_quatf(), translation: randomVector(length: 0.08))
//                usdzModelEntityD.move(to: transform, relativeTo: usdzModelEntityD, duration: 1, timingFunction: .easeInOut)
                
//                usdzModelEntityD.components[PhysicsBodyComponent.self] = .init(PhysicsBodyComponent(
//                    massProperties: .default,
//                    material: .generate(staticFriction: 0.8, dynamicFriction: 0.5, restitution: 0.1),
//                        mode: .dynamic
//                ))
//                usdzModelEntityD.components[PhysicsMotionComponent.self] = .init()
                modelD = usdzModelEntityD

                //content.add(usdzModelEntityD)

            }
            
            async let usdzModelEntityE = ModelEntity(named: "E.usdz")
            if let usdzModelEntityE = try? await usdzModelEntityE {
                usdzModelEntityE.name = "E"
                usdzModelEntityE.transform.scale = [0.5, 0.5, 0.5]

                usdzModelEntityE.generateCollisionShapes(recursive: true)
                usdzModelEntityE.components.set(InputTargetComponent())
                
                modelE = usdzModelEntityE
                //content.add(usdzModelEntityE)

            }
            
            async let usdzModelEntityF = ModelEntity(named: "F.usdz")
            if let usdzModelEntityF = try? await usdzModelEntityF {
                usdzModelEntityF.name = "F"
                usdzModelEntityF.transform.scale = [0.5, 0.5, 0.5]

                usdzModelEntityF.generateCollisionShapes(recursive: true)
                usdzModelEntityF.components.set(InputTargetComponent())
                
                modelF = usdzModelEntityF
                //content.add(usdzModelEntityF)

            }
            
            content.add(modelA!)
            content.add(modelB!)
            content.add(modelC!)
            content.add(modelD!)
            content.add(modelE!)
            content.add(modelF!)
            
        }.gesture(dragGesture)
    }
    
    
    var dragGesture: some Gesture {
        DragGesture()
            .targetedToAnyEntity()
            .onChanged { value in
                print(value.entity.name)
                value.entity.position = value.convert(value.location3D, from: .local, to: value.entity.parent!)
                value.entity.components[PhysicsBodyComponent.self]?.mode = .kinematic
            }
            .onEnded { value in
                value.entity.components[PhysicsBodyComponent.self]?.mode = .dynamic
                
            }
    }
}

//private func randomVector(length: Float) -> simd_float3 {
//      let angle = Float.random(in: -.pi...(.pi))
//      return [cos(angle), 0, sin(angle)] * length
//}

#Preview {
    SphereView()

}
