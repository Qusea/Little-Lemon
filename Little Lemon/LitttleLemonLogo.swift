import SwiftUI

struct LittleLemonLogo: View {
    var body: some View {
        Image("littleLemon")
			.resizable()
			.frame(width: 150, height: 41)
			.aspectRatio(contentMode: .fit)
    }
}
