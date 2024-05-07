import SwiftUI

struct CarouselView<ViewModel>: View where ViewModel: CarouselViewModel {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            viewModel.image
                .resizable()
                .scaledToFit()
            PageHeader(
                title: viewModel.title,
                subtitle: viewModel.subtitle,
                textAlignment: .center
            )
            .padding(.bottom, Styleguide.Margin.extraLarge)
        }
    }
}
