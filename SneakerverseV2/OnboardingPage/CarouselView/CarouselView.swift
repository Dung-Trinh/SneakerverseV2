import SwiftUI

struct CarouselView: View {
    var content: OnboardingContent
    
    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: URL(string: content.imageUrl ?? "")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .scaledToFit()
            .frame(maxHeight: 300)
            .cornerRadius(20)

            PageHeader(
                title: content.title,
                subtitle: content.subtitle,
                textAlignment: .center
            ).padding(.bottom, Styleguide.Margin.extraLarge)
        }
    }
}
