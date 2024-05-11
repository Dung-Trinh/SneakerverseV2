import SwiftUI

struct BlogPostTile: View {
    let post: BlogPost
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: post.coverImageUrl)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(15)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                HStack {
                    ForEach(post.category, id: \.self) { category in
                        if let blogPostCategory = BlogPostCategory(category) {
                            ChipView(category: blogPostCategory)
                        }
                    }
                }
                Text(post.title)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .lineLimit(2)
                Text(post.description)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 14))
                    .fontWeight(.light)
                    .lineLimit(2)
            }
            .padding(.horizontal, Styleguide.Margin.small)
            .padding(.bottom, Styleguide.Margin.medium)
        }
        .frame(maxHeight: 350)
        .background(Color.gray.opacity(0.6))
        .clipShape(
            RoundedRectangle(
                cornerRadius: 25.0,
                style: .continuous
            )
        )
    }
}
