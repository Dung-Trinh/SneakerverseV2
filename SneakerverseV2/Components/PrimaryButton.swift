import SwiftUI

public struct PrimaryButton: View {
    let title: String
    let color: Color
    let action: () -> Void?
    
    public var body: some View {
        HStack {
            Button {
                action()
            } label: {
                Text(title)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(
                            cornerRadius: 20,
                            style: .continuous
                        )
                        .fill(color)
                    )
            }
        }
    }
}
