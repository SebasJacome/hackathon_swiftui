import SwiftUI
import MapKit


struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State var showAlert = false
    @State var xd = false
    @State var usuarios = network()
    @State var isShowingModal = false
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    .frame(height: 10)
                HStack{
                    ZStack{
                        Circle()
                            .foregroundColor(.black)
                            .frame(width: 50, height: 50)
                        (Image(systemName: "car.side")
                            .frame(width:40,height:40)
                            .foregroundColor(.white).bold())
                    }
                    Text("Park-a-Lot").font(.custom("Bebas Neue", size: 50))
                        .fontWeight(.black)
                        .tracking(8)
                        .foregroundColor(Color.black)
                        .shadow(color: Color.black.opacity(0.5), radius: 2, x:2, y:2)
                    
                    
                }.padding(.top,10)
                LottieView(name: "57463-parking-concept", loopMode: .loop )
                
            
                if showAlert{
                    Text("Cargando...")
                        .foregroundColor(.blue)
                        .padding(.top)
                }
                TextField("Email", text: $email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .autocapitalization(.none)
                Button(action: {
                    validarUsuario(name: email, pwd: password, netwrok: usuarios)
                }) {
                    Text("Log in")
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(10)
                    
                        
                }
                .padding(.horizontal, 14)

                Button(action:{self.isShowingModal = true}){
                    Text("Sign in")
                }
                .sheet(isPresented: $isShowingModal){
                    RegisterView()
                }
                
            }
            .padding()
            
        }.fullScreenCover(isPresented: $xd){
            PrincipalView()
        }.edgesIgnoringSafeArea(.all)
        
    }
    
    func validarUsuario(name: String, pwd: String, netwrok: network) -> Void{
        netwrok.getUsers(correo: name, password: pwd)
        if (netwrok.correo == ""){
            print("no entro")
            self.showAlert = true
            self.xd = false
        }
        else
        {
            print("entro")
            self.xd = true
        }
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
