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
    @State private var image: Image?
    @State private var inputImage: UIImage?

    var body: some View {
        NavigationView {
            ZStack {
            
                NavigationLink(destination: ImagePicker(show: $imagePicker, img: $imageData, source: source), isActive: $imagePicker) {
                }
                VStack {
                    if imageData.count != 0 {
                        Image(uiImage:UIImage(data: self.imageData)!)
                            .resizable()
                            .scaledToFit()
                    }else {
                        Image(systemName: "person.fill")
                            .resizable()
                            .clipShape(Rectangle())
                            .frame(width: 300, height: 300)
                            .overlay(Rectangle().stroke(Color.black, lineWidth:5))
                            .foregroundColor(Color.black)
                    }
                    
                    image?
                        .resizable()
                        .scaledToFit()
                    
                    Button(action: {
                        self.show.toggle()
                    }){
                        Text("Snap photo!")
                            .foregroundColor(Color.white)
                            .bold()
                            .frame(width: 100, height: 25, alignment: .center)
                            .background(Color.pink)
                            .cornerRadius(50)
                    }
                    Button("Save Image") {
                        guard let inputImage = UIImage(data: self.imageData) else { return }
                        let imageSaver = ImageSaver()
                        imageSaver.writeToPhotoAlbum(image: inputImage)
                    }
                    
                }
                .actionSheet(isPresented: $show){
                    ActionSheet(title: Text("Take a photo or select from photo library"), message: Text(""), buttons:
                                    [.default(Text("Photo Library"), action: {
                        self.source = .photoLibrary
                        self.imagePicker.toggle()
                    }), .default(Text("Camera"), action: {
                        self.source = .camera
                        self.imagePicker.toggle()
                    })]
                    )
                }
                .onChange(of: image) { _ in loadImage() }
            }
        }
    }
    
    func loadImage(){
        guard let inputImage = UIImage(data: self.imageData) else { return }
        image = Image(uiImage: inputImage)
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
