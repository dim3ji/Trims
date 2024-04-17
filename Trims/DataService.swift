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
                HairStyleModel(imageName: "ShortFade", tags: ["Fade","Low","LowCut","Waves"]),
                HairStyleModel(imageName: "LowFade", tags: ["Fade","SkinFade","LowCut","Waves"]),
                HairStyleModel(imageName: "SkinFade", tags: ["Fade","LowCut","SkinFade","Waves"]),
                HairStyleModel(imageName: "Taper", tags: ["Fade","Low","DropFade","Waves"]),
                HairStyleModel(imageName: "Taper", tags: ["Fade","Low","DropFade","Waves"]),
                HairStyleModel(imageName: "TaperFade", tags: ["Fade","Low","MidFade","Waves"]),
                HairStyleModel(imageName: "DropFade", tags: ["Fade","Low","DropFade","Waves"]),
                HairStyleModel(imageName: "DropFade", tags: ["Fade","Low","DropFade","Waves"]),
                HairStyleModel(imageName: "LowFade", tags: ["Fade","Low","MidFade","Waves"]),
                HairStyleModel(imageName: "MidFade", tags: ["Fade","Mid","MidFade","Waves"]),
                HairStyleModel(imageName: "MidFades", tags: ["Fade","Low","MidFade","Waves"]),
                HairStyleModel(imageName: "Bellingham", tags: ["Fade","Low","MidFade","Waves"])
            ]
    }
    
    func getSortedData(sortType:String) -> [HairStyleModel]{
        let allStyles = getData()
        
        if(sortType.lowercased() == "all"){
            return allStyles
        }
        
        let sortedStyles = allStyles.filter { $0.tags.contains(sortType) }
        return sortedStyles
    }
}
