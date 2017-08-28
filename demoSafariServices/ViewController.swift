//
//  ViewController.swift
//  demoSafariServices
//
//  Created by 陳鈞廷 on 2017/8/28.
//  Copyright © 2017年 陳鈞廷. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate{
    let urlButton = UIButton()
    let foodNameInput = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.urlButton.frame = CGRect(x: (self.view.frame.size.width - 100)/2, y: self.view.frame.size.height - 200, width: 100, height: 50)
        self.urlButton.backgroundColor = UIColor.gray
        self.urlButton.setTitle("open safari", for: .normal)
        self.urlButton.addTarget(self, action: #selector(openUrl), for: .touchUpInside)
        
        self.foodNameInput.frame = CGRect(x: (self.view.frame.size.width - 200)/2, y: 250, width: 200, height: 50)
        self.foodNameInput.placeholder = "請輸入食物名稱"
        self.foodNameInput.backgroundColor = UIColor.lightGray
        
        self.view.addSubview(self.foodNameInput)
        self.view.addSubview(self.urlButton)
        
    }
    @objc func openUrl(sender: UIButton){
        var searchString: String?
        if let foodName = foodNameInput.text{
            searchString = foodName+"熱量"
            searchString = searchString?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        }
        let url = URL(string: "https://www.google.com.tw/search?q="+searchString!)
        let svc = SFSafariViewController(url: url!)
        self.safariViewControllerDidFinish(controller: svc)
        svc.delegate = self
        self.present(svc, animated: true, completion: nil)
    }
    private func safariViewControllerDidFinish(controller: SFSafariViewController)
    {
        controller.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

