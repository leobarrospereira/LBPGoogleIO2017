//
//  SessionDetailsViewController.swift
//  LBPGoogleIO2017
//
//  Created by Leonardo Barros on 31/07/2017.
//  Copyright © 2017 Leonardo Barros. All rights reserved.
//

import UIKit
import SafariServices

class SessionDetailsViewController: UIViewController {

    var session: Session!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = session.title
        descriptionLabel.text = session.description
        tagsLabel.text = session.tags
    }

    @IBAction func watchOnYoutubeTapped(_ sender: UIButton) {
        let safariViewController = SFSafariViewController(url: session.videoURL)
        navigationController?.present(safariViewController, animated: true, completion: nil)
    }
    
    @IBAction func sessionPageTapped(_ sender: UIButton) {
        let safariViewController = SFSafariViewController(url: session.sessionURL)
        navigationController?.present(safariViewController, animated: true, completion: nil)
    }
}
