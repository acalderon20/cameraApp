//
//  PhotoModel.swift
//  cameraPractice
//
//  Created by Adolfo Calderon on 1/31/24.
//

import Foundation
import UIKit

/// Model - The data structure of the MVVM architecture
/// In this context we really only work with UIImages aka "Photos"

/// Represents a photo captured by the camera
struct Photo {
    
    // The image captured by the camera
    let image: UIImage
}
