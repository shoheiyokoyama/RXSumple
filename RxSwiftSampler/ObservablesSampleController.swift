//
//  ObservablesSampleController.swift
//  RxSwiftSampler
//
//  Created by Shohei Yokoyama on 2016/11/25.
//  Copyright © 2016年 Shohei. All rights reserved.
//

import UIKit
import RxSwift

// [RxSwift 入門 その１](http://tiny-wing.hatenablog.com/entry/2016/01/02/161322)

class ObservablesSampleController: UIViewController {
    
    // MARK: - Life Cycle Method -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObservables()
    }
}

// MARK: - Observables -

extension ObservablesSampleController {
    func createObservables() {
        // empty
        let emptyObservable: Observable<Int> = Observable.empty()
        let _ = emptyObservable.subscribe { event in print(event) } //completed
        
        // never
        let neverObservable: Observable<Int> = Observable.never()
        let _ = neverObservable.subscribe { event in print(event) } // Not called even once
        
        // just
        let justObservable: Observable<Int> = Observable.just(20)
        let _ = justObservable.subscribe { event in print(event) }
        // next(20)
        // completed
        
        // of
        let certainObserbable: Observable<Int> = Observable.of(0, 1, 2)
        let _ = certainObserbable.subscribe { event in print(event) }
        // next(0)
        // next(1)
        // next(2)
        // completed
        
        // toObservable
        let array: [Int] = [1, 2, 3]
        let arrayObserbavle = array.toObservable()
        let _ = arrayObserbavle.subscribe { event in print(event) }
    }
}

