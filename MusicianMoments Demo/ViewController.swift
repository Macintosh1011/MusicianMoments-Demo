//
//  ViewController.swift
//  MusicianMoments Demo
//
//  Created by Idan Kestenbom on 10/24/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVCaptureFileOutputRecordingDelegate {

    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var movieOutput: AVCaptureMovieFileOutput?
    var recordingTimer: Timer?
    var secondsRemaining = 15

    // Specify the directory to save videos in the app's Documents directory
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let outputDirectory = "RecordedVideos"

    @IBOutlet weak var timerLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCaptureSession()
        setupPreviewLayer()
        setupMovieOutput()
        createOutputDirectory()
        updateTimerLabel()
    }

    func createOutputDirectory() {
        let outputURL = documentsDirectory.appendingPathComponent(outputDirectory)
        do {
            try FileManager.default.createDirectory(at: outputURL, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print("Error creating output directory: \(error.localizedDescription)")
        }
    }

    func setupCaptureSession() {
        captureSession = AVCaptureSession()

        guard let captureSession = captureSession else { return }

        // Configure the input device (camera)
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput

        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }

        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            return
        }

        // Configure the output (movie file)
        movieOutput = AVCaptureMovieFileOutput()

        if (captureSession.canAddOutput(movieOutput!)) {
            captureSession.addOutput(movieOutput!)
        }

        // Start the session
        captureSession.startRunning()
    }

    func setupPreviewLayer() {
        guard let captureSession = captureSession else { return }

        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)

        guard let videoPreviewLayer = videoPreviewLayer else { return }

        videoPreviewLayer.videoGravity = .resizeAspectFill
        videoPreviewLayer.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer)
    }

    func setupMovieOutput() {
        movieOutput?.connection(with: .video)?.videoOrientation = .portrait
    }

    func updateTimerLabel() {
        timerLabel.text = "\(secondsRemaining) seconds"
    }

    @IBAction func startRecording(_ sender: UIButton) {
        guard let movieOutput = movieOutput else { return }

        let outputFileName = UUID().uuidString
        let outputFilePath = documentsDirectory.appendingPathComponent(outputDirectory).appendingPathComponent("\(outputFileName).mov")


        let outputFilePath = documentsDirectory.appendingPathComponent(outputDirectory).appendingPathComponent("\(outputFileName).mov").path


        // Start the timer to stop recording after 15 seconds
        recordingTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @objc func updateTimer() {
        secondsRemaining -= 1
        updateTimerLabel()

        if secondsRemaining <= 0 {
            stopRecording()
        }
    }

    func stopRecording() {
        movieOutput?.stopRecording()
        recordingTimer?.invalidate()
        secondsRemaining = 15
        updateTimerLabel()
    }

    // MARK: - AVCaptureFileOutputRecordingDelegate

    func fileOutput(_ output: AVCaptureFileOutput, didStartRecordingTo fileURL: URL, from connections: [AVCaptureConnection]) {
        // Handle recording start
    }

    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        // Handle recording finish
        if let error = error {
            print("Error recording video: \(error.localizedDescription)")
        } else {
            // Move the recorded video to the app's specific directory
            let outputURL = documentsDirectory.appendingPathComponent(outputDirectory).appendingPathComponent(UUID().uuidString).appendingPathExtension("mov")

            do {
                try FileManager.default.moveItem(at: outputFileURL, to: outputURL)
                print("Video saved at: \(outputURL)")
            } catch {
                print("Error moving video to destination: \(error.localizedDescription)")
            }
        }
    }
}

