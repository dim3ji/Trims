//
//  DataService.swift
//  Trims
//
//  Created by Dimeji Adekanmbi on 31/03/2024.
//

import Foundation

struct DataService {
    
    func getData() -> [HairStyleModel]{
        
        return [
                HairStyleModel(imageName: "Bellingham", tags: ["Fade","Low","MidFade","Waves"]),
                HairStyleModel(imageName: "ShortFade", tags: ["Fade","Low","MidFade","Waves"]),
                HairStyleModel(imageName: "LowFade", tags: ["Fade","Low","MidFade","Waves"]),
                HairStyleModel(imageName: "SkinFade", tags: ["Fade","Low","MidFade","Waves"]),
                HairStyleModel(imageName: "Taper", tags: ["Fade","Low","MidFade","Waves"]),
                HairStyleModel(imageName: "Taper", tags: ["Fade","Low","MidFade","Waves"]),
                HairStyleModel(imageName: "TaperFade", tags: ["Fade","Low","MidFade","Waves"]),
                HairStyleModel(imageName: "DropFade", tags: ["Fade","Low","MidFade","Waves"]),
                HairStyleModel(imageName: "DropFade", tags: ["Fade","Low","MidFade","Waves"]),
                HairStyleModel(imageName: "LowFade", tags: ["Fade","Low","MidFade","Waves"]),
                HairStyleModel(imageName: "MidFade", tags: ["Fade","Mid","MidFade","Waves"]),
                HairStyleModel(imageName: "MidFades", tags: ["Fade","Low","MidFade","Waves"]),
                HairStyleModel(imageName: "Bellingham", tags: ["Fade","Low","MidFade","Waves"])
            ]
    }
}
