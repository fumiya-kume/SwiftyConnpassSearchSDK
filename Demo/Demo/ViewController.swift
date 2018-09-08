//
//  ViewController.swift
//  Demo
//
//  Created by 久米史也 on 2018/08/26.
//  Copyright © 2018年 久米史也. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UITableViewController {
    
    @IBOutlet var eventTable: UITableView!
    let connpassSearch = ConnpassSearch()
    var events: [Event] = []
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell") as! MainCell
        cell.TitleLabel.text = events[indexPath.row].title
        cell.EventNumber.text = String(indexPath.row + 1)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let targetUrl = events[indexPath.row].eventUrl, let url = URL(string: targetUrl) {
            let viewController = SFSafariViewController(url: url)
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        
        let searchOption = ConnpassSearchOption()
        searchOption.keyword = ["Ruby"]
        searchOption.count = 30
        
        self.connpassSearch.Search(searchOption: searchOption){ response in
            if let events = (response.Data?.events){
                self.events = events
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

