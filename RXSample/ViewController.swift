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

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLalelText()
        buttonTapAction()
    }
    
    private func updateLalelText() {
        textField.rx_text
            .subscribeNext { [unowned self] text in
                self.label.text = text
            }
            .addDisposableTo(disposeBag)
    }
    
    private func buttonTapAction() {
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

