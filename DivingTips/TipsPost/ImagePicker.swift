//
//  ImagePicker.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/08/16.
//

import SwiftUI
import AVFoundation

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedUIImage: UIImage?
    @Binding var sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        picker.allowsEditing = true
        picker.mediaTypes = ["public.image", "public.movie"]
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }
    
    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(parent: self)
    }
}

extension ImagePicker {
    class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.imageURL] as? URL {
                print("image:", image)
                parent.selectedUIImage = UIImage(contentsOfFile: image.path)
                parent.presentationMode.wrappedValue.dismiss()
            }
            
            if let movie = info[.mediaURL] as? URL {
                print("movie:", movie)
                parent.selectedUIImage = previewImageFromMovie(url: movie)
                parent.presentationMode.wrappedValue.dismiss()
            }
        }
        
        func previewImageFromMovie(url: URL) -> UIImage? {
            let asset = AVAsset(url: url)
            let imageGenerator = AVAssetImageGenerator(asset: asset)
            imageGenerator.appliesPreferredTrackTransform = true
            var time = asset.duration
            time.value = min(time.value, 2)
            do {
                let imageRef = try imageGenerator.copyCGImage(at: time, actualTime: nil)
                return UIImage(cgImage: imageRef)
            } catch {
                print(error)
                return nil
            }
        }
    }
}

struct ImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        ImagePicker(selectedUIImage: .constant(UIImage(named: "house")), sourceType: .constant(.camera))
    }
}
