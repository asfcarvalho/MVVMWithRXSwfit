//
//  PeopleViewModel.swift
//  MVVMRxSwift
//
//  Created by asfcarvalho on 24/10/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct PeopleViewModel {
    
    var people: Observable<[Output]>
    let disposeBag = DisposeBag()
    var peopleDataModule = PeopleDataModule()
    
    struct Output {
        let name: String?
        let age: String?
        let height: String?
    }
    
    init() {

        let obsPeople: Observable<People> = peopleDataModule.peopleFetch()

        var list = [Output]()

        self.people = Observable.create { obs in
            obsPeople.debug("r").subscribe(onNext: { (item) in
                if let peopleList = item.person {
                    for person in peopleList {
                        list.append(Output(name: person.name, age: person.birthYear, height: person.height))
                    }
                }
                return obs.onNext(list)
            }, onError: { (error) in
                obs.onError(error)
            })
        }

    }
}
