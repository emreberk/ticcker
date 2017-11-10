//
//  MainViewController.swift
//  ticcker
//
//  Created by Emre Berk on 10/11/2017.
//  Copyright © 2017 Emre Berk. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MainViewController:UIViewController{
    
    @IBOutlet weak var tableView:UITableView!
    
    private var viewModel:MainViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        navigationItem.title = "ticcker"
        tableView.backgroundColor = C.Color.appBackground
        setupViewModel()
    }
    
    func setupViewModel(){
        viewModel = MainViewModel()
        
        viewModel.data.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "CurrencyCell", cellType: CurrencyCell.self)) {
                (row, currency, cell) in
                cell.nameLabel.text = currency.name
                cell.priceLabel.text = "$\(currency.priceUsd!)"
                cell.priceLabel.textColor = currency.isChangePositive ? UIColor.flatGreen : UIColor.flatRed
            }
            .disposed(by: disposeBag)
        
        viewModel.requestData()
        
        tableView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
        tableView.rx
            .modelSelected(Currency.self)
            .subscribe(onNext:  {
                value in
                self.showDetail(forCurrency: value)
            })
            .disposed(by: disposeBag)
        
    }
    
    func showDetail(forCurrency currency:Currency){
        let vc = storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.viewModel = DetailViewModel(currency: currency)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension MainViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
