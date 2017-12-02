//
//  Currency.swift
//  ticcker
//
//  Created by Emre Berk on 10/11/2017.
//  Copyright © 2017 Emre Berk. All rights reserved.
//

import Foundation
import ObjectMapper

class Currency:Mappable{
    
    var id:String!
    var name:String!
    var symbol:String!
    var priceUsd:String!
    var lastUpdated:Date!
    var percentChange1h:String!
    
    var isChangePositive:Bool{
        return Double(percentChange1h)! > 0
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id                  <- map["id"]
        name                <- map["name"]
        symbol              <- map["symbol"]
        priceUsd            <- map["price_usd"]
        percentChange1h     <- map["percent_change_1h"]
        lastUpdated         <- (map["last_updated"], DateTransform())
    }
    
    
}
