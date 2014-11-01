//
//  TableViewController.swift
//  myToDos
//
//  Created by Pawan Kumar Singh on 26/08/14.
//  Copyright (c) 2014 Pawan Kumar Singh. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override init() {
        super.init()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "Table View"

        //adding a label
        let helloWorldLabel = UILabel(frame: CGRect(x: 20, y: 60, width: 280, height: 30))
        helloWorldLabel.text = "Screen 2"
        helloWorldLabel.font = UIFont.boldSystemFontOfSize(17.0)
        helloWorldLabel.textAlignment = .Center
        helloWorldLabel.textColor = UIColor(red: 1.0, green: 0.423, blue: 0.17, alpha: 1.0)
        self.view.addSubview(helloWorldLabel)
        
        let tableView = UITableView(frame: CGRect(x: 20, y: 100, width: 280, height: 400), style: .Plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)

    }

    // MARK: - UITableViewDataSource -
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCellWithIdentifier("identifier") as? UITableViewCell
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier:"identifier")
        }
        cell?.textLabel.text = "This is row number \(indexPath.row+1)"
        if indexPath.row % 2 == 0 {
            cell?.imageView.image = UIImage(named: "won.png")
            cell?.textLabel.textColor = UIColor.greenColor()
        }else {
            cell?.imageView.image = UIImage(named: "lost.png")
            cell?.textLabel.textColor = UIColor.redColor()
        }
        return cell!
    }
    
    // MARK: - UITableViewDelegate -
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        let alertView = UIAlertView()
        alertView.title = ""
        alertView.message = "You have touched row number \(indexPath.row+1)"
        alertView.delegate = nil
        alertView.addButtonWithTitle("OK")
        alertView.show()

    }

}
