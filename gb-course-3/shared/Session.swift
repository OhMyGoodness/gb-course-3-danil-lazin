//
// Created by Данила Лазин on 10.12.2021.
//

import SwiftUI

class Session {
    public static let shared = Session()
    public let version: String = "5.81"
    
    var tokenId: String?

    var userId: Int?
}
