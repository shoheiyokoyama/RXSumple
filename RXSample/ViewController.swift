//
//  ViewController.swift
//  RXSample
//
//  Created by Shohei yokoyama on 2016/05/26.
//  Copyright © 2016年 Shohei. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

//UIComponentに対する拡張メソッド
//https://github.com/ReactiveX/RxSwift/blob/master/Documentation/API.md


class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var slider: UISlider!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rxTextField()
        rxButton()
        rxSlider()
    }
    
    private func rxSlider() {
        slider.rx_value
            .map { String($0) }
            .bindTo(label.rx_text)
            .addDisposableTo(disposeBag)
    }
    
    private func rxTextField() {
        textField.rx_text
            .subscribeNext { [unowned self] text in
                self.label.text = text
            }
            .addDisposableTo(disposeBag)
        
        textField.rx_text
            .filter { str in  str.characters.count > 3 }
            .subscribeNext { str in print(str) }
            .addDisposableTo(disposeBag)
    }
    
    private func rxButton() {
        button.rx_tap
        .subscribeNext { _ in
            print("tapped!")
        }
        .addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

