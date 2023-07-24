//
//  CameraView.swift
//  CookGPT
//
//  Created by israel soto on 7/24/23.
//

import SwiftUI

struct CameraView: View {
    
    @State var imageData : Data = .init(Data(capacity: 0))
    @State var show = false
    @State var imagePicker = false
    @State var source : UIImagePickerController.SourceType = .photoLibrary
    
    
    var body: some View {
        
        NavigationView {
            ZStack{
                NavigationLink(destination: ImagePicker(show: $imagePicker, image: $imageData, source: source), isActive: $imagePicker) {
                    Text("")
                }
                VStack{
                    if imageData.count != 0 {
                        Image(uiImage:UIImage(data: self.imageData)!)
                            .resizable()
                            .clipShape(Rectangle())
                            .frame(width: 300, height: 300)
                            .overlay(Rectangle().stroke(Color.black, lineWidth:5))
                            .foregroundColor(Color.black)
                    } else {
                        Image(systemName: "person.fill")
                            .resizable()
                            .clipShape(Rectangle())
                            .frame(width: 300, height: 300)
                            .overlay(Rectangle().stroke(Color.black, lineWidth:5))
                            .foregroundColor(Color.black)
                    }
                    Button(action: {
                        self.show.toggle()
                        
                    }){
                        Text("Snap a photo!")
                            .foregroundColor(Color.white)
                            .bold()
                            .frame(width: 200, height: 100, alignment: .center)
                            .background(Color.pink)
                            .cornerRadius(50)
                    }
                }.actionSheet(isPresented: $show){
                    ActionSheet(title: Text("Take a photo or select from photo library"), message: Text(""), buttons:
                                    [.default(Text("Photo Library "), action: {
                                        self.source = .photoLibrary
                                        self.imagePicker.toggle()
                                    }), .default(Text("Camera"), action: {
                                        self.source = .camera
                                        self.imagePicker.toggle()
                                    })]
                    )
                }
            }
        }
    }
    
    
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}

struct ImagePicker : UIViewControllerRepresentable {
    
    @Binding var show : Bool
    @Binding var image : Data
    var source : UIImagePickerController.SourceType
    
    
    func makeCoordinator() -> ImagePicker.Coordinator {
        return ImagePicker.Coordinator(parent1: self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let controller = UIImagePickerController()
        controller.sourceType = source
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var parent: ImagePicker
        init(parent1: ImagePicker) {
            self.parent = parent1
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.parent.show.toggle()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            let image = info[.originalImage] as! UIImage
            let data = image.pngData()
            self.parent.image = data!
            self.parent.show.toggle()
        }
    }
}
