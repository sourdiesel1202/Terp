//
//  ProfileTerpeneRow.swift
//  Flowr
//
//  Created by Andrew on 5/18/23.
//

import SwiftUI

struct ProfileTerpeneRow: View {
    let user: User
    @State private var aromas: [EffectAromaJSON] = [EffectAromaJSON]()
    @State private var effects: [EffectAromaJSON] = [EffectAromaJSON]()
    @State private var terpenes: [TerpeneJSON] = [TerpeneJSON]()
    @State private var loading: Bool = false
    @EnvironmentObject var errorHandler: ErrorHandler
    private var terpeneProfile: TerpeneProfile{
        return TerpeneJSONUtil.loadTerpeneProfileByUser(user: self.user)
    }
    
//    private var effects: [String]{
    var body: some View {
        
        VStack(alignment: .leading){
//            ViewDivider(height: 0.5)
            HStack{
                Text("Terpene Profile").padding([.leading,.bottom]).font(.caption).fontWeight(.bold)
            }
            RowHeaderViewAll(text: "Terpenes (\(self.terpeneProfile.terpenes.count))", data: TerpeneJSONUtil.loadTerpeneDataMapFromStrings(terpenes: self.terpeneProfile.terpenes))
            if self.loading{
                ProgressView()
            }else{
                HorizontalTerpeneRow(terpenes: self.terpenes)
            }
            ViewDivider(height: 0.5)
            RowHeaderViewAll(text: "Aromas (\(self.terpeneProfile.aromas.count))", data: TerpeneJSONUtil.loadAromaEffectDataMap(data: self.terpeneProfile.aromas))
            if loading{
                ProgressView()
            }else{
                HorizontalTerpeneEffectAromaRow(data: self.aromas)
            }
            ViewDivider(height: 0.5)
            RowHeaderViewAll(text: "Effects (\(self.terpeneProfile.effects.count))", data: TerpeneJSONUtil.loadAromaEffectDataMap(data: self.terpeneProfile.effects))
            if loading{
                ProgressView()
            }else{
                HorizontalTerpeneEffectAromaRow(data: self.effects)
            }
            NavigationLink{
                TerpeneProfileView(user: self.user, terpeneProfile: TerpeneJSONUtil.loadTerpeneProfileByUser(user: self.user))
//                TerpeneProfileView(searchText: <#T##arg#>, globalData: <#T##GlobalData#>, navigationUtil: <#T##NavigationUtil#>, isPresentingEditEffectSheet: <#T##Bool#>, isPresentingBuildEffectSheet: <#T##Bool#>, isPresentingEditAromaSheet: <#T##Bool#>, isPresentingBuildAromaSheet: <#T##Bool#>, effectSelections: <#T##arg#>, aromaSelections: <#T##arg#>)
            } label: {
                FullWidthText(text: "Edit Terpene Profile")
//                FullWidthButton(text: "Edit Terpene Profile", action: {}).padding([ .leading,.trailing,.top])
            }
        }.onAppear{
            self.loading = true
                DispatchQueue.global(qos: .utility).async {
                    
                    do{
                        let _effects = try TerpeneJSONUtil.loadEffectsByNames(names: self.terpeneProfile.effects)
                        let _aromas = try TerpeneJSONUtil.loadAromasByNames(names: self.terpeneProfile.aromas)
                        let _terpenes = try TerpeneJSONUtil.loadTerpenesByName(names: self.terpeneProfile.terpenes)
//                        let strainData = try StrainJSONUtil.loadStrainsByNames(names: self.achievement.strains)
                        DispatchQueue.main.async {
                            self.aromas = _aromas
                            self.effects = _effects
                            self.terpenes = _terpenes
                            self.loading = false
                        }
                    }catch{
                        DispatchQueue.main.async {
                            self.errorHandler.handle(error: error)
                            //                        self.loading = false
                            self.loading = false
                        }
                        
                    }
                    
                
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
