//
//  SwiftUIView.swift
//  comerzi
//
//  Created by Jonathan Steven Bernal Perilla on 8/10/24.
//

import SwiftUI
import Factory

struct Categories : View {
    @State var showBottomSheet: Bool = false
    @InjectedObject(\.categoriesViewModel) var viewModel
    var body: some View {
            ZStack(alignment: .bottomTrailing){
                NavigationView{
                    List{
                        ForEach(viewModel.categories, id: \.id){ category in
                            HStack{
                                Text(category.name)
                            }.swipeActions(edge: .leading){
                                Button{
                                    viewModel.removeCategory(withId: category.id)
                                } label: {
                                    Label("Eliminar", systemImage: "trash")
                                }
                            }.tint(.red)
                        }
                    }
                    .navigationTitle("Categorias")
                    .navigationBarTitleDisplayMode(.automatic)
                }
                Button {
                    showBottomSheet.toggle()
                } label: {
                    Image(systemName: "plus")
                        .font(.title.weight(.semibold))
                        .padding()
                        .background(.purple)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .shadow(radius: 4, x: 0, y: 4)
                }.padding()
            }
            .sheet(isPresented: $showBottomSheet) {
                NewCategory(currentViewModel:viewModel).presentationDetents([.height(150),.large])
            }
    }
}

struct NewCategory: View {
    @StateObject var currentViewModel: CategoriesViewModel
    @Environment(\.dismiss) var dismiss
    @State var text: String = ""
    var body: some View {
        HStack{
            TextEditor(text: $text)
                .foregroundColor(.gray)
                .frame(height: 50)
                .overlay (
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth:2)
                )
                .padding(.horizontal,12)
                .cornerRadius(3.0)
            Button("Crear"){
                currentViewModel.saveCategory(categoryName: text)
                text = ""
                dismiss()
            }.buttonStyle(.bordered)
                .tint(.purple)
                .disabled(text.isEmpty)
        }.padding()
    }
}



#Preview {
    @InjectedObject(\.categoriesViewModel) var viewModel
    NewCategory(currentViewModel: viewModel)
}
