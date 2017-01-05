//
//  ViewController.swift
//  iOSFeedbackExamples
//
//  Created by Jianing Zheng on 1/4/17.
//  Copyright © 2017 Jianing Zheng. All rights reserved.
//

import UIKit

class FeedbackTableViewController: UITableViewController {

    let feedbackViewModel = FeedbackViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedbackViewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedbackCell", for: indexPath)
        cell.textLabel?.text = feedbackViewModel.titleForRow(row: indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let targetVC = UIStoryboard(name: feedbackViewModel.storyboardNameForRow(row: indexPath.row), bundle: nil).instantiateViewController(withIdentifier: feedbackViewModel.viewControllerIdentifierForRow(row: indexPath.row))
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
    
    private func setupUI() {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }

}

