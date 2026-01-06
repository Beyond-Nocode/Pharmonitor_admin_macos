import SwiftUI

struct JobsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Jobs Dashboard")
                .font(.title2)
                .bold()
            Text("Use this window to monitor queued and running jobs.")
                .foregroundStyle(.secondary)
            Spacer()
        }
        .padding(24)
    }
}
