//
//  StrainRateView.swift
//  Flowr
//
//  Created by Andrew on 5/23/23.
//

import SwiftUI

struct StrainRateView: View {
    let strain: StrainJSON
    @State private var rating: Int = 1
    @State private var image: UIImage? //= UIImage(systemName: "person.fill")!
    @State private var description: String = ""
    @State private var isPublic: Bool = false
    @State private var consumptionType: ConsumptionType = .flower
    var body: some View {
        VStack{
            ScrollView{
//                StrainDetailHeaderView(strain: self.strain)
//                ViewDivider(height: 0.25)
                StrainRateHeaderRow(strain: self.strain)
                
//                ViewDivider(height: 0.25)
//                StrainRateConsumptionRow(selectedOption: self.$consumptionType)
//                ViewDivider(height: 0.25)
                StrainRateDescriptionRow(text: self.$description).padding(.bottom)
                StrainRatePhotoRow(image: self.image).padding(.bottom)
                StrainRateStarsRow(rating: self.$rating).padding(.bottom)
                StrainRatePublicFeedRow(isPublic: self.$isPublic).padding([.bottom, .top])
                FullWidthButton(text: "Post", action: {
                    
                }).padding()
            }
            
        }
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct StrainRateView_Previews: PreviewProvider {
    static var previews: some View {
        StrainRateView(strain: StrainJSON.example)
    }
}
