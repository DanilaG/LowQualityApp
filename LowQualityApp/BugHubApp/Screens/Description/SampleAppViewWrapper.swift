//
//  SampleAppViewWrapper.swift
//  BugHub
//
//  Created by Danila on 03.09.2023.
//

import SwiftUI

/// Обёртка над view демонстрационных приложений
struct SampleAppViewWrapper<Content: View>: View  {
    @Environment(\.dismiss) var dismiss
    
    let content: @MainActor () -> Content
        
    var body: some View {
        NavigationStack {
            content()
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(
                            action: { dismiss() },
                            label: { Image(systemName: "xmark.circle") }
                        )
                    }
                }
        }
    }
}

struct SampleAppViewWrapper_Previews: PreviewProvider {
    static var previews: some View {
        SampleAppViewWrapper {
            Text("123")
        }
    }
}
