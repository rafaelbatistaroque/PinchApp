import SwiftUI

struct ControlImageView: View {
    let icon: String

    var body: some View {
        Image(systemName: icon)
            .font(.system(size: 28))
    }
}

struct ControlImageView_Previews: PreviewProvider {
    static var previews: some View {
        ControlImageView(icon: EAssets.icon_minus_magnifyingglass.rawValue)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
            
    }
}
