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
        posterView.layer.cornerRadius = 10.0
        matchButton.tintColor = UIColor.systemCyan
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
            timestampLabel.text = "Found at \(timestamp.hour) hours \(timestamp.minute) minutes \(timestamp.second) seconds"
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

extension TimeInterval {
    var hourMinuteSecondMS: String {
        String(format:"%d:%02d:%02d.%03d", hour, minute, second, millisecond)
    }
    var minuteSecondMS: String {
        String(format:"%d:%02d.%03d", minute, second, millisecond)
    }
    var hour: Int {
        Int((self/3600).truncatingRemainder(dividingBy: 3600))
    }
    var minute: Int {
        Int((self/60).truncatingRemainder(dividingBy: 60))
    }
    var second: Int {
        Int(truncatingRemainder(dividingBy: 60))
    }
    var millisecond: Int {
        Int((self*1000).truncatingRemainder(dividingBy: 1000))
    }
}
