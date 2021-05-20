//
//  TestView.swift
//  
//
//  Created by Ky B Hamilton on 5/20/21.
//

import SwiftUI

struct TestView: View {
  @State private var now = Date()

  var body: some View {
     RefreshableScrollView(onRefresh: { done in
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
          self.now = Date()
          done()
        }
      }) {
        VStack {
          ForEach(1..<20) {
            Text("\(Calendar.current.date(byAdding: .hour, value: $0, to: now)!)")
               .padding(.bottom, 10)
           }
         }.padding()
       }
    }
}


struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
