//
//  LocalDataHelper.swift
//  TaskUI
//
//  Created by Neosoft on 05/08/24.
//

import Foundation

struct BundleDecoderFromJson {
    static func decodeLandmarkFromBundleToJson() -> [ItemData] {
        let landmarkJson = Bundle.main.path(forResource: "LocalLocation", ofType: "json")
        let landmarks = try! Data(contentsOf: URL(fileURLWithPath: landmarkJson!), options: .alwaysMapped)
        return try! JSONDecoder().decode([ItemData].self, from: landmarks)
    }
}
