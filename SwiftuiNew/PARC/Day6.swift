import SwiftUI

struct Day6: View{
    
    @State private var isRed: Bool = true
    @State private var name: String = "Developer"
    @State private var isOnline: Bool = true
    
    var body: some View{
        
        ZStack {
            AngularGradient(
                gradient: Gradient(colors: [
                    Color.purple.opacity(0.9),
                    Color.indigo.opacity(0.9),
                    Color.blue.opacity(0.9),
                    Color.cyan.opacity(0.9),
                    Color.mint.opacity(0.9),
                    Color.pink.opacity(0.9)
                ]),
                center: .center
            )
            .ignoresSafeArea()
            
            // ✅ ScrollView with centered content
            ScrollView {
                VStack {
                    
                    VStack {
                        HStack(spacing: 12){
 
                            Text("Online Status")
                                .font(.title)
                                .foregroundStyle(.white)
                                .bold()
                        }
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .background(.white.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .padding(5)
                        
                        
                        VStack{
                            Image(systemName: "person.crop.circle.fill")
                                .font(.system(size: 100))
                                .foregroundStyle(.white)
                            
                            HStack{
                                Text("Name:")
                                Text(name)
                            }
                            .font(.title3)
                            .foregroundStyle(.white)
                            .bold()
                            
                            HStack{
                                Text("Status:")
                                Text(isOnline ? "Online" : "Offline")
                                Image(systemName: "circle.fill")
                                    .foregroundStyle(isOnline ? .green : .red)
                            }
                            .font(.title3)
                            .foregroundStyle(.white)
                            .bold()
                            
                            Button(isOnline ? "Go Offline Button" : "Go Online Button"){
                                withAnimation{
                                    isOnline.toggle()
                                }
                            }
                            .padding(15)
                            .frame(maxWidth: .infinity)
                            .font(.title3)
                            .bold()
                            .background(.white.opacity(0.2))
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .padding()
                            
                        }
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .background(.white.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .padding()
                    }
                    
                    
                }
                // ✅ This is the FIX (centering)
                .frame(
                    maxWidth: .infinity,
                    minHeight: UIScreen.main.bounds.height,
                    alignment: .center
                )
            }
            .ignoresSafeArea()
        }
        
    }
    
}

#Preview {
    Day6()
}
