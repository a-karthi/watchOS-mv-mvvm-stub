//
//  ComplicationController.swift
//  SampleWatchExt
//
//  Created by @karthi on 31/03/23.
//
import SwiftUI
import ClockKit

class ComplicationController: NSObject, CLKComplicationDataSource {

  func getComplicationDescriptors(handler: @escaping ([CLKComplicationDescriptor]) -> Void) {
    let descriptors = [
      CLKComplicationDescriptor(
        identifier: "complication",
        displayName: "CNTV",
        supportedFamilies: CLKComplicationFamily.allCases)
      // Multiple complications per app support can be added here with more descriptors
    ]
    handler(descriptors)
  }

  // MARK: - Timeline Configuration
  func getTimelineEndDate(
    for complication: CLKComplication,
    withHandler handler: @escaping (Date?) -> Void
  ) {
    handler(Date())
  }

  func getPrivacyBehavior(
    for complication: CLKComplication,
    withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void
  ) {
    handler(.showOnLockScreen)
  }

  // MARK: - Timeline Population
  func getCurrentTimelineEntry(
    for complication: CLKComplication,
    withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void
  ) {
    if let ctemplate = makeTemplate(complication: complication) {
      let entry = CLKComplicationTimelineEntry(
        date: Date(),
        complicationTemplate: ctemplate)
      handler(entry)
    } else {
      handler(nil)
    }
  }

  func getTimelineEntries(
    for complication: CLKComplication,
    after date: Date,
    limit: Int,
    withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void
  ) {
    let fiveMinutes = 5.0 * 60.0
    var entries: [CLKComplicationTimelineEntry] = []
    var current = date
    let endDate = Date()

    while (current.compare(endDate) == .orderedAscending) && (entries.count < limit) {
      if let ctemplate = makeTemplate(complication: complication) {
        let entry = CLKComplicationTimelineEntry(
          date: current,
          complicationTemplate: ctemplate)
        entries.append(entry)
      }
      current = current.addingTimeInterval(fiveMinutes)
    }
    handler(entries)
  }

  // MARK: - Sample Templates
  func getLocalizableSampleTemplate(
    for complication: CLKComplication,
    withHandler handler: @escaping (CLKComplicationTemplate?) -> Void
  ) {
    let ctemplate = makeTemplate(complication: complication)
    handler(ctemplate)
  }
}

extension ComplicationController {
  func makeTemplate(complication: CLKComplication
  ) -> CLKComplicationTemplate? {
    switch complication.family {
    case .graphicCircular:
      return CLKComplicationTemplateGraphicCircularView(
        ComplicationView())
    case .graphicCorner:
      return CLKComplicationTemplateGraphicCornerCircularView(
        ComplicationView())
    case .graphicExtraLarge:
      guard #available(watchOSApplicationExtension 7.0, *) else {
        return nil
      }
      return CLKComplicationTemplateGraphicExtraLargeCircularView(
        ComplicationView())
    default:
      return nil
    }
  }
}
