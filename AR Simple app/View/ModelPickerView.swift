//
//  ModelPickerView.swift
//  AR Simple app
//
//  Created by Максим Ефимов on 21.03.2021.
//

import SwiftUI

struct ModelPickerView: View {
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: Model?
    var models: [Model]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                Spacer()
                ForEach(0..<self.models.count) { index in
                    Button(action: {
                        self.isPlacementEnabled = true
                        self.selectedModel = self.models[index]
                    }, label: {
                        Image(uiImage: self.models[index].image)
                            .resizable()
                            .frame(height: 80)
                            .aspectRatio(1/1, contentMode: .fit)
                            .background(Color.white)
                            .cornerRadius(12)
                        
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                Spacer()
            }
        }
        .padding(20)
        .background(Color.black.opacity(0.3))
    }
}
