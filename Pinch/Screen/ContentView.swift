import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack{
                //MARK: PAGE IMAGE
                Image(EImages.magazine_front_cover.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
            }
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
        }.navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
