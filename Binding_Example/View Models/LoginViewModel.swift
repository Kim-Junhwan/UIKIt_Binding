//
//  LoginViewModel.swift
//  Binding_Example
//
//  Created by JunHwan Kim on 2022/05/21.
//

import Foundation

class Dynamic<T>{
    typealias Listner = (T) -> Void
    var listner : Listner?
    
    var value : T{
        didSet{
            listner?(value)
        }
    }
    
    func bind(callback : @escaping (T) -> Void){
        self.listner = callback
    }
    
    init(_ value : T){
        self.value = value
    }
}

struct LoginViewModel{
    var username = Dynamic("")
    var password = Dynamic("")
}
