import SwiftUI

struct InfoPanelView: View {
    var scale: CGFloat
    var offset: CGSize
    
    @State private var isInfoPanelVisible: Bool = false
    
    func formaterDecimal(dec decimaPoint: Int, scale: CGFloat) -> String {
        String(format: "%.\(decimaPoint)f", scale)
    }
    
    var body: some View {
        HStack{
            //MARK: HOTSPOT
            Image(systemName: EImages.circle_circle.rawValue)
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30)
                .onLongPressGesture(minimumDuration: 1){
                    withAnimation(.easeOut){
                        isInfoPanelVisible.toggle()
                    }
                }
            
            Spacer()
            //MARK: INFO PANEL
            HStack(spacing: 2){
                Image(systemName: EImages.arrow_up_left_and_arrow_down_right.rawValue)
                Text(formaterDecimal(dec: 1, scale: scale))
                
                Spacer()
  
                Image(systemName: EImages.arrow_left_and_right.rawValue)
                Text(formaterDecimal(dec: 2, scale: offset.width))

                Spacer()
                
                Image(systemName: EImages.arrow_up_and_down.rawValue)
                Text(formaterDecimal(dec: 2, scale: offset.height))
            }
            .font(.footnote)
            .padding(.horizontal, 10)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(8)
            .frame(maxWidth: 420)
            .opacity(isInfoPanelVisible ? 1 : 0)
            
            Spacer()
        }
    }
}

struct InfoPanelView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPanelView(scale: 1, offset: .zero)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
            .padding()
    }
}
