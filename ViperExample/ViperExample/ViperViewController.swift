//  ViperViewController.swift
//  ViperExample
//  Created by Alejo on 12/7/16.
//  Copyright © 2016 gapps. All rights reserved.
//  This file was generated by the VIPER Swift Xcode Templates
import UIKit
class ViperViewController: UIViewController, ViperViewProtocolPresenter, ViewControllerProtocolBase {
    typealias PresenterType = ViperPresenterProtocolView
    var presenter:ViperPresenterProtocolView!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        print("VIEW CONTROLLER CALL PRESENTER")
        presenter.loadData()
    }
    
    func setData() {
        print("ARRIVE DATA FROM PRESENTER")
        label.text = "DATA LOADED"
    }
}

