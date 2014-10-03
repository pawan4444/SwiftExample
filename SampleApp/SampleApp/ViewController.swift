//
//  ViewController.swift
//  myToDos
//
//  Created by Pawan Kumar Singh on 02/07/14.
//  Copyright (c) 2014 Genwi Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var helloWorldTxtFld: UITextField!
    var myImageView: UIImageView!
    var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "First View"

        //Adding a label
        let helloWorldLabel = UILabel(frame: CGRect(x: 20, y: 60, width: 280, height: 30))
        helloWorldLabel.text = "Hello World Example Application."
        helloWorldLabel.font = UIFont.boldSystemFontOfSize(17.0)
        helloWorldLabel.textAlignment = .Center
        self.view.addSubview(helloWorldLabel)
        
        //Adding a textField
        helloWorldTxtFld = UITextField(frame: CGRect(x: 20.0, y: 92.0, width: 280.0, height: 33.0))
        helloWorldTxtFld.delegate = self
        helloWorldTxtFld.borderStyle = .RoundedRect
        helloWorldTxtFld.placeholder = "Enter your name please"
        helloWorldTxtFld.textColor = UIColor.greenColor()
        helloWorldTxtFld.textAlignment = .Center
        self.view.addSubview(helloWorldTxtFld)
        
        //Adding a button
        let hiButton:UIButton = UIButton.buttonWithType(.Custom) as UIButton
        hiButton.frame = CGRect(x: 20, y: 140, width: 280, height: 34)
        hiButton.backgroundColor = UIColor(red: 0.0, green: 0.423, blue: 0.87, alpha: 1.0)
        hiButton.setTitle("Touch me, I am Button", forState: .Normal)
        hiButton.setTitleColor(UIColor.redColor(), forState: .Normal)
        hiButton.addTarget(self, action: "hiButton_Action:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hiButton)
        
        //Adding a scrollView
        let scrollview: UIScrollView = UIScrollView(frame: CGRect(x: 20.0, y: 195.0, width: 280.0, height: 300.0))
        scrollview.backgroundColor = UIColor.lightGrayColor()
        scrollview.contentSize = CGSize(width: 280.0, height: 600)
        self.view.addSubview(scrollview)
        
        //Adding a imageView
        myImageView = UIImageView(image: UIImage(named: "won.png"))
        myImageView.center = CGPoint(x: scrollview.frame.width/2, y: myImageView.center.y)
        scrollview.addSubview(myImageView)
        
        //Adding a UISegmentedController
        let segmentController: UISegmentedControl = UISegmentedControl(items: ["Won","Lost"])
        segmentController.selectedSegmentIndex = 0
        segmentController.addTarget(self, action: "segmentController_Action:", forControlEvents: .ValueChanged)
        segmentController.center = CGPoint(x: myImageView.center.x, y: 180)
        scrollview.addSubview(segmentController)

        //Adding a date picker
        let datePicker = UIDatePicker(frame: CGRect(x: -20, y: 200.0, width: 0, height: 0))
        datePicker.datePickerMode = .Date
        datePicker.addTarget(self, action: "datePicker_Action:", forControlEvents: .ValueChanged)
        scrollview.addSubview(datePicker)
        
        //Adding a slider
        let slider: UISlider = UISlider(frame: CGRect(x: 20.0, y:450.0 , width: 240.0, height: 20.0))
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0
        slider.value = 1.0
        slider.addTarget(self, action: "slider_Action:", forControlEvents: .ValueChanged)
        scrollview.addSubview(slider)
        
        //Adding a view
        myView = UIView(frame: CGRect(x: 20.0, y:480.0 , width: 240.0, height: 40.0))
        myView.backgroundColor = UIColor.redColor()
        scrollview.addSubview(myView)
        
        //Adding a button
        let nextButton:UIButton = UIButton.buttonWithType(.Custom) as UIButton
        nextButton.frame = CGRect(x: 20, y: 510, width: 280, height: 34)
        nextButton.backgroundColor = UIColor(red: 1.0, green: 0.423, blue: 0.17, alpha: 1.0)
        nextButton.setTitle("Let's Go to Next Page", forState: .Normal)
        nextButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        nextButton.addTarget(self, action: "nextButton_Action:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(nextButton)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UIButton Action -
    func hiButton_Action(sender: UIButton!) {
        
        var title = "Error"
        var message = "Please enter your name in textField"
        if helloWorldTxtFld.text.isEmpty == false {
            title = "Welcome"
            message = "We are happy to have you here, \(helloWorldTxtFld.text) !"
        }

        //First way to show alertView
        let alertView = UIAlertView(title: title, message: message, delegate: nil, cancelButtonTitle: "OK")
        alertView.show()
        
//        Another way of showing an alert
//        let alertView = UIAlertView()
//        alertView.title = title
//        alertView.message = message
//        alertView.delegate = nil
//        alertView.addButtonWithTitle("OK")
//        alertView.show()
        
    }
    
    func nextButton_Action(sender: UIButton){

        let nextVC = TableViewController()
        self.navigationController?.pushViewController(nextVC, animated: true);
    }
    
    // MARK: - UISegmentedController Action -
    func segmentController_Action(sender: UISegmentedControl)
    {
        if sender.selectedSegmentIndex == 0 {
            myImageView.image = UIImage(named: "won.png")
        }
        else if sender.selectedSegmentIndex == 1 {
            myImageView.image = UIImage(named: "lost.png")
        }
    }
    
    //MARK: - UIDatePicker Action -
    func datePicker_Action(sender: UIDatePicker)
    {
        //sender.date
    }
    
    //MARK: - UISlider Action -
    
    func slider_Action(sender : UISlider){
        myView.alpha = CGFloat(sender.value)
    }
    
    // MARK: - UITextFieldDelegate -
    func textFieldShouldReturn(textField: UITextField!) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
}

