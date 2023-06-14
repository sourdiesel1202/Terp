//
//  StrainError.swift
//  Terp
//
//  Created by Andrew on 6/13/23.
//

import Foundation
enum StrainError: Error {
    case strainNotFound
    case parentNotFound
    case childNotFound
    case generalError
//    case insufficientFunds(coinsNeeded: Int)
//    case outOfStock
}
