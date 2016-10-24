//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Intertrack SH on 19/10/16.
//  Copyright © 2016 Intertrack SH. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

	@IBOutlet weak var recordingButton: UIButton!
	@IBOutlet weak var stopRecordingButton: UIButton!
	@IBOutlet weak var recordingLabel: UILabel!
	
    var audioRecorder:AVAudioRecorder!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
        
	}

	@IBAction func recordAudio(_ sender: AnyObject) {
		recordingLabel.text = "Recording in progress";
		stopRecordingButton.isEnabled = true;
		recordingButton.isEnabled = false;
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.
            userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURL(withPathComponents:pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
	}

	@IBAction func stopRecording(_ sender: AnyObject) {
		recordingLabel.text = "Tap to record";
		stopRecordingButton.isEnabled = false;
		recordingButton.isEnabled = true;
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
	}
	
	override func viewWillAppear(_ animated: Bool) {
		print("viewWillAppear called");
		stopRecordingButton.isEnabled = false;
	}
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("audioRecorderDidFinishRecording called")
        if (flag) {
            self.performSegueWithIdentifier("stopRecording", sender: audioRecorder.url)
        } else {
            print("Saving of recording failed")
        }
    }
	
}

