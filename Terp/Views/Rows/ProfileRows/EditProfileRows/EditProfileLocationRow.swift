//
//  EditProfileLocationRow.swift
//  Terp
//
//  Created by Andrew on 6/20/23.
//

import SwiftUI

struct EditProfileLocationRow: View {
//    let location: Location
    @State var user: Binding<User>
    @State private var countries: [LocationCountry] = [LocationCountry]()
    @State private var states: [LocationState] = [LocationState]()
    @State private var cities: [LocationCity] = [LocationCity]()
    @Binding  var selectedCountry: LocationCountry
    @Binding  var selectedState: LocationState
    @Binding  var selectedCity: LocationCity
    @State private var loading: Bool = false
    var body: some View {
        VStack{
            Text("Location").font(.title).fontWeight(.bold)
            if self.loading{
                ProgressView()
            }else{
                HStack{
                    Text("Country").fontWeight(.bold)
                    Spacer()
                    Picker("Country", selection: self.$selectedCountry){
                        ForEach(self.countries, id: \.self){ country in
                            Text(country.name).tag(country.id)
                        }
                    }
                }.onChange(of: self.selectedCountry) {value in
                    self.reloadPickerStates()
                }.padding([.trailing,.leading])
                HStack{
                    Text("State").fontWeight(.bold)
                    Spacer()
                    Picker("State", selection: self.$selectedState){
                        ForEach(self.states, id: \.self){ locState in
                            Text(locState.name).tag(locState.id)
                        }
                    }
                    .onChange(of: self.selectedState) { value in
                        self.reloadPickerStates()
                    }
                }.padding([.trailing,.leading])
                HStack{
                    Text("City").fontWeight(.bold)
                    Spacer()
                    Picker("City", selection: self.$selectedCity){
                        ForEach(self.cities, id: \.self){ locCity in
                            Text(locCity.name).tag(locCity.id)
                            
                        }
                    }
                }.onChange(of: self.selectedCity) { value in
                    self.reloadPickerStates()
                }.padding([.trailing,.leading])
            }
        }.onAppear{
            self.selectedCountry = self.user.location.country.wrappedValue
            self.selectedState = self.user.location.state.wrappedValue
            self.selectedCity = self.user.location.city.wrappedValue
            
            // ok so now we need to load the inital states for the pickers
            self.reloadPickerStates()
        }.padding(.bottom)
    
        
    }
    private func reloadPickerStates(){
        //ok so here we'll run a thgmread and run the data
        print("Reloading states")
        self.loading = true
        DispatchQueue.global(qos: .utility).async {
            let _countries = LocationUtil.loadCoutries()
            let _states = LocationUtil.loadStatesByCountry(country: self.selectedCountry)
            let _cities = LocationUtil.loadCitiesByState(locState: self.selectedState)
            self.user.wrappedValue.location.country = self.selectedCountry
            self.user.wrappedValue.location.state = self.selectedState
            self.user.wrappedValue.location.city = self.selectedCity
            DispatchQueue.main.async {
                self.countries = _countries
                self.states = _states
                self.cities = _cities
                self.loading = false
                
//                self.strains = _strains
//                self.loading = false
            }
    }
        
    }
}

struct EditProfileLocationRow_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileLocationRow(user: .constant(User.example), selectedCountry: .constant(User.example.location.country), selectedState: .constant(User.example.location.state), selectedCity: .constant(User.example.location.city))
    }
}
