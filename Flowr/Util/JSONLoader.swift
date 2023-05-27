//
//  Helper.swift
//  A small collection of quick helpers to avoid repeating the same old code.
//
//  Created by Paul Hudson on 23/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import UIKit

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        do {
            let loaded =  try decoder.decode(T.self, from: data)
            return loaded
                }catch{
                    print(error)
                    fatalError(error.localizedDescription)
                }
        

        
    }
    func writeJson(filename: String, jsonData: String){
//        let jsonData = try! JSONEncoder().encode(user)

//        let jsonString = "{\"location\": \"the moon\"}"

        if let documentDirectory = FileManager.default.urls(for: .documentDirectory,
                                                            in: .userDomainMask).first {
            let pathWithFilename = documentDirectory.appendingPathComponent(filename)
            do {
                try jsonData.write(to: pathWithFilename,
                                     atomically: true,
                                     encoding: .utf8)
                print("wrote file \(filename)")
            } catch {
                print(error)
                fatalError(error.localizedDescription)
                // Handle error
            }
        }
    }
    
}
