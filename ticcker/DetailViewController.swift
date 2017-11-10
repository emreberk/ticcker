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
    
    internal var viewModel:DetailViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        view.backgroundColor = C.Color.appBackground
        setupViewModel()
    }
    
    func setupViewModel(){
        viewModel.currency.asObservable()
            .subscribe(onNext:{
                [weak self] currency in
                self?.nameLabel.text = currency.name
                self?.symbolLabel.text = currency.symbol
                self?.priceLabel.text = "$\(currency.priceUsd!)"
                self?.changeLabel.text = "\(currency.percentChange1h!)%"
                self?.changeLabel.textColor = currency.isChangePositive ? UIColor.flatGreen : UIColor.flatRed
            }).disposed(by: disposeBag)
    }
    
}
