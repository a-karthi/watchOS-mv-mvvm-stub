//
//  ComplicationView.swift
//  SampleWatchExt
//
//  Created by @karthi on 31/03/23.
//

import SwiftUI
import ClockKit

struct ComplicationView: View {
    var body: some View {
        ZStack {
            Text("❤️")
                .font(.system(size: 50))
        }
        
    }
}

struct ComplicationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CLKComplicationTemplateGraphicCircularView(
                ComplicationView()).previewContext()
        }
    }
}
