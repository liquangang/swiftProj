//
//  UITestVcViewController.swift
//  IOSSwiftProj
//
//  Created by liquangang on 2018/4/9.
//  Copyright © 2018年 liquangang. All rights reserved.
//

import UIKit

class UITestVcViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpUI()
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
    
    func setUpUI() {
        let tmpNum = 100
        
        //frame方式设置view布局
        let tmpView: UIView = {
            let tmpView = UIView()
            tmpView.frame = CGRect(x: tmpNum, y: tmpNum, width: tmpNum, height: tmpNum)
            tmpView.backgroundColor = UIColor.orange
            return tmpView
        }()
        view.addSubview(tmpView)
        tmpView.translatesAutoresizingMaskIntoConstraints = true
        tmpView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        tmpView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        tmpView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        tmpView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }

}
