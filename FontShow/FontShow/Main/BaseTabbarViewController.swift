//
//  BaseTabbarViewController.swift
//  FontShow
//
//  Created by Neal on 2019/11/20.
//  Copyright © 2019 Neal. All rights reserved.
//

import UIKit

class BaseTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let arrSelectImg:[UIImage] = [UIImage.init(named: "tabbar_00")!, UIImage.init(named: "tabbar_01")!, UIImage.init(named: "tabbar_02")!]

        self.addChildVC(vc: FontShowListViewController(), title: "字体", image: arrSelectImg[0], selectedImage: arrSelectImg[0])
        
        self.addChildVC(vc: AddFontViewController(), title: "导入", image: arrSelectImg[1], selectedImage: arrSelectImg[1])
        
        self.addChildVC(vc: SettingViewController(), title: "设置", image: arrSelectImg[2], selectedImage: arrSelectImg[2])
        
    }
    
    func addChildVC(vc: UIViewController, title: String, image: UIImage, selectedImage: UIImage) {
        
        let vc = UINavigationController.init(rootViewController: vc)
        vc.title = title
        vc.tabBarItem.image = image
        vc.tabBarItem.selectedImage = selectedImage
        self.addChild(vc)
        
    }
    
    func setCustomTabbar() {
        self.tabBar.isHidden = true
    }
    



}
