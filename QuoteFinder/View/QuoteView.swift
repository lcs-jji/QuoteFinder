//
//  QuoteView.swift
//  QuoteFinder
//
//  Created by Xinchen Ji on 2025-04-02.
//

import SwiftUI

struct QuoteView: View {
    
    // MARK: Stored properties
    
    // Create the view model (temporarily show the default joke)
    @State var viewModel = QuoteViewModel()
    
    // Controls button visibility
    @State var buttonOpacity = 0.0
    
    // Starts a timer to wait on revealing button to get new joke
    @State var buttonTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            if let currentQuote = viewModel.currentQuote {
                
                    Text(currentQuote.quoteText ?? "")
                        .padding(.bottom, 100)
                        .font(.title)
                
                Button {
                    
                    withAnimation {
                        viewModel.currentQuote = nil
                        buttonOpacity = 0.0
                    }
                    
                    Task {
                        await viewModel.fetchQuote()
                    }
                    
                    buttonTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
                    
                } label: {
                 
                    Text("New Quote")
                    
                }
                .buttonStyle(.borderedProminent)
                .opacity(buttonOpacity)
                .onReceive(buttonTimer) { _ in
                    
                    withAnimation {
                        buttonOpacity = 1.0
                    }
                    
                    buttonTimer.upstream.connect().cancel()
                }
            }
        }
    }
}
 
#Preview {
    QuoteView()
}
