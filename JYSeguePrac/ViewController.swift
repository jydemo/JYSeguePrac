//
//  ViewController.swift
//  JYSeguePrac
//
//  Created by atom on 2017/2/27.
//  Copyright © 2017年 atom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let screenWidth = UIScreen.main.bounds.width
    let screentHeight = UIScreen.main.bounds.height

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        secondVC.previousNav = self.navigationController
        animToNextViewController(secondVC, with: CGRect(x: 0, y: screentHeight / 2 - 20, width: screenWidth, height: 40))
    }
    
    private func animToNextViewController(_ viewController: UIViewController, with beginRect: CGRect) {
       // 背景视图
        let window = UIApplication.shared.keyWindow!
        let shadowBack = UIView(frame: window.bounds)
        shadowBack.backgroundColor = UIColor.black
        shadowBack.alpha = 0.7
        window.addSubview(shadowBack)
        //白色色块视图
        let frontWhiteView = UIView(frame: beginRect)
        frontWhiteView.backgroundColor = UIColor.white
        window.addSubview(frontWhiteView)
        
        let timeInterval: TimeInterval = 5.0
        //视图动画
        UIView.animate(withDuration: timeInterval / 5, animations: { [unowned self] in
            //开始frame
            frontWhiteView.frame = CGRect(x: 0, y: self.screentHeight / 2 - 18, width: self.screenWidth, height: 36)
        }) { (_) in
            UIView.animate(withDuration: 4 * timeInterval / 5, animations: { [unowned self] in
                //结束frame 从一个色块放大到整个屏幕
                frontWhiteView.frame = CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screentHeight)
                
            }, completion: { (_) in
                //把第二个是包括在导航控制器中
                let nav = UINavigationController(rootViewController: viewController)
                //和视图渲染有关
                viewController.modalPresentationStyle = .currentContext
                nav.modalPresentationStyle = .overCurrentContext
                self.present(nav, animated: false, completion: {
                    //移除背景和色块视图
                    shadowBack.removeFromSuperview()
                    frontWhiteView.removeFromSuperview()
                })
            })
        }
        //对第二个视图进行动画
        UIView.animate(withDuration: timeInterval, animations: { [unowned self] in
            self.navigationController?.view.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        }) { (_) in
            self.navigationController?.view.transform = .identity
        }
    }
    
    private lazy var secondVC: SecondeViewController = {
        
        let secondVC = SecondeViewController()
        return secondVC
    
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

