//
//  ContentView.swift
//  AR Simple app
//
//  Created by Максим Ефимов on 21.03.2021.
//

import SwiftUI

struct ContentView : View {
    @State private var isPlacementEnabled: Bool = false
    @State private var selectedModel: Model?
    @State private var modelConfirmedForPlacement: Model?
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            ARViewContainer(modelConfirmedForPlacement: $modelConfirmedForPlacement)
            
            if self.isPlacementEnabled {
                PlacementButtonsView(isPlacementEnabled: $isPlacementEnabled, selectedModel: $selectedModel, modelConfirmedForPlacement: $modelConfirmedForPlacement)
            } else {
                ModelPickerView(isPlacementEnabled: $isPlacementEnabled, selectedModel: $selectedModel, models: models)
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
