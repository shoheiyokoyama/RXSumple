//: Playground - noun: a place where people can play

import UIKit
import RxSwift


//RXSwift Example
//https://github.com/ReactiveX/RxSwift/blob/master/Documentation/Examples.md

//var c = ""
//var a = 1
//var b = 2
//
//if a + b >= 0 {
//    c = "\(a + b) is positive"
//}
//
//a = 4
//print(c)

let a = Variable<Int>(1)
let b = Variable<Int>(2)

let c = Observable
    .combineLatest(a.asObservable(), b.asObservable()) { $0 + $1 }
    .filter { $0 >= 0 }
    .map { "\($0) is positive" }
    .subscribeNext { print($0) }
//"3 is positive"

a.value = 4//"6 is positive"
b.value = -8// doesn't print anything

[1, 2, 3, 4, 5]
    .toObservable()
    .subscribeNext { print($0) }
