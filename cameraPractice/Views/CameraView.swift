//
//  CameraView.swift
//  cameraPractice
//
//  Created by Adolfo Calderon on 1/30/24.
//

import SwiftUI
import AVFoundation


/// This structure bridges the SwiftUI and UIKit worlds by conforming to UIViewControllerRepresentable
/// It allows the use of a custom UIViewController (CameraViewController) within SwiftUI,
/// providing a camera interface using the AVFoundation Framework
struct CameraView: UIViewControllerRepresentable {
    
    @ObservedObject var camera: Camera
    
    /// Creates and returns a "CameraViewController"
    /// This method is invoked by SwiftUI when it needs to create an instance of the UIViewController
    /// It initializes a CameraViewController and assigns the viewModel (Camera)  to it for camera operations
    ///  - Parameter Context: A context structure containing information about the current state of the system
    func makeUIViewController(context: Context) -> CameraViewController {
        let controller = CameraViewController()
        controller.camera = camera
        return controller
    }
    
    /// Updates the provided "CameraViewController" when SwiftUI's state changes
    ///
    func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {
        /// This space can be utilized to update the CameraViewController when the SwiftUI view's state chagnes
        /// Ex. Camera "Snapshot" Animation, refreshing the UI, etc.

    }
}

/// UIViewController subclass that manages camera feed display
/// The "UIKit View"
class CameraViewController: UIViewController {
    
    ///Implicitly unwrapped optional because the viewModel's expected to be set immediately after UIKit View Initialization
    var camera: Camera!
    
    /// View "Layer" responsible for displaying video captured by the camera
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    
    /// Called after the UIKit View is loaded into memory
    /// Sets up camera session, sets up video preview — the "camera feed", starts the camera session
    override func viewDidLoad() {
        super.viewDidLoad()
        camera.setupCameraSession()
        setupVideoPreviewLayer()
        camera.startSession()
        
    }
    
    /// This function is responsible for establishing the video preview layer, the "camera feed"
    /// It creates the layer, sets its properties for video display, and adds it to the view hierarchy
    ///
    /// Steps:
    /// 1. Check if the "captureSession" is available from the viewModel
    /// 2. Initializes the "AVCapturePreviewLayer" with the session.
    /// 3. Sets "video gravity" to "resizeAspectFill" which scales the content to fill its "aspect ratio"
    /// 4. Matches the layer's frame to the view's bounds to fill the entire screen
    /// 5. Adds the configured layer to the view's layer hierarchy
    func setupVideoPreviewLayer() {
        guard let session = camera.captureSession else { return }
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: session)
        videoPreviewLayer?.videoGravity = .resizeAspectFill
        videoPreviewLayer?.frame = view.bounds
        view.layer.addSublayer(videoPreviewLayer!)
    }
}

#Preview {
    VStack {
        Image(systemName: "globe")
            .foregroundStyle(.blue)
    }
//    CameraView(viewModel: viewModel)
}
