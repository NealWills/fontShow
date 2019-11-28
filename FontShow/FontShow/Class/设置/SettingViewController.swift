//
//  SettingViewController.swift
//  FontShow
//
//  Created by Neal on 2019/11/20.
//  Copyright © 2019 Neal. All rights reserved.
//

import UIKit
import Log

class SettingViewController: BaseViewController {
    
    var tableView: UITableView!
    
    var colorMode = 1

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "设置"
        
        self.setMain()
        
        self.view.backgroundColor = ColorList.antiqueWhite
    }
    
    func setMain() {
        
        let y: CGFloat = (UIScreen.main.bounds.height > 800 ? 88 : 64)
        let height: CGFloat = (UIScreen.main.bounds.height > 800 ? 69 : 49)
        
        self.tableView = UITableView.init(frame: CGRect.init(origin: CGPoint.init(x: 0, y: y), size: CGSize.init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - y - height)))
        self.tableView.backgroundColor = ColorList.whiteSmoke
        
        self.tableView.separatorStyle = .none
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        
        
    }

}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell.init(frame: CGRect.init(origin: .zero, size: .init(width: tableView.frame.width, height: 50)))
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = #colorLiteral(red: 0.8078431373, green: 0.8078431373, blue: 0.8078431373, alpha: 1)
        
        let lblTitle = UILabel.init(frame: .init(origin: .init(x: 15, y: 0), size: .init(width: 100, height: 50)))
        if indexPath.section == 0 {
            lblTitle.text = "颜色"
        } else if indexPath.section == 1 {
            lblTitle.text = "字体"
        } else if indexPath.section == 2 {
            lblTitle.text = "重置"
        } else {
            lblTitle.text = "关于我们"
        }
        
        cell.addSubview(lblTitle)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView.init(frame: .init(origin: .zero, size: .init(width: tableView.frame.width, height: 20)))
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            let alert = UIAlertController.init(title: "确定要重置？", message: "\n这样会清除所有的收藏和设置\n且无法撤回", preferredStyle: UIAlertController.Style.alert)
            let alertCancel = UIAlertAction.init(title: "取消", style: UIAlertAction.Style.cancel) { (_) in
                
            }
            
            let alertSure = UIAlertAction.init(title: "确定", style: UIAlertAction.Style.default) { (_) in
                
            }
            
            alert.addAction(alertCancel)
            alert.addAction(alertSure)
            
            self.navigationController?.present(alert, animated: true, completion: {
                
            })
        } else if indexPath.section == 3 {
            if #available(iOS 13.0, *) {
                let vc = UIFontPickerViewController.init()
                vc.delegate = self
                self.navigationController?.present(vc, animated: true, completion: {
                    
                })
            } else {
                // Fallback on earlier versions
            }
            
        } else if indexPath.section == 0 {

        }
    }
    
}

@available(iOS 13.0, *)
extension SettingViewController: UIFontPickerViewControllerDelegate {
    func fontPickerViewControllerDidPickFont(_ viewController: UIFontPickerViewController) {
       
         Log.Info(viewController.selectedFontDescriptor!.fontAttributes.values.first!)
        viewController.dismiss(animated: true) {
            viewController.delegate = nil
        }
    }
    
    func fontPickerViewControllerDidCancel(_ viewController: UIFontPickerViewController) {
        viewController.dismiss(animated: true) {
            viewController.delegate = nil
        }
    }
}


