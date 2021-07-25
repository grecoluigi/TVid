//
//  ViewController.swift
//  TVid
//
//  Created by Luigi on 25/07/21.
//

import UIKit

class ViewController: UIViewController, VideoDetectionHandlerDelegate {

    @IBOutlet weak var matchButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var episodeNumberLabel: UILabel!
    @IBOutlet weak var episodeDescriptionLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var timestampLabel: UILabel!
    var matchFound = false
    var episode: EpisodeData? {
        didSet {
            DispatchQueue.main.async {
                self.matchFound = self.episode != nil
            }
        }
    }
    let detectionHandler = VideoDetectionHandler()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "viewBackground")!)
        detectionHandler.delegate = self
    }
    
    @IBAction func matchButtonPressed(_ sender: Any) {
        matchButton.isEnabled = false
        matchButton.setTitle("Matching...", for: .normal)
        detectionHandler.setup()
    }
    func foundVideo(info: EpisodeData, timestamp: TimeInterval) {
        DispatchQueue.main.async { [self] in
            
            episode = info
            titleLabel.text = episode?.title
            episodeNumberLabel.text = episode?.episodeNumber
            timestampLabel.text = "Found match at \(timestamp.description) seconds"
            episodeDescriptionLabel.text = episode?.additionalInfo
            let posterURL = URL(string: episode!.thumbnailURLPath)
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: posterURL!) {
                    if let posterImage = UIImage(data: data){
                        DispatchQueue.main.async {
                            posterView.image = posterImage
                        }
                    }
                }
            }
            //posterView.image = UIImage(
        }
    }

    
}
