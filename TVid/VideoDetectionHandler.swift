//
//  VideoDetectionHandler.swift
//  VideoDetectionHandler
//
//  Created by Luigi on 25/07/21.
//

import ShazamKit
import AVFAudio

protocol VideoDetectionHandlerDelegate {
    func foundVideo(info: EpisodeData, timestamp: TimeInterval)
}

class VideoDetectionHandler: NSObject, SHSessionDelegate {
    
    var session: SHSession?
    let audioEngine = AVAudioEngine()
    
    var delegate: VideoDetectionHandlerDelegate?
    func setup(){
        let catalog = SHCustomCatalog()
        
        for episode in episodes {
            if let signature = getSignature(name: episode.signatureFilename) {
                try? catalog.addReferenceSignature(signature, representing: [SHMediaItem(properties: [.episodeInfo : episode])])
            }
        }
        
        session = SHSession(catalog: catalog)
        session?.delegate = self
        
        let audioFormat = AVAudioFormat(standardFormatWithSampleRate: audioEngine.inputNode.outputFormat(forBus: 0).sampleRate, channels: 1)
        audioEngine.inputNode.installTap(onBus: 0, bufferSize: 2048, format: audioFormat) { [weak session] buffer, audioTime in
            session?.matchStreamingBuffer(buffer, at: audioTime)
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(.record)
        AVAudioSession.sharedInstance().requestRecordPermission { [weak self] success in
            guard success, let self = self else { return }
            try? self.audioEngine.start()
            print("audioEngine started")
        }
        } catch {
            print(error)
        }
    }
    
    func getSignature(name: String) -> SHSignature? {
        guard let signatureURL = Bundle.main.url(forResource: name, withExtension: "shazamsignature")
        else { return nil}
        do {
            let signatureData = try Data(contentsOf: signatureURL)
            return try SHSignature(dataRepresentation: signatureData)
        } catch {
            print(error)
            return nil
        }
    }
    
    func session(_ session: SHSession, didFind match: SHMatch) {
        guard let item = match.mediaItems.first,
              let episodeInfo = item.episodeInfo else { return }
        delegate?.foundVideo(info: episodeInfo, timestamp: item.predictedCurrentMatchOffset)
    }
}
