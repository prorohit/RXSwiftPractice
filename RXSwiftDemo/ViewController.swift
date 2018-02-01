//
//  ViewController.swift
//  RXSwiftDemo
//
//  Created by Rohit Singh on 1/3/18.
//  Copyright © 2018 Rohit Singh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class ViewController: UIViewController {
    var arrOfInputs = [Dictionary<String, Any>]()

    @IBOutlet weak var tableViewOfItems: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func configure() {
        configureData()
        self.tableViewOfItems.delegate = self
        self.tableViewOfItems.dataSource = self
        self.tableViewOfItems.reloadData()
    }
    
    func configureData() {
        let dict = ["item": "Observable Sequence",
                    "items":["Observable Sequence for Strings",
                             "Observable Sequence for Integers",
                             "Observable Sequence for Dictionaries"]] as [String : Any]
        self.arrOfInputs.append(dict)
    }
    
    func demoOfObservableSequence() {
        let bag = DisposeBag()
        let helloObservableSeq = Observable.just("Hello Rohit");
        let dictObservableSeq = Observable.from(["id" : "1", "name" : "Rohit"]);
        
        let subscriptionHello = helloObservableSeq.subscribe { (event) in
            print(event)
            switch event {
            case .next(let val):
                print(val)
            case .completed:
                print("completed")
            case .error(let err):
                print(err.localizedDescription)
                
            
            }
        }
        // Disposing
        subscriptionHello.disposed(by: bag)
        
        let subScriptionDict = dictObservableSeq.subscribe { (event) in
            print(event.element?.key as Any)
            print(event.element?.value as Any)
        }
        // Disposing
        subScriptionDict.disposed(by: bag)
    
    }
    
    func demoOfSubjects() {
        let bag = DisposeBag()
        
        // Publish Subject Creation
        var publishSubject = PublishSubject<String>()
       
        // Behavious Subject Creation
        var behaviourSubject = BehaviorSubject(value: "123")
        behaviourSubject.onNext("Behaviour 1")
        behaviourSubject.onNext("Behavious 2")
        
        
        // Subscription to the Behaviour Subject
        let subscriptionBehaviour = behaviourSubject.subscribe { (str) in
            print(str)
        }
        
        
        // In case of Publish Subject we have to subscribe to it before adding any element to it. Otherwise we wont be able to get any values as a result of subscription onNext methof.
        let subscriptionPublish = publishSubject.subscribe(onNext: {
            print($0)
        }, onError: { (erro) in

        }, onCompleted: {

        }) {

        }
        
        publishSubject.onNext("Hello")
        publishSubject.onNext("Singh")
        
        
    }

    @IBAction func tapObservable(_ sender: UIButton) {
        self.demoOfSubjects()
    }
    
    
}

