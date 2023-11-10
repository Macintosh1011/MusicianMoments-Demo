//
//  CameraViewController.swift
//  MusicianMoments Demo
//
//  Created by Idan Kestenbom on 11/10/23.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController, AVCaptureFileOutputRecordingDelegate {


    public var outputURL: URL?
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var movieOutput: AVCaptureMovieFileOutput?
    var recordingTimer: Timer?
    var secondsRemaining = 3 //FIXME: change back to 15 seconds.

    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let outputDirectory = "RecordedVideos"

    let timerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()

    let recordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(startRecording), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCaptureSession()
        setupPreviewLayer()
        setupMovieOutput()
        setupUI()
        createOutputDirectory()
        updateTimerLabel()
    }

    func setupUI() {
        view.addSubview(timerLabel)

           NSLayoutConstraint.activate([
               timerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
               timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
           ])

           // Add recordButton
           view.addSubview(recordButton)

           NSLayoutConstraint.activate([
               recordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               recordButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
               recordButton.widthAnchor.constraint(equalToConstant: 60),
               recordButton.heightAnchor.constraint(equalToConstant: 60)
           ])
        view.bringSubviewToFront(timerLabel)
           view.bringSubviewToFront(recordButton)
    }

    func createOutputDirectory() {
        outputURL = documentsDirectory.appendingPathComponent(outputDirectory)
        do {
            try FileManager.default.createDirectory(at: outputURL!, withIntermediateDirectories: true, attributes: nil)
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

    @objc func startRecording() {
        guard let movieOutput = movieOutput else { return }

        let outputFileName = UUID().uuidString
        let outputFilePath = documentsDirectory.appendingPathComponent(outputDirectory).appendingPathComponent("\(outputFileName).mov")

        do {
            print("Start recording")
            try movieOutput.startRecording(to: outputFilePath, recordingDelegate: self)
        } catch {
            print("Error starting recording: \(error.localizedDescription)")
        }


        // Start the timer to stop recording after 15 seconds
        recordingTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @objc func updateTimer() {
        secondsRemaining -= 1
        DispatchQueue.main.async {
            self.updateTimerLabel()
        }

        if secondsRemaining <= 0 {
            DispatchQueue.main.async {
                self.stopRecording()
            }
        }
    }

    func stopRecording() {
        movieOutput?.stopRecording()
        recordingTimer?.invalidate()
        secondsRemaining = 15
        updateTimerLabel()

        DispatchQueue.main.async {
            let nextViewController = FinalTouchViewController() 
            weak var viewControllerFinal: FinalTouchViewController?
            viewControllerFinal?.recordedVideoURL = self.outputURL// Replace with your view controller's name
            nextViewController.modalPresentationStyle = .fullScreen
            self.present(nextViewController, animated: true)
        }

        // Move to a different view controller when recording finishes
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
            let defaults = UserDefaults.standard
            defaults.set(outputURL, forKey: "URL")

            do {
                try FileManager.default.moveItem(at: outputFileURL, to: outputURL)
                print("Video saved at: \(outputURL)")
              
                FinalTouchViewController().recordedVideoURL = outputURL // Set the recorded video URL
            } catch {
                print("Error moving video to destination: \(error.localizedDescription)")
            }
        }
    }

}

