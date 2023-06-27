//
//  DateUtil.swift
//  Terp
//
//  Created by Andrew on 6/27/23.
//

import Foundation

struct DateUtil{
    static func stringToDate(str: String) -> Date{
//        let isoDate = "2016-04-14T10:44:00+0000"
//        var created: String = "04-20-2020 14:20:00"
          let dateFormatter = DateFormatter()
          dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
          dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
          return dateFormatter.date(from:str)!
    }
    
    static func dateToStringMonthYear(inDate: Date)->String{
        let formatter3 = DateFormatter()
        formatter3.dateFormat = "MMMM yyyy"
        print()
        return formatter3.string(from: inDate)
    }
    static func dateToStringDayMonthYear(inDate: Date)->String{
        let formatter3 = DateFormatter()
        formatter3.dateFormat = "MMMM dd, yyyy"
        print()
        return formatter3.string(from: inDate)
    }
    static func dateToStringDayMonthYearTime(inDate: Date)->String{
        return "\(inDate)"
    }
}
