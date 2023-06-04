//
//  ReviewUtil.swift
//  Flowr
//
//  Created by Andrew on 5/17/23.
//

import Foundation
struct ReviewUtil{
    static func loadReviews() -> [Review]{
        Bundle.main.decode([Review].self, from: "reviews.json")
    }
    static func loadReviewsByUser(user: User) -> [Review] {
        return self.loadReviews().filter({$0.user==user.id})
    }
//    static func loadPublicReviewsByStrainName(name: String) -> [Review]{
//        var reviews = [Review]()
//        self.loadReviews().filter({$0.strain.lowercased()==name.lowercased()}).forEach(){ review in
//            if !reviews.contains(where: {$0.id == review.id}){
//                reviews.append(review)
//                
//            }
//        }
//        return reviews
//    }
    static func loadAverageRatingByStrain(strain: Strain) -> Int{
        var ratings = 0
        let reviews = self.loadReviewsByStrainName(name: strain.name)
        reviews.forEach(){ rating in
            ratings += rating.rating
        }
        return ratings > 0 ? Int(ratings/reviews.count) : 0
    }
    static func loadReviewsByStrainName(name: String) -> [Review]{
        var reviews = [Review]()
        self.loadReviews().filter({$0.strain.lowercased()==name.lowercased()}).forEach(){ review in
            if !reviews.contains(where: {$0.id == review.id}){
                reviews.append(review)
                
            }
        }
        return reviews
    }
}
