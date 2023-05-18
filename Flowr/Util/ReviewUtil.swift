//
//  ReviewUtil.swift
//  Flowr
//
//  Created by Andrew on 5/17/23.
//

import Foundation
struct ReviewUtil{
    static func loadReviews(){
        
    }
    static func loadReviewsByUser(user: User) -> [Review] {
        return Bundle.main.decode([Review].self, from: "reviews.json").filter({$0.user==user.id})
    }
}
