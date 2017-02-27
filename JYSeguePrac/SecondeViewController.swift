//
//  SecondeViewController.swift
//  JYSeguePrac
//
//  Created by atom on 2017/2/27.
//  Copyright © 2017年 atom. All rights reserved.
//

import UIKit

class SecondeViewController: UIViewController {
    
    var previousNav: UINavigationController!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SecondeViewController"
        // Do any additional setup after loading the view.
        
        let item = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(dismissSelf))
        self.navigationItem.leftBarButtonItem = item
    }
    
   func dismissSelf() {
        if (self.previousNav != nil) {
            self.previousNav.view.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
            UIView.animate(withDuration: 0.5, animations: { [unowned self] in
                self.previousNav.view.transform = .identity
                
            }, completion: { (_) in
                
            })
            
            self.dismiss(animated: true, completion: {
                
            })
        } else {
            
            self.dismiss(animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
