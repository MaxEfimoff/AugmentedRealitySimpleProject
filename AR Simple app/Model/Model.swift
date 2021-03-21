//
//  Model.swift
//  AR Simple app
//
//  Created by Максим Ефимов on 21.03.2021.
//

import SwiftUI
import RealityKit
import Combine

class Model {
    var modelName: String
    var image: UIImage
    var modelEntity: ModelEntity?
    
    private var cancellable: AnyCancellable? = nil
    
    init(modelName: String) {
        self.modelName = modelName
        
        self.image = UIImage(named: modelName)!
        
        let fileName = modelName + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: fileName)
            .sink(receiveCompletion: { loadCompletion in
                // Handle error
                print("DEBUG: Unable to load vodelEntity for modelName: \(self.modelName)")
            }, receiveValue: { modelEntity in
                // Get our modelEntity
                self.modelEntity = modelEntity
                print("DEBUG: Successfully loadede modelEntity for modelName: \(self.modelName)")
            })
    }
}

var models: [Model] = {
    // Dynamicly getting our filenames
    let fileManager = FileManager.default
    
    guard let path = Bundle.main.resourcePath, let files = try? fileManager.contentsOfDirectory(atPath: path) else {
        return []
    }
    
    var availableModels: [Model] = []
    for filename in files where filename.hasSuffix("usdz") {
        let modelName = filename.replacingOccurrences(of: ".usdz", with: "")
        let model = Model(modelName: modelName)
        availableModels.append(model)
    }
    
    return availableModels
}()
