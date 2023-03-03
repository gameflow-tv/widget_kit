//
//  ExampleWidget.swift
//  ExampleWidget
//
//  Created by Arne Molland on 01/03/2023.
//

import Intents
import SwiftUI
import WidgetKit

struct Provider: IntentTimelineProvider {
  func placeholder(in context: Context) -> SimpleEntry {
    SimpleEntry(date: Date(), configuration: ConfigurationIntent(), exampleData: nil)
  }

  func getSnapshot(
    for configuration: ConfigurationIntent, in context: Context,
    completion: @escaping (SimpleEntry) -> Void
  ) {
    let entry = SimpleEntry(date: Date(), configuration: configuration, exampleData: nil)
    completion(entry)
  }

  func getTimeline(
    for configuration: ConfigurationIntent, in context: Context,
    completion: @escaping (Timeline<Entry>) -> Void
  ) {
    var entries: [SimpleEntry] = []

    let sharedDefaults = UserDefaults.init(suiteName: "group.tv.gameflow")
    var exampleData: ExampleData? = nil

    if sharedDefaults != nil {
      do {
        let shared = sharedDefaults?.string(forKey: "ExampleData")
        if shared != nil {
          let decoder = JSONDecoder()
          exampleData = try decoder.decode(ExampleData.self, from: shared!.data(using: .utf8)!)
        }
      } catch {
        print(error)
      }
    }

    // Generate a timeline consisting of five entries an hour apart, starting from the current date.
    let currentDate = Date()
    let entryDate = Calendar.current.date(byAdding: .hour, value: 24, to: currentDate)!
    let entry = SimpleEntry(date: entryDate, configuration: configuration, exampleData: exampleData)
    entries.append(entry)

    let timeline = Timeline(entries: entries, policy: .atEnd)
    completion(timeline)
  }
}

struct ExampleData: Decodable, Hashable {
  let text: String
}

struct SimpleEntry: TimelineEntry {
  let date: Date
  let configuration: ConfigurationIntent
  let exampleData: ExampleData?
}

struct ExampleWidgetEntryView: View {
  var entry: Provider.Entry

  private var ExampleDataView: some View {
    Text(entry.exampleData!.text)
  }

  private var NoDataView: some View {
    Text("No data found in UserDefaults. Try entering the app.")
  }

  var body: some View {
    if entry.exampleData == nil {
      NoDataView
    } else {
      ExampleDataView
    }
  }
}

struct ExampleWidget: Widget {
  let kind: String = "ExampleWidget"

  var body: some WidgetConfiguration {
    IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) {
      entry in
      ExampleWidgetEntryView(entry: entry)
    }
    .configurationDisplayName("My Widget")
    .description("This is an example widget.")
  }
}

struct ExampleWidget_Previews: PreviewProvider {
  static var previews: some View {
    ExampleWidgetEntryView(
      entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), exampleData: nil)
    )
    .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}
