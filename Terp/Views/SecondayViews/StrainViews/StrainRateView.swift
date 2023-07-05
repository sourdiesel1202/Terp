//
//  StrainRateView.swift
//  Flowr
//
//  Created by Andrew on 5/23/23.
//

import SwiftUI
//import AWSCore
import AWSS3
struct StrainRateView: View {
    let strain: StrainJSON
    @State private var rating: Int = 1
    @State private var image: UIImage? //= UIImage(systemName: "person.fill")!
    @State private var description: String = ""
    @State private var isPublic: Bool = false
    @State private var posting: Bool = false
    @State private var shouldNotifiy: Bool = false
    @State private var consumptionType: ConsumptionType = .flower
    @EnvironmentObject var globalData: GlobalData
    var body: some View {
        if !posting{
            VStack{
                ScrollView{
                    //                StrainDetailHeaderView(strain: self.strain)
                    //                ViewDivider(height: 0.25)
                    StrainRateHeaderRow(strain: self.strain)
                    
                    //                ViewDivider(height: 0.25)
                    //                StrainRateConsumptionRow(selectedOption: self.$consumptionType)
                    //                ViewDivider(height: 0.25)
                    StrainRateDescriptionRow(text: self.$description).padding(.bottom)
                    StrainRatePhotoRow(image: self.image, boundImage: self.$image).padding(.bottom)
                    StrainRateStarsRow(rating: self.$rating).padding(.bottom)
                    StrainRatePublicFeedRow(isPublic: self.$isPublic).padding([.bottom, .top])
                    FullWidthButton(text: "Post", action: {
                        self.posting = true
                        //ok try the image upload
                        //                    guard let image = UIImage(named: "your-image") else { return } //1
                        if self.image != nil{
                            
                            
                            S3Util.uploadImage(image: image!, progress: {[ self] ( uploadProgress) in
                                
                                //                                   guard let strongSelf = self else { return }
                                //                                   strongSelf.progressView.progress = Float(uploadProgress)//2
                                
                            }) {[ self] (uploadedFileUrl, error) in
                                
                                //                                   guard let strongSelf = self else { return }
                                if let finalPath = uploadedFileUrl as? String { // 3
                                    print(finalPath)
                                    self.posting = false
                                    //                                       strongSelf.s3UrlLabel.text = "Uploaded file url: " + finalPath
                                } else {
                                    print("\(String(describing: error?.localizedDescription))") // 4
                                }
                            }
                            //                            let uploadedPhoto = try S3Util.uploadImage(image: self.image!, s3Path: "/reviews/\(User.example.username)")
                            //                            print("Uploaded photo to: \(uploadedPhoto)")
                            //                            print(uploadedPhoto)
                            
                        }else{
                            print("image is nil")
                        }
                        //                        S3Util.uploadImage(image: image!, progress: {[weak self] ( uploadProgress) in
                        //
                        ////                            guard let strongSelf = self else { return }
                        ////                            strongSelf.progressView.progress = Float(uploadProgress)//2
                        //
                        //                        }) {[weak self] (uploadedFileUrl, error) in
                        //
                        //                            guard let strongSelf = self else { return }
                        //                            if let finalPath = uploadedFileUrl as? String { // 3
                        //                                strongSelf.s3UrlLabel.text = "Uploaded file url: " + finalPath
                        //                            } else {
                        //                                print("\(String(describing: error?.localizedDescription))") // 4
                        //                            }
                        //                        }
                        
                    }).padding().onAppear{
                        self.isPublic = self.globalData.isPostPublic
                    }.popover(isPresented: self.$shouldNotifiy, content: {
                        Text("Review of \(strain.name) posted!")
                    })
                }
                
            }
        }else{
            VStack{
                Text("Posting").font(.largeTitle).fontWeight(.bold)
                ProgressView()
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
