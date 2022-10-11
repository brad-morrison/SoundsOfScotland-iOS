//
//  ContentView.swift
//  m
//
//  Created by Bradley Morrison on 18/05/2020.
//  Copyright © 2020 Bradley Morrison. All rights reserved.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var sheetOpen = false
    @State var imageBox = UIImage()
    
    var body: some View {
        VStack(spacing: 50.0) {
            Image(uiImage: imageBox)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .shadow(radius: 8)
            
            Button(action: {self.sheetOpen.toggle()}) {
            Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
            }
            .sheet(isPresented: $sheetOpen, content: { ImagePicker(isPresented: self.$sheetOpen, selectedImage: self.$imageBox) })
        }
        
    }
}

struct ImagePicker: UIViewControllerRepresentable
{
    @Binding var isPresented: Bool
    @Binding var selectedImage: UIImage
    
    // coordinator constructor
    func makeCoordinator() -> ImagePicker.Coordinator {
        return Coordinator(parent: self)
    }
    
    // Initializing allows interfacing between UIKit and SwiftUI ////
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIViewController {
        let controller = UIImagePickerController()
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: ImagePicker.UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
    //------------------------------------------------------------------
    
    // Coordinator part
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let parent: ImagePicker
        init (parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                print(image)
                self.parent.selectedImage = image
            }
            self.parent.isPresented = false
        }
    }
}

func ReturnDevice()
{
    // create Capture Session
    let session = AVCaptureSession()
    
    // this tells the CaptureSession that we are about to make changes to the inputs and outputs
    session.beginConfiguration()
    
    // INPUTS
    // get the device camera
    let videoDevice = AVCaptureDevice.default(.builtInTripleCamera, for: .video, position: .back)
    // create input object from the device camera
    guard
    let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice!),
    session.canAddInput(videoDeviceInput)
    else { return }
    // add the final input object to the CaptureSession
    session.addInput(videoDeviceInput)
    
    // OUTPUTS
    let photoOutput = AVCapturePhotoOutput()
    guard session.canAddOutput(photoOutput) else { return }
    session.sessionPreset = .photo
    // add the final output object to the CaptureSession
    session.addOutput(photoOutput)
    
    // commit the input/output changes
    session.commitConfiguration()
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
