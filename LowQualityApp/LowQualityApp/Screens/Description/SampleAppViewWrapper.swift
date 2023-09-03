//
//  SampleAppViewWrapper.swift
//  LowQualityApp
//
//  Created by Danila on 03.09.2023.
//

import SwiftUI

/// Обёртка над view демонстрационных приложений
struct SampleAppViewWrapper<Content: View>: View  {
    @Environment(\.dismiss) var dismiss
    
    let content: () -> Content
        
    var body: some View {
        NavigationStack {
            content()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(
                        action: { dismiss() },
                        label: { Image(systemName: "xmark.app") }
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
