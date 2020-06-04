//
//  ResultsViewController.swift
//  SwiftQuiz
//
//  Created by Denis Vlaskin on 04.06.2020.
//  Copyright © 2020 Denis Vlaskin. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    

    @IBAction func clearResults(_ sender: Any) {
        Game.shared.clearRecords()
        tableView.reloadData()
    }
    
    @IBAction func leaveResults(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ResultsViewController: UITableViewDelegate {
    
}

extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.getRecordsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordCell", for: indexPath)
        
        let result = Game.shared.getRecordsByIndex(index: indexPath.row) ?? 0.0
        cell.textLabel?.text = "\(result) %"
        
        return cell
    }
}
