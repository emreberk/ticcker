//
//  MainViewModel.swift
//  ticcker
//
//  Created by Emre Berk on 10/11/2017.
//  Copyright © 2017 Emre Berk. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire
import ObjectMapper

class MainViewModel{
    
    let disposeBag = DisposeBag()
    
    var data = Variable<[Currency]>([])
    
    func requestData(){
        RxAlamofire.requestJSON(.get, C.API.URLString)
            .subscribe(onNext: { (r, json) in
                if let dict = json as? [[String: Any]] {
                    let data = Mapper<Currency>().mapArray(JSONArray: dict)
                    self.data.value = data
                }
            }, onError: { (error) in
                print(error)
            }).disposed(by: disposeBag)
    }
    
}
