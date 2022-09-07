import SwiftUI

struct ContentView: View {
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    
    func resetImageState(){
        return withAnimation(.spring()){
            imageScale = 1
            imageOffset = .zero
        }
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.clear
                
                //MARK: PAGE IMAGE
                Image(EImages.magazine_front_cover.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .scaleEffect(imageScale)
                
                //MARK: TAP GESTURE
                    .onTapGesture(count: 2, perform: {
                        if imageScale == 1 {
                            withAnimation(.spring()){
                                imageScale = 5
                            }
                        } else {
                            resetImageState()
                        }
                    })
                
                //MARK: DRAG GESTURE
                    .gesture(DragGesture()
                        .onChanged { value in
                            withAnimation(.linear(duration: 1)){
                                imageOffset = value.translation
                            }
                        }
                        .onEnded{ _ in
                            if imageScale <= 1 {
                                resetImageState()
                            }
                        })
            }
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                withAnimation(.linear(duration: 1)){
                    isAnimating = true
                }
            })
            
            //MARK: INFO PANEL
            .overlay(
                InfoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal), alignment: .top)
            
            //MARK: - CONTROLS
            .overlay(
                Group{
                    HStack(spacing: 12){
                        Button{
                            withAnimation(.spring()){
                                if imageScale > 1 {
                                    imageScale -= 1
                                    
                                    if imageScale <= 1 {
                                        resetImageState()
                                    }
                                }
                            }
                        } label: {
                            ControlImageView(icon: EImages.minus_magnifyingglass.rawValue)
                        }
                        
                        Button{
                            resetImageState()
                        } label: {
                            ControlImageView(icon: EImages.arrow_up_left_and_arrow_right_magnifyingglass.rawValue)
                        }
                        
                        Button{
                            withAnimation(.spring()){
                                if imageScale < 5 {
                                    imageScale += 1
                                    
                                    if imageScale > 5 {
                                        imageScale = 5
                                    }
                                }
                            }
                        } label: {
                            ControlImageView(icon: EImages.plus_magnifyingglass.rawValue)
                        }
                    }
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                    
                }
                , alignment: .bottom
            )
        }.navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
