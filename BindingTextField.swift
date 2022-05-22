//
//  BindingTextField.swift
//  Binding_Example
//
//  Created by JunHwan Kim on 2022/05/21.
//

import Foundation
import UIKit


//MARK: - View to View Model
class BindingTextField: UITextField{
    
    var textChanged : (String) -> Void = {_ in }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder : NSCoder){
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
    }
    
    func bind(callback : @escaping (String) -> Void){
        textChanged = callback
    }
    
    @objc func textFieldDidChanged(_ textField : UITextField){
        if let text = textField.text{
            textChanged(text)
        }
    }
}
