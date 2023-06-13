//
//  ImageUtil.swift
//  Terp
//
//  Created by Andrew on 6/12/23.
//

import Foundation
import CoreImage
import SwiftUI
struct ImageUtil {
    static func loadFilterList()->[CIFilter]{
        let filterList = ["CIPhotoEffectChrome", "CISepiaTone", "CIUnsharpMask", "CIVignette","CIPhotoEffectNoir", "CIPhotoEffectInstant","CIComicEffect",]
        var res = [CIFilter]()
        filterList.forEach(){ f in
            if let filter = CIFilter(name: f){
                res.append(filter)
            }
        }
        return res
    }
    private func applyBuiltInEffect(input: CIImage) {
      // 2
      let noir = CIFilter(
        name: "CIPhotoEffectNoir",
        parameters: ["inputImage": input]
      )?.outputImage
      // 3
      let sunGenerate = CIFilter(
        name: "CISunbeamsGenerator",
        parameters: [
          "inputStriationStrength": 1,
          "inputSunRadius": 300,
          "inputCenter": CIVector(
            x: input.extent.width - input.extent.width / 5,
            y: input.extent.height - input.extent.height / 10)
        ])?
        .outputImage
      // 4
      let compositeImage = input.applyingFilter(
        "CIBlendWithMask",
        parameters: [
          kCIInputBackgroundImageKey: noir as Any,
          kCIInputMaskImageKey: sunGenerate as Any
        ])
    }
    
    static func generateFilterPreviews(input: CIImage, intensity: Double, context: CIContext) ->[UIImage]{
        var res = [UIImage]()
        self.loadFilterList().forEach(){ filter in
            if let image = self.applyBuiltInFilter(input: input, filter: filter, intensity: intensity, context: context){
                res.append(image)
            }
            
        }
        return res
    }
    static func applyBuiltInFilter(input: CIImage, filter: CIFilter, intensity: Double, context: CIContext)-> UIImage? {
        // make sure we have a valid image before continuing!
//           guard input != nil else { return nil }

//            safely read the alert action's title
//           guard let actionTitle = action.title else { return }

//           currentFilter = CIFilter(name: actionTitle)

//           let beginImage = CIImage(image: input)
//            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
           filter.setValue(input, forKey: kCIInputImageKey)
            let inputKeys = filter.inputKeys

            if inputKeys.contains(kCIInputIntensityKey) { filter.setValue(intensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputColorKey) { filter.setValue(CIColor (cgColor: CGColor(red: 109.00, green: 196.00, blue: 84.00, alpha: 1.0)) , forKey: kCIInputColorKey) }
            if inputKeys.contains(kCIInputRadiusKey) { filter.setValue(intensity * 200, forKey: kCIInputRadiusKey) }
            if inputKeys.contains(kCIInputScaleKey) { filter.setValue(intensity * 10, forKey: kCIInputScaleKey) }
            if inputKeys.contains(kCIInputCenterKey) { filter.setValue(CIVector(x: UIImage(ciImage: input).size.width / 2, y: UIImage(ciImage: input).size.height / 2), forKey: kCIInputCenterKey) }
        
            if let cgimg = context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent) {
                    let processedImage = UIImage(cgImage: cgimg)
                    return processedImage

                }
        return nil
    }
    
}
