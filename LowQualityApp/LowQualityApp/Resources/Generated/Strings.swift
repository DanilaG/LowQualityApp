// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Localization {
  internal enum Accessibility {
    /// Accessibility
    internal static let title = Localization.tr("Localizable", "accessibility.title", fallback: "Accessibility")
  }
  internal enum AppropriatenessRecognizability {
    /// Appropriateness recognizability
    internal static let title = Localization.tr("Localizable", "appropriatenessRecognizability.title", fallback: "Appropriateness recognizability")
  }
  internal enum Availability {
    /// Availability
    internal static let title = Localization.tr("Localizable", "availability.title", fallback: "Availability")
  }
  internal enum Capacity {
    /// Capacity
    internal static let title = Localization.tr("Localizable", "capacity.title", fallback: "Capacity")
  }
  internal enum CoExistence {
    /// Co-existence
    internal static let title = Localization.tr("Localizable", "coExistence.title", fallback: "Co-existence")
  }
  internal enum FaultTolerance {
    /// Fault tolerance
    internal static let title = Localization.tr("Localizable", "faultTolerance.title", fallback: "Fault tolerance")
  }
  internal enum FunctionalAppropriateness {
    /// Functional appropriateness
    internal static let title = Localization.tr("Localizable", "functionalAppropriateness.title", fallback: "Functional appropriateness")
  }
  internal enum FunctionalCompleteness {
    /// Functional completeness
    internal static let title = Localization.tr("Localizable", "functionalCompleteness.title", fallback: "Functional completeness")
  }
  internal enum FunctionalCorrectness {
    /// Functional correctness
    internal static let title = Localization.tr("Localizable", "functionalCorrectness.title", fallback: "Functional correctness")
  }
  internal enum Interoperability {
    /// Interoperability
    internal static let title = Localization.tr("Localizable", "interoperability.title", fallback: "Interoperability")
  }
  internal enum Learnability {
    /// Learnability
    internal static let title = Localization.tr("Localizable", "learnability.title", fallback: "Learnability")
  }
  internal enum List {
    /// Localizable.strings
    ///   LowQualityApp
    /// 
    ///   Created by Danila on 13.08.2023.
    internal static let title = Localization.tr("Localizable", "list.title", fallback: "Violations")
    internal enum Section {
      /// Compatibility
      internal static let compatibility = Localization.tr("Localizable", "list.section.compatibility", fallback: "Compatibility")
      /// Functional suitability
      internal static let functionalSuitability = Localization.tr("Localizable", "list.section.functionalSuitability", fallback: "Functional suitability")
      /// Performance efficiency
      internal static let performanceEfficiency = Localization.tr("Localizable", "list.section.performanceEfficiency", fallback: "Performance efficiency")
      /// Reliability
      internal static let reliability = Localization.tr("Localizable", "list.section.reliability", fallback: "Reliability")
      /// Usability
      internal static let usability = Localization.tr("Localizable", "list.section.usability", fallback: "Usability")
    }
  }
  internal enum Maturity {
    /// Maturity
    internal static let title = Localization.tr("Localizable", "maturity.title", fallback: "Maturity")
  }
  internal enum Operability {
    /// Operability
    internal static let title = Localization.tr("Localizable", "operability.title", fallback: "Operability")
  }
  internal enum Recoverability {
    /// Recoverability
    internal static let title = Localization.tr("Localizable", "recoverability.title", fallback: "Recoverability")
  }
  internal enum ResourceUtilization {
    /// Resource utilization
    internal static let title = Localization.tr("Localizable", "resourceUtilization.title", fallback: "Resource utilization")
  }
  internal enum TimeBehaviour {
    /// Time behaviour
    internal static let title = Localization.tr("Localizable", "timeBehaviour.title", fallback: "Time behaviour")
  }
  internal enum UserErrorProtection {
    /// User error protection
    internal static let title = Localization.tr("Localizable", "userErrorProtection.title", fallback: "User error protection")
  }
  internal enum UserInterfaceAesthetics {
    /// User interface aesthetics
    internal static let title = Localization.tr("Localizable", "userInterfaceAesthetics.title", fallback: "User interface aesthetics")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Localization {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
