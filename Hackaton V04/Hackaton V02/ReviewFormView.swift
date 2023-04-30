import SwiftUI

struct ReviewFormView: View {
    
    @Binding var rating: Int
    @Binding var comment: String
    @State var showConfirmationMessage = false
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment:.center) {
                Text("Reseña!")
                    .font(.system(size:45))
                    .fontWeight(.bold)
                    .padding(.top, 50)
                
                HStack(spacing: 20) {
                    ForEach(0..<5) { index in
                        Image(systemName: index < rating ? "star.fill" : "star")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40)
                            .foregroundColor(index < rating ? .cyan : .gray)
                            .onTapGesture {
                                rating = index + 1
                            }
                    }
                }
                .padding(.top, 0)
                
                TextEditor(text: $comment)
                    .frame(minWidth: 0, maxWidth: 300, minHeight: 100, maxHeight: 200)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.top, 30)
                    .padding(.horizontal, 20)
                
                Spacer()
                
                Button(action: {
                    showConfirmationMessage.toggle()
                    self.presentation.wrappedValue.dismiss()
                    rating = 0
                    comment = ""
                }) {
                    Text("Enviar")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 100, height: 40)
                        .background(Color.gray)
                        .cornerRadius(20)
                }
                .padding(.bottom, 250)
                
            }
            Spacer()
        }
        .padding(.horizontal, 40)
        .alert(isPresented: $showConfirmationMessage) {
            Alert(
                title: Text("Reseña enviada"),
                message: Text("Tu reseña ha sido enviada correctamente."),
                dismissButton: .default(Text("Aceptar")) {
                    showConfirmationMessage.toggle()
                }
            )
        }
    }
}

struct ReviewFormView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewFormView(rating: .constant(0), comment: .constant(""))
    }
}
