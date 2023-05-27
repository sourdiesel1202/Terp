//
//  ProfileTerpeneRow.swift
//  Flowr
//
//  Created by Andrew on 5/18/23.
//

import SwiftUI

struct ProfileTerpeneRow: View {
    let user: User
    private var terpeneProfile: TerpeneProfile{
        return TerpeneUtil.loadTerpeneProfileByUser(user: self.user)
    }
    
//    private var effects: [String]{
    var body: some View {
        
        VStack(alignment: .leading){
//            ViewDivider(height: 0.5)
            HStack{
                Text("Terpene Profile").padding([.leading,.bottom]).font(.caption).fontWeight(.bold)
            }
            RowHeaderViewAll(text: "Terpenes (\(self.terpeneProfile.terpenes.count))", data: TerpeneUtil.loadTerpeneDataMapFromStrings(terpenes: self.terpeneProfile.terpenes))
             HorizontalTerpeneRow(terpenes: TerpeneUtil.loadTerpenesByName(names: self.terpeneProfile.terpenes ))
            ViewDivider(height: 0.5)
            RowHeaderViewAll(text: "Aromas (\(self.terpeneProfile.aromas.count))", data: TerpeneUtil.loadAromaDataMap(aromas: self.terpeneProfile.aromas))
            HorizontalTerpeneEffectAromaRow(data: self.terpeneProfile.aromas)
            ViewDivider(height: 0.5)
            RowHeaderViewAll(text: "Effects (\(self.terpeneProfile.effects.count))", data: TerpeneUtil.loadAromaEffectDataMap(data: self.terpeneProfile.effects))
            HorizontalTerpeneEffectAromaRow(data: self.terpeneProfile.effects)
            NavigationLink{
                TerpeneProfileView(user: self.user, terpeneProfile: TerpeneUtil.loadTerpeneProfileByUser(user: self.user))
//                TerpeneProfileView(searchText: <#T##arg#>, globalData: <#T##GlobalData#>, navigationUtil: <#T##NavigationUtil#>, isPresentingEditEffectSheet: <#T##Bool#>, isPresentingBuildEffectSheet: <#T##Bool#>, isPresentingEditAromaSheet: <#T##Bool#>, isPresentingBuildAromaSheet: <#T##Bool#>, effectSelections: <#T##arg#>, aromaSelections: <#T##arg#>)
            } label: {
                FullWidthText(text: "Edit Terpene Profile")
//                FullWidthButton(text: "Edit Terpene Profile", action: {}).padding([ .leading,.trailing,.top])
            }
            }
        
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ProfileTerpeneRow_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTerpeneRow(user: User.example)
    }
}
