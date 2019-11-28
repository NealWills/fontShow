//
//  InputClickPopView.swift
//  FontShow
//
//  Created by Neal on 2019/11/20.
//  Copyright © 2019 Neal. All rights reserved.
//

import UIKit

class InputClickPopView: UIView {

    var btnM = UIButton.init(frame: UIScreen.main.bounds)
    
    var viewContent: UIView!
    
    var textInput: UITextField!
    
    func show() {
        self.isHidden = false
        self.alpha = 0
        self.viewContent.transform = CGAffineTransform.init(scaleX: 0.7, y: 0.7)
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 1
            self.viewContent.transform = CGAffineTransform.init(scaleX: 1, y:1)
        }) { (_) in
            
        }
    }
    
    func dismiss() {
        self.isHidden = false
        self.alpha = 1
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 0
            self.viewContent.transform = CGAffineTransform.init(scaleX: 0.7, y: 0.7)
        }) { (_) in
            self.isHidden = true
        }
    }
    
    init(superView: UIView) {
        
        super.init(frame: UIScreen.main.bounds)
        
        
        
        self.alpha = 0
        self.isHidden = true
        
        self.setBtnM()
        self.setContent()
        
        superView.addSubview(self)
        
    }
    
    func setContent() {
        self.viewContent = UIView.init(frame: CGRect.init(origin: .zero, size: CGSize.init(width: 250, height: 160)))
        
        self.viewContent.backgroundColor = .white
        self.viewContent.center = self.center
        self.viewContent.layer.cornerRadius = 10
        
        self.addSubview(self.viewContent)
        
        let lblTitile = UILabel.init(frame: CGRect.init(origin: CGPoint.init(x: 15, y: 5), size: .init(width: self.viewContent.frame.width - 30, height: 50)))
        lblTitile.text = "input something"
        lblTitile.font = UIFont.boldSystemFont(ofSize: 23)
        lblTitile.textAlignment = .center
        lblTitile.textColor = .gray
        self.viewContent.addSubview(lblTitile)
        
        self.textInput = UITextField.init(frame: CGRect.init(origin: CGPoint.init(x: 30, y: 60), size: .init(width: self.viewContent.frame.width - 60, height: 30)))
        self.textInput.borderStyle = .roundedRect
        
        self.viewContent.addSubview(self.textInput)
        
        let line0 = UIView.init(frame: CGRect.init(origin: CGPoint.init(x: 5, y: self.viewContent.frame.height - 50), size: CGSize.init(width: self.viewContent.frame.width - 10, height: 1)))
        line0.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        self.viewContent.addSubview(line0)
        
        let line1 = UIView.init(frame: CGRect.init(origin: CGPoint.init(x: self.viewContent.frame.width / 2.0 - 0.5, y: self.viewContent.frame.height - 49), size: CGSize.init(width: 1, height: 48)))
        line1.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        self.viewContent.addSubview(line1)
        
        let btnCancel = UIButton.init(frame: CGRect.init(origin: CGPoint.init(x: 0, y: self.viewContent.frame.height - 50), size: CGSize.init(width: self.viewContent.frame.width / 2.0, height: 50)))
        btnCancel.setTitle("Cancel", for: .normal)
        btnCancel.addTarget(self, action: #selector(btnCancelClick(_:)), for: .touchUpInside)
        btnCancel.setTitleColor(UIColor.lightGray, for: .normal)
        self.viewContent.addSubview(btnCancel)
        
        let btnSure = UIButton.init(frame: CGRect.init(origin: CGPoint.init(x: self.viewContent.frame.width / 2.0, y: self.viewContent.frame.height - 50), size: CGSize.init(width: self.viewContent.frame.width / 2.0, height: 50)))
        btnSure.setTitle("Sure", for: .normal)
        btnSure.setTitleColor(UIColor.gray, for: .normal)
        btnSure.addTarget(self, action: #selector(btnSureClick(_:)), for: .touchUpInside)
        self.viewContent.addSubview(btnSure)
    }
    
    func setBtnM() {
        
        self.btnM.alpha = 0.5
        self.btnM.backgroundColor = .black
//        self.btnM.addTarget(self, action: #selector(btnMClick(_:)), for: .touchUpInside)
        self.addSubview(self.btnM)
        
    }
    
    @objc func btnMClick(_ sender: UIButton) {
        self.dismiss()
    }
    
    @objc func btnSureClick(_ sender: UIButton) {
        self.dismiss()
    }
    
    @objc func btnCancelClick(_ sender: UIButton) {
        self.dismiss()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
