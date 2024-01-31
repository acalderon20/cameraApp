//
//  Camera.swift
//  cameraPractice
//
//  Created by Adolfo Calderon on 1/27/24.
//

import Foundation
import AVFoundation
import UIKit

// ViewModel - Handles User Intent Functions, Data Processing, init AVCaptureSessions

/// CameraViewModel manages the camera functionalities in the app.
class Camera: NSObject {
    // MARK: - Properties

    /// The capture session for managing real-time capture activity.
    var captureSession: AVCaptureSession?

    /// The output for still photo capture.
    var cameraOutput: AVCapturePhotoOutput?

    /// A completion handler for returning the captured image.
    private var photoCaptureCompletion: ((UIImage?) -> Void)?

    
    // MARK: - Camera Setup

    /// Sets up the camera session with necessary inputs and outputs.
    func setupCameraSession() {
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = .high // Use high preset for high-quality photo capture.

        guard let backCamera = AVCaptureDevice.default(for: .video),
              let input = try? AVCaptureDeviceInput(device: backCamera) else {
            print("Unable to access back camera")
            return
        }
        
        // Add the input and output to the capture session.
        if captureSession?.canAddInput(input) == true {
            captureSession?.addInput(input)
        }

        cameraOutput = AVCapturePhotoOutput()
        if let output = cameraOutput, captureSession?.canAddOutput(output) == true {
            captureSession?.addOutput(output)
        }
    }

    // MARK: - Session Control

    /// Starts the camera session.
    func startSession() {
        captureSession?.startRunning()
    }

    /// Stops the camera session.
    func stopSession() {
        captureSession?.stopRunning()
    }

    // MARK: - Photo Capture

    /// Captures a photo.
    /// - Parameter completion: A closure that gets called with the captured image.
    func capturePhoto(completion: @escaping (UIImage?) -> Void) {
        let settings = AVCapturePhotoSettings()
        cameraOutput?.capturePhoto(with: settings, delegate: self)
        self.photoCaptureCompletion = completion
    }
}

// MARK: - AVCapturePhotoCaptureDelegate

extension Camera: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation(),
              let image = UIImage(data: imageData) else {
            photoCaptureCompletion?(nil)
            return
        }
        photoCaptureCompletion?(image)
    }
}

