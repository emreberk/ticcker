//
//  DetailViewController.swift
//  ticcker
//
//  Created by Emre Berk on 10/11/2017.
//  Copyright © 2017 Emre Berk. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class DetailViewController:UIViewController{
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    
    var viewModel:DetailViewModel!
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        view.backgroundColor = C.Color.appBackground
        bindViewModel()
    }
    
    func bindViewModel(){
        
        viewModel.name.asObservable()
            .bind(to: nameLabel.rx.text)
            .disposed(by: bag)
        
        viewModel.symbol.asObservable()
            .bind(to: symbolLabel.rx.text)
            .disposed(by: bag)
        
        viewModel.price.asObservable()
            .bind(to: priceLabel.rx.text)
            .disposed(by: bag)
        
        viewModel.change.asObservable()
            .bind(to: changeLabel.rx.text)
            .disposed(by: bag)
     
        viewModel.changeColor.asObservable()
            .bind(onNext: { [weak self] color in
                self?.changeLabel.textColor = color
            })
            .disposed(by: bag)
    }
    
}
