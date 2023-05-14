//
//  ProfileView.swift
//  Flowr
//
//  Created by Andrew on 5/11/23.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var globalData: GlobalData
//    @State var should = true
    @State var showAromaHelp = true
    @State var showEffectHelp = true
    @State private var path = NavigationPath()
//    @State var show = true
//    @State var show = true
    var body: some View {
        
//        Image(systemName: img)
        NavigationStack {List {
            //            ForEach(data) {(strain: Strain) in
            NavigationLink {
                AccountSettingsView()
            } label: {
                BasicRow(title: "Account Settings", description: "Account Settings")
                //                    StrainSearchRow(strain: strain)
            }
            
            NavigationLink {
                MultipleSelectionList(buttonText: "Next",  data: TerpeneUtil.loadTerpeneAromas(terpenes: globalData.terpenes),action:{}, destination: AnyView(MultipleSelectionList(buttonText: "Done", data: TerpeneUtil.loadTerpeneEffects(terpenes: globalData.terpenes), action:{
                    NavigationUtil.popToRootView()
                    print("Something should have happened")
                    
                },destination: nil).sheet(isPresented: $showEffectHelp){
                    VStack(alignment: .center){
                        Text("Terpene Effects").font(.title)
                        Text("Next, select effets you are looking to experience when using cannabis").font(.subheadline).padding(.bottom)
                        Button(action:{
                            self.showEffectHelp.toggle()
                        }){
                            Text("Ok").frame(maxWidth: .infinity).font(.subheadline).padding().background(.blue)
                                .foregroundColor(.white)
                                .clipShape(
                                    
                                    // 2
                                    Capsule()
                                )
                        }
                    }
                    
                })).sheet(isPresented: $showAromaHelp){
                    VStack(alignment: .center){
                        
                        Text("Terpene Aromas").font(.title)
                        Text("Start by selecting the aromas that you enjoy").font(.subheadline).padding(.bottom)
                        Button(action:{
                            self.showAromaHelp.toggle()
                        }){
                            Text("Let's go!").frame(maxWidth: .infinity).font(.subheadline).padding().background(.blue)
                                .foregroundColor(.white)
                                .clipShape(
                                    
                                    // 2
                                    Capsule()
                                )
                        }
                    }
//                    dumb.toggle()
                }
                
            } label: {
                BasicRow(title: "Build Terpene Profile", description: "Build your terpene profile")
                //                    StrainSearchRow(strain: strain)
            }
            NavigationLink {
                ContentView()
            } label: {
                BasicRow(title: "View Badges", description: "View your badge list")
                //                    StrainSearchRow(strain: strain)
            }
            NavigationLink {
                ContentView()
            } label: {
                BasicRow(title: "Manage Circle", description: "Manage Followers/Following")
                //                    StrainSearchRow(strain: strain)
            }
            NavigationLink {
                ContentView()
            } label: {
                BasicRow(title: "Help", description: "Get Help")
                //                    StrainSearchRow(strain: strain)
            }
            //            }
        }.toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    
                    Text("Account").font(.headline).padding(.top, 50)
                    
                    //                    Text("Discover recommended strains, nearby dispensaries and more")
                }
            }
        }
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView().environmentObject(GlobalData())
    }
}
