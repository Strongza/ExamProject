//
//  MasterViewController.swift
//  Project
//
//  Created by papob boonpat on 9/7/2562 BE.
//  Copyright © 2562 papob boonpat. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    
    var index: Int = 1
    
    lazy var examtestViewController: ExamTestViewController = {
        let storyboard = UIStoryboard(name: "ExamTest", bundle: Bundle.main)
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "ExamTestViewController") as! ExamTestViewController
        self.addViewControllerAsChildViewController(childViewController: viewController)
        
        return viewController
        
    }()
    
    lazy var exampicViewController: ExamPicViewController = {
        let storyboard = UIStoryboard(name: "ExamTest", bundle: Bundle.main)
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "ExamPicViewController") as! ExamPicViewController
        self.addViewControllerAsChildViewController(childViewController: viewController)
        
        return viewController
        
    }()
    
    lazy var examtestmultiViewController: ExamTestMultiViewController = {
        let storyboard = UIStoryboard(name: "ExamTest", bundle: Bundle.main)
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "ExamTestMultiViewController") as! ExamTestMultiViewController
        self.addViewControllerAsChildViewController(childViewController: viewController)
        
        return viewController
        
    }()
    
    lazy var exampicmulViewController: ExamPicMulViewController = {
        let storyboard = UIStoryboard(name: "ExamTest", bundle: Bundle.main)
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "ExamPicMulViewController") as! ExamPicMulViewController
        self.addViewControllerAsChildViewController(childViewController: viewController)
        
        return viewController
        
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    
        examtestViewController.questionLabel.text = " ส่งค่านาจาาาา "
        

    }
    
    private func setupView(){
        
        updateView()
        
    }
    
    private func updateView(){
        
        switch index {
        case 1:
            examtestViewController.view.isHidden = false
            examtestmultiViewController.view.isHidden = true
            exampicViewController.view.isHidden = true
            exampicmulViewController.view.isHidden = true
        case 2:
            examtestViewController.view.isHidden = true
            examtestmultiViewController.view.isHidden = false
            exampicViewController.view.isHidden = true
            exampicmulViewController.view.isHidden = true
        case 3:
            examtestViewController.view.isHidden = true
            examtestmultiViewController.view.isHidden = true
            exampicViewController.view.isHidden = false
            exampicmulViewController.view.isHidden = true
        case 4:
            examtestViewController.view.isHidden = true
            examtestmultiViewController.view.isHidden = true
            exampicViewController.view.isHidden = true
            exampicmulViewController.view.isHidden = false
        default:
            examtestViewController.view.isHidden = true
            examtestmultiViewController.view.isHidden = true
            exampicViewController.view.isHidden = true
            exampicmulViewController.view.isHidden = true
        }
        
    }
    
    private func addViewControllerAsChildViewController(childViewController: UIViewController){
       addChild(childViewController)
        view.addSubview(childViewController.view)
        childViewController.view.frame = view.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight ]
        self.view.sendSubviewToBack(childViewController.view)
        childViewController.didMove(toParent: self)
    }
    
    
    @IBAction func Previous(_ sender: Any) {
        index -= 1
        print(index)
        updateView()
        
    }
    @IBAction func Next(_ sender: Any) {
        index += 1
        print(index)
        updateView()
    }
    
}
