//
//  DetailViewModel.swift
//  ticcker
//
//  Created by Emre Berk on 10/11/2017.
//  Copyright © 2017 Emre Berk. All rights reserved.
//

import Foundation
import RxSwift

class DetailViewModel{
    
    var currency:Variable<Currency>
    
    init(currency:Currency){
        self.currency = Variable<Currency>(currency)
    }
    
}
