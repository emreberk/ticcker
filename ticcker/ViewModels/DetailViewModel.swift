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
    
    private var currency:Variable<Currency>
    
    let name = Variable<String>("")
    let symbol = Variable<String>("")
    let price = Variable<String>("")
    let change = Variable<String>("")
    let changeColor = Variable<UIColor>(.white)
    
    init(currency:Currency){
        self.currency = Variable<Currency>(currency)
        setVariables()
    }
    
    private func setVariables(){
        name.value = currency.value.name
        symbol.value = currency.value.symbol
        price.value = "\(currency.value.priceUsd!)$"
        change.value = "\(currency.value.percentChange1h!)%"
        changeColor.value = currency.value.isChangePositive ? .flatGreen : .flatRed
    }
    
}
