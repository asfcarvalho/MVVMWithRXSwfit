//
//  PeopleViewController.swift
//  MVVMRxSwift
//
//  Created by asfcarvalho on 24/10/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PeopleViewController: UIViewController {
    
    fileprivate let cellName = "cell"
    let disposeBag = DisposeBag()
    
    let itemList = Observable.just(["Test 1", "Test 2", "Test 3"])

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "PeopleTableViewCell", bundle: Bundle.main.self), forCellReuseIdentifier: cellName)
        tableView.dataSource = nil
        setupTable()
    }

    fileprivate func setupTable() {
        
        let peopleViewModel = PeopleViewModel()
        
        
        
        peopleViewModel.people.catchError({ _ in
            Observable.never()
        }).bind(to: tableView.rx.items(cellIdentifier: cellName, cellType: PeopleTableViewCell.self)) { (row, element, cell) in
            cell.setupCell(element.name ?? "")
            }.disposed(by: disposeBag)
//
//        peopleViewModel.people.subscribe(onError: { (error) in
//            print(error.localizedDescription)
//            }).disposed(by: disposeBag)
        
        tableView.rx.modelSelected(PeopleViewModel.Output.self).subscribe(onNext: { (item) in
            print(item.name)
        }).disposed(by: disposeBag)
        
//        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
    }
    
}
