//
//  ImagePickerView.swift
//  UIViewControllerRepresentableProject
//
//  Created by Esteban Calvete Iglesias on 23/5/22.
//

import Foundation
import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.dismiss) private var dismiss
    
    func makeUIViewController(context: Self.Context) -> UIImagePickerController {
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.delegate = context.coordinator
        return imagePickerVC
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        return
    }
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
}

extension ImagePickerView {
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePickerView
        init(parent: ImagePickerView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else { return }
            parent.selectedImage = image
            parent.dismiss()
        }
    }
}
