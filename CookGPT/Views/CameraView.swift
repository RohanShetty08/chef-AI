//
//  CameraView.swift
//  CookGPT
//
//  Created by israel soto on 7/24/23.
//

import SwiftUI

class LocalFileManager {
    static let instance = LocalFileManager()
    let folderName = "Cookout_Images"
    
    init(){
        createFolderIfNeeded()
    }
    
    func createFolderIfNeeded(){
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path else{
            return
        }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                print("success creating folder.")
                
            } catch let error {
                print("error creating folder. \(error)")
            }
            
        }
    }
    
    func saveImage(imge: UIImage, imageName: String) -> String {
        
        // get path for image
        guard
            let pngData = imge.pngData(),
            let path = getPathForImage(imageName: imageName)
        else { return "Error getting Data."}
        
        do {
            try pngData.write(to: path)
            print(path)
            return "Success saving"
        } catch let error {
            return "Error saving image! \(error)"
        }
    }
    
    func deleteImage(name: String) -> String{
        
        guard
            let path = getPathForImage(imageName: name),
            FileManager.default.fileExists(atPath: path.path) else {
            return "Error getting path."
        }
        
        do {
            try FileManager.default.removeItem(at: path)
            return "successfully deleted"
        } catch let error {
            return"Error deleting image. \(error)"
        }
    }
    
    func getImage(imageName: String) -> UIImage? {
        guard
            let path = getPathForImage(imageName: imageName)?.path,
            FileManager.default.fileExists(atPath: path) else {
            print("Error getting path.")
            return nil
        }
        print("getImage(): \(path)")
        return UIImage(contentsOfFile: path)
    }
    
    private func getPathForImage(imageName: String) -> URL? {
        
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .appendingPathComponent("\(imageName).png") else {
            print("Error getting path.")
            return nil
        }
        return path

    }
}


struct CameraView: View {
    
    @State var imageData : Data = .init(Data(capacity: 0))
    @State var show = false
    @State var imagePicker = false
    
    @State var source : UIImagePickerController.SourceType = .photoLibrary
    @State private var image: Image?
    @State private var inputImage: UIImage?
    
    @StateObject var vm = FileManagerViewModel()
    
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
//                    image?
//                        .resizable()
//                        .scaledToFit()
                    
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
                    HStack{
                        Button(action: {
                            guard let inputImage = UIImage(data: self.imageData) else { return }
                            //let imageSaver = ImageSaver()
                            //imageSaver.writeToPhotoAlbum(image: inputImage)
                            vm.saveImage(uiimg: inputImage)
                        }, label: {
                            Text("Save photo")
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding()
                                .padding(.horizontal)
                                .background(Color.green)
                                .cornerRadius(10)
                        })
                        Button(action: {
                            //guard let inputImage = UIImage(data: self.imageData) else { return }
                            vm.deleteImage()
                        }, label: {
                            Text("Delete photo")
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding()
                                .padding(.horizontal)
                                .background(Color.red)
                                .cornerRadius(10)
                        })
 
                    }
                    
                    Text(vm.infoMessage)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.purple)
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


class FileManagerViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    let imgName: String = "testing"
    let manager = LocalFileManager.instance
    @Published var infoMessage: String = ""
    
    init(){
        //getImageFromAssetsFolder()
        //getImageFromFileManager()
    }
    
    func getImageFromAssetsFolder(){
        image = UIImage(named: imgName)
    }
    
    func getImageFromFileManager(){
        image = manager.getImage(imageName: imgName)
    }
    
    func saveImage(uiimg: UIImage){
        //guard let image = image else { return }
        infoMessage = manager.saveImage(imge: uiimg, imageName: imgName)
    }
    
    func deleteImage(){
        infoMessage = manager.deleteImage(name: imgName)
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
