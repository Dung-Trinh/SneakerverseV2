import Foundation
import SwiftUI

protocol CarouselViewModel: ObservableObject {
    var title: String { get }
    var subtitle: String { get }
    var image: Image { get }
}

class CarouselViewModelImpl: CarouselViewModel {
    var title: String
    var subtitle: String
    var image: Image
    
    init(
        title: String,
        subtitle: String,
        image: Image
    ) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
    }
}
