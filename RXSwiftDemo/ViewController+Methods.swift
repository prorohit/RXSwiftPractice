//
//  ViewController+Methods.swift
//  RXSwiftDemo
//
//  Created by Rohit Singh on 2/1/18.
//  Copyright © 2018 Rohit Singh. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import  UIKit
extension ViewController {
    func creatingObservableFromStrings() {
        let bag = DisposeBag()
        let stringSeq = Observable.just("Hello")
        let subscriber = stringSeq.subscribe(onNext: { (val) in
            print(val)
        }, onError: { (error) in
            print(error.localizedDescription)
        }, onCompleted: {
            print("completed")
        })
        subscriber.disposed(by: bag)
    }
    
    func creatingObservableFromArray() {
        let bag = DisposeBag()
        let arrSquence = Observable.from(["A","B","C",1])
        let subscriberOfArray = arrSquence.subscribe(onNext: { (val) in
            print(val)
        }, onError: { (error) in
        print(error.localizedDescription)
        }, onCompleted: {
            print("completed")
        })
        subscriberOfArray.disposed(by: bag)
    }
    
    func creatingObservableFromDictionary() {
        let bag = DisposeBag()
        let arrSquence = Observable.from([1 : "A", 2 : "B","C" : 1])
        let subscriberOfArray = arrSquence.subscribe(onNext: { (val) in
            print(val.key)
            print(val.value)
        }, onError: { (error) in
            print(error.localizedDescription)
        }, onCompleted: {
            print("completed")
        })
        subscriberOfArray.disposed(by: bag)
    }
}
