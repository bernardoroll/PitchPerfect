//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Intertrack SH on 19/10/16.
//  Copyright © 2016 Intertrack SH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var recordingButton: UIButton!
	@IBOutlet weak var stopRecordingButton: UIButton!

	@IBOutlet weak var recordingLabel: UILabel!
	
	
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
	}

	@IBAction func stopRecording(_ sender: AnyObject) {
		recordingLabel.text = "Tap to record";
		stopRecordingButton.isEnabled = false;
		recordingButton.isEnabled = true;
	}
//	@IBAction func recordAudio(_ sender: AnyObject) {
//		print("record button was pressed");
//		recordingLabel.text = "Recording in progress";
//	}
//	
//	@IBAction func stopRecordingAudio(_ sender: AnyObject) {
//		print("stop recording button pressed");
//	}
	
	override func viewWillAppear(_ animated: Bool) {
		print("viewWillAppear called");
		stopRecordingButton.isEnabled = false;
		
	}
	
}

