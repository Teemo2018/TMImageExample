//
//  FirstViewController.swift
//  TMImageExample
//
//  Created by Teemo on 24/08/2017.
//  Copyright © 2017 Teemo. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    let mainTableView = UITableView()
    var array = ["CIBoxBlur"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() -> Void {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.frame = self.view.frame
        mainTableView.frame.origin.y = 64;
        
        self.view.addSubview(mainTableView)
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return  array.count
    }
    
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        var cell = tableView.dequeueReusableCell(withIdentifier: "FirstViewController")
        if cell != nil {
            cell?.textLabel?.text = array[indexPath.row]
        }
        else{
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "FirstViewController")
            cell?.textLabel?.text = array[indexPath.row]
            
        }
        return cell!
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let vc = CIBoxBlurViewController()
        self.navigationController!.pushViewController(vc, animated: true)
    }

}

