//
//  hairStyleModel.swift
//  Trims
//
//  Created by Dimeji Adekanmbi on 31/03/2024.
//

import Foundation

struct HairStyleModel : Identifiable {
    var id : UUID = UUID()
    var imageUrl : String
    var tags : [String]
    var info : String
}
