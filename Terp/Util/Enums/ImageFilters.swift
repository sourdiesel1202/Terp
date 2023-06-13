//
//  ImageFilters.swift
//  Terp
//
//  Created by Andrew on 6/13/23.
//

import SwiftUI
import Foundation
//"CIPhotoEffectChrome", "CISepiaTone", "CIUnsharpMask", "CIVignette","CIPhotoEffectNoir", "CIPhotoEffectInstant","CIComicEffect",
enum ImageFilters: String, CaseIterable, Identifiable{
    case CIPhotoEffectChrome = "CIPhotoEffectChrome"
    case CISepiaTone = "CISepiaTone"
    case CIUnsharpMask = "CIUnsharpMask"
    case CIVignette = "CIVignette"
    case CIPhotoEffectNoir = "CIPhotoEffectNoir"
    case CIPhotoEffectInstant = "CIPhotoEffectInstant"
    case CIComicEffect = "CIComicEffect"
    var id: Self { self }
    var description: String {
        
        switch self {
        case .CIPhotoEffectChrome:
            return "Chill"
        case .CISepiaTone:
            return "Faded"
        case .CIUnsharpMask:
            return "Bong Water"
        case .CIVignette:
            return "Cornered"
        case .CIPhotoEffectNoir:
            return "Grey Kush"
        case .CIPhotoEffectInstant:
            return "Smoke Out"
        case .CIComicEffect:
            return "Haze"
//            return "Cornered"
        }
    }
}
