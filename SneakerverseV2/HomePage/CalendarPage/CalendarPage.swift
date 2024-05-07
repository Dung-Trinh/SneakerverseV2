import SwiftUI

struct CalendarPage<ViewModel>: View where ViewModel: CalendarPageViewModel {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        Text("CalendarPage")
    }
}
