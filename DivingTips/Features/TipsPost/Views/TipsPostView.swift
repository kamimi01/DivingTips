//
//  TipsPost.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/08/15.
//

import SwiftUI

struct TipsPostView: View {
    @State private var tipDetail = ""
    @State private var isShownImagePicker = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedCategory = "未選択"
    @State private var isShownCateogryPopover = false
    @Environment(\.presentationMode) var presentationMode
    
    @State private var selectedUIImage: UIImage?
    
    private let categories: [String] = ["機材", "潜航", "ナビゲーション", "上昇", "フィンワーク"]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                textEditor
                if let uiImage = selectedUIImage {
                    photoView(selectedUIImage: uiImage)
                }
                categorySelectView
                .frame(height: 50)
                .padding(.bottom, 10)
                .navigationBarTitleDisplayMode(.inline)
                .popover(isPresented: $isShownCateogryPopover) {
                    categoryPicker(selectedCategory: selectedCategory)
                }
                Spacer()
            }
            .padding(.horizontal, 16)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    cancelButton
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    postButton
                }
                ToolbarItem(placement: .keyboard) {
                    HStack {
                        photoButton
                        Spacer()
                    }
                }
            }
            .sheet(isPresented: $isShownImagePicker) {
                ImagePicker(selectedUIImage: $selectedUIImage, sourceType: $sourceType)
            }
        }
    }
}

private extension TipsPostView {
    var textEditor: some View {
        TextEditor(text: $tipDetail)
            .frame(maxWidth: .infinity)
            .padding(.top, 10)
    }
    
    func photoView(selectedUIImage: UIImage) -> some View {
        GeometryReader { proxy in
            ZStack {
                Image(uiImage: selectedUIImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130, height: 130)
                deletePhotoButton(photoGeometryProxy: proxy)
            }
        }
    }
    
    func deletePhotoButton(photoGeometryProxy: GeometryProxy) -> some View {
        Button(action: {
            self.selectedUIImage = nil
        }) {
            Image(systemName: "multiply")
                .foregroundColor(.white)
        }
        .frame(width: 20, height: 20)
        .background(Color.black)
        .cornerRadius(30.0)
        .offset(x: 65, y: -50)
//        .offset(
//            x: deletePhotoButtonPositionX(proxy: photoGeometryProxy),
//            y: deletePhotoButtonPositionY(proxy: photoGeometryProxy)
//        )
    }
    
    func deletePhotoButtonPositionX(proxy: GeometryProxy) -> CGFloat {
        let positionX = proxy.frame(in: .local).origin.x
        let width = proxy.size.width
        let halfWidthOfDeletePhotoButton = 10.0
        print("xポジ:", positionX + width - halfWidthOfDeletePhotoButton)
        return positionX + width - halfWidthOfDeletePhotoButton
    }
    
    func deletePhotoButtonPositionY(proxy: GeometryProxy) -> CGFloat {
        let positionY = proxy.frame(in: .local).origin.y
        print("yポジ：", positionY)
        return positionY
    }
    
    var cancelButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Text("キャンセル")
                .foregroundColor(.black)
        }
    }
    
    var postButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Text("投稿")
                .foregroundColor(tipDetail.count == 0 ? .gray : .black)
        }
        .disabled(tipDetail.count == 0 ? true : false)
    }
    
    var photoButton: some View {
        Button(action: {
            isShownImagePicker = true
        }) {
            Image(systemName: "photo")
                .foregroundColor(.black)
        }
    }
    
    var categorySelectView: some View {
        HStack {
            Text("カテゴリー")
            Spacer()
            Button(action: {
                isShownCateogryPopover = true
            }) {
                HStack {
                    Text(selectedCategory)
                    Image(systemName: "chevron.up")
                }
                .foregroundColor(.black)
            }
        }
    }
    
    func categoryPicker(selectedCategory: String) -> some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading) {
                ForEach(categories, id: \.self) { category in
                    Button(action: {
                        self.selectedCategory = category
                        isShownCateogryPopover = false
                    }) {
                        HStack {
                            Text(category)
                            if selectedCategory == category {
                                Image(systemName: "checkmark")
                            }
                            Spacer()
                        }
                        .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity)
                    Divider()
                }
            }
            .padding()
        }
    }
}

struct TipsPostView_Previews: PreviewProvider {
    static var previews: some View {
        TipsPostView()
    }
}
