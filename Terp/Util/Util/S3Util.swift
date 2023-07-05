//
//  S3Util.swift
//  Terp
//
//  Created by Andrew on 7/5/23.
//

import AWSCore
import AWSS3
import Foundation
typealias progressBlock = (_ progress: Double) -> Void //2
typealias completionBlock = (_ response: Any?, _ error: Error?) -> Void //3

struct S3Util{
    static func initializeS3() {
            let poolId = "us-west-2:c99e1118-2047-4a14-8eb7-16cf8b4ad11f"
            let credentialsProvider = AWSCognitoCredentialsProvider(
                regionType: .USWest2, //other regionType according to your location.
                identityPoolId: poolId
            )
            let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialsProvider)
            AWSServiceManager.default().defaultServiceConfiguration = configuration
        }
    
    // Upload image using UIImage object
    
//    static func uploadImage(image: UIImage, s3Path: String = "")throws ->String {
//
//        guard let imageData = image.jpegData(compressionQuality: 1.0) else {
//            let error = NSError(domain:"", code:402, userInfo:[NSLocalizedDescriptionKey: "invalid image"])
////            completion?(nil, error)
//            throw error
//        }
//
//        let tmpPath = NSTemporaryDirectory() as String
//        let fileName: String = ProcessInfo.processInfo.globallyUniqueString + (".jpeg")
//        let filePath = tmpPath + "/" + fileName
//        let fileUrl = URL(fileURLWithPath: filePath)
////        var publicUrlString =
//        do {
//            try imageData.write(to: fileUrl)
//            let publicUrlString = try S3Util.uploadfile(fileUrl: fileUrl, fileName: fileName, contenType: "image",  bucketName: "terp-bucket")
//            return publicUrlString
//
//        } catch let error as NSError {
////            let error = NSError(domain:"", code:402, userInfo:[NSLocalizedDescriptionKey: "invalid image"])
//            print(error.localizedDescription)
//            throw error
////            completion?(nil, error)
//        }
//
//    }
    // Upload image using UIImage object
       static func uploadImage(image: UIImage, progress: progressBlock?, completion: completionBlock?, s3Path: String = "") {
            
            guard let imageData = image.jpegData(compressionQuality: 1.0) else {
                let error = NSError(domain:"", code:402, userInfo:[NSLocalizedDescriptionKey: "invalid image"])
                completion?(nil, error)
                return
            }
            
            let tmpPath = NSTemporaryDirectory() as String
            let fileName: String = ProcessInfo.processInfo.globallyUniqueString + (".jpeg")
            let filePath = tmpPath + "/" + fileName
            let fileUrl = URL(fileURLWithPath: filePath)
            
            do {
                try imageData.write(to: fileUrl)
                S3Util.uploadfile(fileUrl: fileUrl, fileName: fileName, contenType: "image", bucketName: "terp-bucket",progress: progress, completion: completion, s3Path: s3Path)
            } catch {
                let error = NSError(domain:"", code:402, userInfo:[NSLocalizedDescriptionKey: "invalid image"])
                completion?(nil, error)
            }
        }
        
    static func uploadfile(fileUrl: URL, fileName: String, contenType: String,bucketName: String,  progress: progressBlock?, completion: completionBlock?, s3Path: String = "") {
          // Upload progress block
          let expression = AWSS3TransferUtilityUploadExpression()
          expression.progressBlock = {(task, awsProgress) in
              guard let uploadProgress = progress else { return }
              DispatchQueue.main.async {
                  uploadProgress(awsProgress.fractionCompleted)
              }
          }
          // Completion block
          var completionHandler: AWSS3TransferUtilityUploadCompletionHandlerBlock?
          completionHandler = { (task, error) -> Void in
              DispatchQueue.main.async(execute: {
                  if error == nil {
                      let url = AWSS3.default().configuration.endpoint.url
                      let publicURL = url?.appendingPathComponent(bucketName).appendingPathComponent(fileName)
                      print("Uploaded to:\(String(describing: publicURL))")
                      if let completionBlock = completion {
                          completionBlock(publicURL?.absoluteString, nil)
                      }
                  } else {
                      if let completionBlock = completion {
                          completionBlock(nil, error)
                      }
                  }
              })
          }
          // Start uploading using AWSS3TransferUtility
          let awsTransferUtility = AWSS3TransferUtility.default()
          awsTransferUtility.uploadFile(fileUrl, bucket: bucketName, key: fileName, contentType: contenType, expression: expression, completionHandler: completionHandler).continueWith { (task) -> Any? in
              if let error = task.error {
                  print("error is: \(error.localizedDescription)")
              }
              if let _ = task.result {
                  // your uploadTask
              }
              return nil
          }
      }
//    static func uploadfile(fileUrl: URL, fileName: String, contenType: String, bucketName: String?, s3Path: String = "")throws ->String {
//        // Upload progress block
//        var publicUrlString = ""
//        let expression = AWSS3TransferUtilityUploadExpression()
//        let url = AWSS3.default().configuration.endpoint.url
//        let publicURL = url?.appendingPathComponent(bucketName!).appendingPathComponent("\(s3Path)/\(fileName)")
//        print("Uploading to:\(String(describing: publicURL))")
//        publicUrlString = "\(publicURL!)"
//        expression.progressBlock = {(task, awsProgress) in
////            guard let uploadProgress = progress else { return }
//            DispatchQueue.main.async {
//                print( "\(awsProgress.fractionCompleted)")
////                uploadProgress(awsProgress.fractionCompleted)
//            }
//        }
//        // Completion block
//        var completionHandler: AWSS3TransferUtilityUploadCompletionHandlerBlock?
//        completionHandler = { (task, error) -> Void in
//
////                if error == nil {
////
//////                    if let completionBlock = completion {
//////                        completionBlock(publicURL?.absoluteString, nil)
//////                    }
////                } else {
//////                    throw error
//////                    if let completionBlock = completion {
//////                        completionBlock(nil, error)
//////                    }
////                }
//
//        }
//        // Start uploading using AWSS3TransferUtility
//        let awsTransferUtility = AWSS3TransferUtility.default()
//        awsTransferUtility.uploadFile(fileUrl, bucket: bucketName!, key: "\(s3Path)/\(fileName)", contentType: contenType, expression: expression, completionHandler: completionHandler).continueWith { (task) -> Any? in
//            if let error = task.error {
//                print("error is: \(error.localizedDescription)")
//            }
//            if let _ = task.result {
//                // your uploadTask
//            }
//            return nil
//        }
//        return publicUrlString
//    }
    
    
}

