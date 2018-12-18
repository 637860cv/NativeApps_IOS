//
//  Vervanging.swift
//  test
//
//  Created by Camille Vandenbussche on 31/10/2018.
//  Copyright © 2018 Camille Vandenbussche. All rights reserved.
//

import UIKit

class Vervanging : Codable {

   
    var group: String?
    var checkInDate: Date?
    var checkOutDate: Date?
    
    init(group:String, checkInDate:Date,checkOutDate:Date) {
        self.group = group
        self.checkInDate = checkInDate
        self.checkOutDate = checkOutDate
    }

    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("vervangingen").appendingPathExtension("JSON")
    
    static func loadSampleEmojis() -> [Vervanging] {
        return [
            Vervanging(group:"2e leerjaar",checkInDate:Date(),checkOutDate:Date()),
            Vervanging(group:"3e leerjaar",checkInDate:Date(),checkOutDate:Date()),
        ]
    }
    
    static func saveToFile(verv: [Vervanging]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedVervangingen = try? propertyListEncoder.encode(verv)
        
        try? codedVervangingen?.write(to: ArchiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Vervanging]? {
        guard let codedVervangingen = try? Data(contentsOf: ArchiveURL) else { return nil }
        
        let propertyListDecoder = PropertyListDecoder()
        
        return try? propertyListDecoder.decode(Array<Vervanging>.self, from: codedVervangingen)
    }


}
