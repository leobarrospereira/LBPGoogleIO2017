//
//  SessionsViewController.swift
//  LBPGoogleIO2017
//
//  Created by Leonardo Barros on 27/07/2017.
//  Copyright © 2017 Leonardo Barros. All rights reserved.
//

import UIKit

class SessionsViewController: UIViewController {

    var sessionsServices: SessionServicesContract!
    var sessions: [Session] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sessionsServices.fetchSessions { [weak self] (result) in
            switch result {
            case let .error(error):
                print(error)
            case let .data(data):
                DispatchQueue.main.async {
                    self?.sessions = data
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SessionDetailsSegue", let destination = segue.destination as? SessionDetailsViewController,
            let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            destination.session = sessions[indexPath.row]
        }
    }
}

extension SessionsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SessionCell", for: indexPath) as! SessionCell
        let session = sessions[indexPath.row]
        cell.titleLabel.text = session.title
        cell.tagsLabel.text = session.tags
        cell.colorView.backgroundColor = UIColor(rgbString: session.colorString)
        return cell
    }
}
