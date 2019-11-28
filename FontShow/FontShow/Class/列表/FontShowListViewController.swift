//
//  FontShowListViewController.swift
//  FontShow
//
//  Created by Neal on 2019/11/20.
//  Copyright © 2019 Neal. All rights reserved.
//

import UIKit
import Log


class FontShowListViewController: BaseViewController {
    
    var inputContent: String = ""
    
    var inputPopView: InputClickPopView!
    
    var tableView: UITableView!
    
    var textSearch: UITextField!
    
    var isExtend: [[Bool]] = []
    
    var arrFontListValue: [[String]] = []
    var arrFontListKey: [Any] = []
    
    var textContent = "This is the font i want to use!!! \n 1 2 3 4 5 6 7 8 9 0\n 来点中文看看支不支持"
    
    var gradients: [[(CGFloat, CGFloat)]] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "字体"
          
        self.setBtnRight()
        
        //新建字体状态监听
        NotificationCenter.default.addObserver(self, selector: #selector(fontsChangedNotification(_:)), name: kCTFontManagerRegisteredFontsChangedNotification as NSNotification.Name, object: nil)
        
        
        let fontarr = UIFont.familyNames.sorted(by: <)
        
        let dicFontList = Dictionary.init(grouping: fontarr, by: {$0.first!})
        let arrFont = dicFontList.values.sorted(by: {$0.first! < $1.first!})

        self.arrFontListValue = arrFont
        self.arrFontListKey = dicFontList.keys.sorted(by: <)

        for n in 0..<arrFontListValue.count {
            
            self.isExtend.append([])
            self.gradients.append([])
            let list = arrFontListValue[n]
            
            for _ in list {
                self.isExtend[n].append(false)
                let rLT: CGFloat = CGFloat(arc4random() % 360) / 360.0
                var rRB: CGFloat = rLT + 0.2
                if rRB > 1 {
                    rRB = rRB - 1
                }
                self.gradients[n].append((rLT, rRB))
            }
            
        }
        
        Log.Info(self.arrFontListValue)
        
        
        
        
    
        self.inputPopView = InputClickPopView.init(superView: self.tabBarController!.view)
        
        self.setMain()
        // Do any additional setup after loading the view.
    }
    
    @objc func fontsChangedNotification(_ sender: Any) {
        Log.Info("changed")
        
    }
    
    
    
    func setMain() {
        
        let y: CGFloat = (UIScreen.main.bounds.height > 800 ? 88 : 64)
        let height: CGFloat = (UIScreen.main.bounds.height > 800 ? 69 : 49)

        self.tableView = UITableView.init(frame: CGRect.init(origin: .init(x: 0, y: y), size: .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - y - height)), style: UITableView.Style.plain)
        self.tableView.backgroundColor = ColorList.whiteSmoke
        self.view.addSubview(self.tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorColor = .clear
        self.tableView.estimatedRowHeight = 0
        
    }
    
    
    
    func setBtnRight() {
        let btnRight = UIBarButtonItem.init(title: "Try", style: UIBarButtonItem.Style.plain, target: self, action: #selector(btnRightClick(_:)))
        self.navigationItem.rightBarButtonItem = btnRight
    }
    
    @objc func btnRightClick(_ sender: UIButton) {
        self.inputPopView.show()
    }
    


}

extension FontShowListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.isExtend[indexPath.section][indexPath.row] {
            return 180
        }
        return 60
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.isExtend.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.isExtend[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let font = arrFontListValue[indexPath.section][indexPath.row]
        
        let cell = UITableViewCell.init(frame: CGRect.init(origin: .zero, size: .init(width: tableView.frame.width, height: 60)))
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        
        var height:CGFloat = 45
        if self.isExtend[indexPath.section][indexPath.row] {
            height = 180 - 15
        }
            
        let viewContent = UIView.init(frame: .init(origin: .init(x: 15, y: 5), size: .init(width: tableView.frame.width - 30, height: height)))
        
        let gradientLayer = CAGradientLayer.init()
        gradientLayer.cornerRadius = 10
        gradientLayer.frame = viewContent.layer.bounds
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 1)
        
        
        let colors = self.gradients[indexPath.section][indexPath.row]
        
        let colorLT = UIColor.init(hue: colors.0, saturation: 0.9, brightness: 0.9, alpha: 1)
        let colorRB = UIColor.init(hue: colors.1, saturation: 0.9, brightness: 0.9, alpha: 1)
        gradientLayer.colors = [colorLT.cgColor, colorRB.cgColor]
        viewContent.layer.addSublayer(gradientLayer)
        
        //标题
        let lblFont = UILabel.init(frame: CGRect.init(origin: .init(x: 15, y: 0), size: .init(width: viewContent.frame.width - 30, height: 45)))
        lblFont.textColor = .white
        lblFont.font = UIFont.init(name: font, size: 24)
        
        
            
        lblFont.textAlignment = .left
        lblFont.adjustsFontSizeToFitWidth = true
        lblFont.text = font
        viewContent.addSubview(lblFont)
        
        //内容
        let lblContent = UILabel.init(frame: CGRect.init(origin: .init(x: 15, y: 60), size: .init(width: viewContent.frame.width - 30, height: 100)))
        lblContent.font = UIFont.init(name: font, size: 16)
        lblContent.text = self.textContent
        lblContent.numberOfLines = 0
        lblContent.adjustsFontSizeToFitWidth = true
        lblContent.textColor = .white
    
        if self.isExtend[indexPath.section][indexPath.row] {
            viewContent.addSubview(lblContent)
            lblFont.font = UIFont.boldSystemFont(ofSize: 24)
        }
        
        cell.addSubview(viewContent)
 
        return cell
    }
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.isExtend[indexPath.section][indexPath.row] = !self.isExtend[indexPath.section][indexPath.row]
        if self.isExtend[indexPath.section][indexPath.row] {
            self.tableView.reloadRows(at: [IndexPath.init(row: indexPath.row, section: indexPath.section)], with: UITableView.RowAnimation.left)
        } else {
            self.tableView.reloadRows(at: [IndexPath.init(row: indexPath.row, section: indexPath.section)], with: UITableView.RowAnimation.right)
        }
        
        
    }
    
}
