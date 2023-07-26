
import PhotosUI
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var show: Bool
    @Binding var img: Data
    var source : UIImagePickerController.SourceType
    var image: UIImage?
    
    func makeCoordinator() -> ImagePicker.Coordinator {
        return ImagePicker.Coordinator(self)
    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
        
        var parent: ImagePicker
        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        // =====
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.parent.show.toggle()
        }
        
        // =====
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

            let img = info[.originalImage] as! UIImage
            let data = img.pngData()
            self.parent.img = data!
            self.parent.show.toggle()
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
           picker.dismiss(animated: true)

           guard let provider = results.first?.itemProvider else { return }

           if provider.canLoadObject(ofClass: UIImage.self) {
               provider.loadObject(ofClass: UIImage.self) { image, _ in
                   self.parent.image = image as? UIImage
               }
           }
       }

    }

    // =====
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let controller = UIImagePickerController()
        controller.sourceType = source
        controller.delegate = context.coordinator
        return controller
    }
    

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }

}
