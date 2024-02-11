# CameraApp - Swift & SwiftUI

## Overview

This camera app is a work-in-progress project developed for CS 390: Software Engineering at Coe College. It showcases the use of Swift, SwiftUI, and AVFoundation to implement camera functionalities with a focus on asynchronous programming and the MVVM architecture. The project aims to demonstrate a modern iOS app development approach, with future updates planned to complete its feature set.

## Features

- **Live Camera Preview**: Utilizes AVFoundation for a real-time camera feed.
- **Photo Capture**: Captures photos from the live feed, demonstrating asynchronous operations.
- **MVVM Architecture**: Implements MVVM for a structured and scalable codebase.

## Skills Demonstrated

- **AVFoundation Integration**: Explores managing camera sessions, inputs, and outputs.
- **Asynchronous Swift**: Uses `async/await` for handling concurrent operations efficiently.
- **SwiftUI and MVVM**: Employs SwiftUI for UI development and MVVM for code organization.

## Current Limitations and Future Work

- **Camera Permissions**: The app currently does not request camera permissions, which is essential for accessing the camera. This functionality will be added in future updates.
- **Testing**: Comprehensive testing has not yet been conducted. Future plans include unit and UI tests to ensure reliability and performance.

## Components

- `CameraView.swift`: The view for displaying the camera's live feed.
- `ContentView.swift`: Integrates the camera view and manages user interactions.
- `PhotoModel.swift`: Manages the data model for captured photos.
- `Camera.swift`: Handles camera setup and photo capture logic.
