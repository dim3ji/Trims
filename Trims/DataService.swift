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
                HairStyleModel(imageUrl: "Bellingham", tags: ["Fade","Low","MidFade","Waves"], info: "This is the information"),
                HairStyleModel(imageUrl: "ShortFade", tags: ["Fade","Low","LowCut","Waves"], info: "This is the information"),
                HairStyleModel(imageUrl: "LowFade", tags: ["Fade","SkinFade","LowCut","Waves"], info: "This is the information"),
                HairStyleModel(imageUrl: "SkinFade", tags: ["Fade","LowCut","SkinFade","Waves"], info: "This is the information"),
                HairStyleModel(imageUrl: "Taper", tags: ["Fade","Low","DropFade","Waves"], info: "This is the information"),
                HairStyleModel(imageUrl: "Taper", tags: ["Fade","Low","DropFade","Waves"], info: "This is the information"),
                HairStyleModel(imageUrl: "TaperFade", tags: ["Fade","Low","MidFade","Waves"], info: "This is the information"),
                HairStyleModel(imageUrl: "DropFade", tags: ["Fade","Low","DropFade","Waves"], info: "This is the information"),
                HairStyleModel(imageUrl: "DropFade", tags: ["Fade","Low","DropFade","Waves"], info: "This is the information"),
                HairStyleModel(imageUrl: "LowFade", tags: ["Fade","Low","MidFade","Waves"], info: "This is the information"),
                HairStyleModel(imageUrl: "MidFade", tags: ["Fade","Mid","MidFade","Waves"], info: "This is the information"),
                HairStyleModel(imageUrl: "MidFades", tags: ["Fade","Low","MidFade","Waves"], info: "This is the information"),
                HairStyleModel(imageUrl: "Bellingham", tags: ["Fade","Low","MidFade","Waves"], info: "This is the information")
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
