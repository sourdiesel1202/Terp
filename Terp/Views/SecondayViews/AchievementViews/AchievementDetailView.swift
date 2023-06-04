//
//  AchievementDetailView.swift
//  Flowr
//
//  Created by Andrew on 5/16/23.
//

import SwiftUI

struct AchievementDetailView: View {
//    @EnvironmentObject var globalData: GlobalData
    var achievement: Achievement
    var body: some View {
        VStack{
            List{
                Section(header: Text("Achievement")){
                    Image(systemName: "atom").resizable().scaledToFill()
                    Text(achievement.name).font(.title).padding(.bottom)
                    Text(achievement.description).font(.subheadline)
                }
                Section(header: Text("Requirement")){
                    Text(String(self.achievement.requires)).font(.headline)
                }
                    Section(header: Text("Eligible Strains")){
                        
                        ForEach(achievement.strains, id: \.self) { strain in
                            if StrainUtil.loadStrainByName(name: strain) != nil{
                                NavigationLink{
                                    
                                    StrainDetail2_0View(strain: StrainUtil.loadStrainByName(name: strain)!)
                                }label: {
                                    BasicRow(title: strain, description: "")
                                }
                            }else{
                                BasicRow(title: strain, description: "Strain information not available")
                            }
//                            BasicRow(title: strain, description: "")
                        }
                        
                
                }
            }
        }
    }
}

struct AchievementDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementDetailView(achievement: Achievement(name: "Test", description: "Test", image: "https://external-preview.redd.it/yAvFGhUWDGAg_t93u6UtvXgk2SDMwPEUr9QX3T1mFto.jpg?auto=webp&s=c4fa72e3d795dc32e53e11e3d9f1ac8921272c59", strains: ["OG Kush"], requires: 3))
    }
}
