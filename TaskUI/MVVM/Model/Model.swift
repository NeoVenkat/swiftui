

import Foundation
import SwiftUI

struct ItemData: Hashable, Codable, Identifiable {
    var id: Int
    var item: String
    var name: String
    var description: String
    var image: String
    
}

enum Item: String, CaseIterable, Codable {
    case Suzuki, USPOLO, GT, NetFlix, Puma, Actress
}
