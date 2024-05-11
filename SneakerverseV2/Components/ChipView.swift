import SwiftUI

struct ChipView: View {
    let category: BlogPostCategory
    
    var body: some View {
        HStack(spacing: Styleguide.Margin.small) {
            Text(category.text)
                .font(.system(size: 12))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(Styleguide.Margin.extraSmall)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.blue).opacity(0.5)
                )
        }
    }
}
