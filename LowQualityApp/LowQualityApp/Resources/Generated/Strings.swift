// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Localization {
  internal enum Accessibility {
    /// degree to which a product or system can be used by people with the widest range of characteristics and capabilities to achieve a specified goal in a specified context of use
    internal static let description = Localization.tr("Localizable", "accessibility.description", fallback: "degree to which a product or system can be used by people with the widest range of characteristics and capabilities to achieve a specified goal in a specified context of use")
    /// Find out the date of the first deposit
    internal static let task = Localization.tr("Localizable", "accessibility.task", fallback: "Find out the date of the first deposit")
    /// Accessibility
    internal static let title = Localization.tr("Localizable", "accessibility.title", fallback: "Accessibility")
    internal enum Task {
      /// In this version of the application, part of the history texts are poorly visible
      internal static let hint = Localization.tr("Localizable", "accessibility.task.hint", fallback: "In this version of the application, part of the history texts are poorly visible")
    }
  }
  internal enum AppropriatenessRecognizability {
    /// degree to which users can recognize whether a product or system is appropriate for their needs
    internal static let description = Localization.tr("Localizable", "appropriatenessRecognizability.description", fallback: "degree to which users can recognize whether a product or system is appropriate for their needs")
    /// Assume from the name "MoneyBox" what functionality the application has. Then, try the application
    internal static let task = Localization.tr("Localizable", "appropriatenessRecognizability.task", fallback: "Assume from the name \"MoneyBox\" what functionality the application has. Then, try the application")
    /// Appropriateness recognizability
    internal static let title = Localization.tr("Localizable", "appropriatenessRecognizability.title", fallback: "Appropriateness recognizability")
    internal enum Task {
      /// This application simplifies the dialing of the phone of the special services despite its name
      internal static let hint = Localization.tr("Localizable", "appropriatenessRecognizability.task.hint", fallback: "This application simplifies the dialing of the phone of the special services despite its name")
    }
  }
  internal enum Availability {
    /// degree to which a system, product or component is operational and accessible when required for use
    internal static let description = Localization.tr("Localizable", "availability.description", fallback: "degree to which a system, product or component is operational and accessible when required for use")
    /// Top up or withdraw money
    internal static let task = Localization.tr("Localizable", "availability.task", fallback: "Top up or withdraw money")
    /// Availability
    internal static let title = Localization.tr("Localizable", "availability.title", fallback: "Availability")
    internal enum Task {
      /// Top up/withdrawal is not available in this version of the application
      internal static let hint = Localization.tr("Localizable", "availability.task.hint", fallback: "Top up/withdrawal is not available in this version of the application")
    }
  }
  internal enum Capacity {
    /// degree to which the maximum limits of a product or system parameter meet requirements
    internal static let description = Localization.tr("Localizable", "capacity.description", fallback: "degree to which the maximum limits of a product or system parameter meet requirements")
    /// Find out the date of the first deposit
    internal static let task = Localization.tr("Localizable", "capacity.task", fallback: "Find out the date of the first deposit")
    /// Capacity
    internal static let title = Localization.tr("Localizable", "capacity.title", fallback: "Capacity")
    internal enum Task {
      /// In this version of the application, there are twitches when scrolling the history due to the large number of entries
      internal static let hint = Localization.tr("Localizable", "capacity.task.hint", fallback: "In this version of the application, there are twitches when scrolling the history due to the large number of entries")
    }
  }
  internal enum CoExistence {
    /// degree to which a product can perform its required functions efficiently while sharing a common environment and resources with other products, without detrimental impact on any other product
    internal static let description = Localization.tr("Localizable", "coExistence.description", fallback: "degree to which a product can perform its required functions efficiently while sharing a common environment and resources with other products, without detrimental impact on any other product")
    /// Top up or withdraw money
    internal static let task = Localization.tr("Localizable", "coExistence.task", fallback: "Top up or withdraw money")
    /// Co-existence
    internal static let title = Localization.tr("Localizable", "coExistence.title", fallback: "Co-existence")
    internal enum Task {
      /// In this version of the application, when entering the amount, there is an overlap of keyboard with a button
      internal static let hint = Localization.tr("Localizable", "coExistence.task.hint", fallback: "In this version of the application, when entering the amount, there is an overlap of keyboard with a button")
    }
  }
  internal enum Description {
    /// Application
    internal static let application = Localization.tr("Localizable", "description.application", fallback: "Application")
    /// Description
    internal static let description = Localization.tr("Localizable", "description.description", fallback: "Description")
    /// Example
    internal static let example = Localization.tr("Localizable", "description.example", fallback: "Example")
    /// Task
    internal static let task = Localization.tr("Localizable", "description.task", fallback: "Task")
    /// Try
    internal static let `try` = Localization.tr("Localizable", "description.try", fallback: "Try")
    /// What's wrong?
    internal static let whatIsWrong = Localization.tr("Localizable", "description.whatIsWrong", fallback: "What's wrong?")
    internal enum Task {
      /// Follow the steps in order to notice the defect
      internal static let hint = Localization.tr("Localizable", "description.task.hint", fallback: "Follow the steps in order to notice the defect")
    }
  }
  internal enum FaultTolerance {
    /// Fault tolerance
    internal static let title = Localization.tr("Localizable", "faultTolerance.title", fallback: "Fault tolerance")
  }
  internal enum FunctionalAppropriateness {
    /// degree to which the functions facilitate the accomplishment of specified tasks and objectives
    internal static let description = Localization.tr("Localizable", "functionalAppropriateness.description", fallback: "degree to which the functions facilitate the accomplishment of specified tasks and objectives")
    /// Check the history of operations with the total amount of savings
    internal static let task = Localization.tr("Localizable", "functionalAppropriateness.task", fallback: "Check the history of operations with the total amount of savings")
    /// Appropriateness
    internal static let title = Localization.tr("Localizable", "functionalAppropriateness.title", fallback: "Appropriateness")
    internal enum Task {
      /// In this version of the application, the total amount of savings is calculated in yuan. While this feature may be highly valuable to a limited number of users, it may have little relevance to the majority of users
      internal static let hint = Localization.tr("Localizable", "functionalAppropriateness.task.hint", fallback: "In this version of the application, the total amount of savings is calculated in yuan. While this feature may be highly valuable to a limited number of users, it may have little relevance to the majority of users")
    }
  }
  internal enum FunctionalCompleteness {
    /// degree to which the set of functions covers all the specified tasks and user objectives
    internal static let description = Localization.tr("Localizable", "functionalCompleteness.description", fallback: "degree to which the set of functions covers all the specified tasks and user objectives")
    /// Reduce the amount of savings
    internal static let task = Localization.tr("Localizable", "functionalCompleteness.task", fallback: "Reduce the amount of savings")
    /// Completeness
    internal static let title = Localization.tr("Localizable", "functionalCompleteness.title", fallback: "Completeness")
    internal enum Task {
      /// In this version of the application, you cannot reduce the balance because the functionality didn't implemented
      internal static let hint = Localization.tr("Localizable", "functionalCompleteness.task.hint", fallback: "In this version of the application, you cannot reduce the balance because the functionality didn't implemented")
    }
  }
  internal enum FunctionalCorrectness {
    /// degree to which a product or system provides the correct results with the needed degree of precision
    internal static let description = Localization.tr("Localizable", "functionalCorrectness.description", fallback: "degree to which a product or system provides the correct results with the needed degree of precision")
    /// Check the history of operations with the total amount of savings
    internal static let task = Localization.tr("Localizable", "functionalCorrectness.task", fallback: "Check the history of operations with the total amount of savings")
    /// Correctness
    internal static let title = Localization.tr("Localizable", "functionalCorrectness.title", fallback: "Correctness")
    internal enum Task {
      /// In this version of the application, the total amount of savings is calculated with an error
      internal static let hint = Localization.tr("Localizable", "functionalCorrectness.task.hint", fallback: "In this version of the application, the total amount of savings is calculated with an error")
    }
  }
  internal enum Interoperability {
    /// degree to which two or more systems, products or components can exchange information and use the information that has been exchanged
    internal static let description = Localization.tr("Localizable", "interoperability.description", fallback: "degree to which two or more systems, products or components can exchange information and use the information that has been exchanged")
    /// Top up or withdraw money
    internal static let task = Localization.tr("Localizable", "interoperability.task", fallback: "Top up or withdraw money")
    /// Interoperability
    internal static let title = Localization.tr("Localizable", "interoperability.title", fallback: "Interoperability")
    internal enum Task {
      /// In this version of the application, after top up (withdrawal), the amount will be updated, but the "History" section will not change
      internal static let hint = Localization.tr("Localizable", "interoperability.task.hint", fallback: "In this version of the application, after top up (withdrawal), the amount will be updated, but the \"History\" section will not change")
    }
  }
  internal enum Learnability {
    /// degree to which a product or system can be used by specified users to achieve specified goals of learning to use the product or system with effectiveness, efficiency, freedom from risk and satisfaction in a specified context of use
    internal static let description = Localization.tr("Localizable", "learnability.description", fallback: "degree to which a product or system can be used by specified users to achieve specified goals of learning to use the product or system with effectiveness, efficiency, freedom from risk and satisfaction in a specified context of use")
    /// Withdraw an amount exceeding the funds in the account
    internal static let task = Localization.tr("Localizable", "learnability.task", fallback: "Withdraw an amount exceeding the funds in the account")
    /// Learnability
    internal static let title = Localization.tr("Localizable", "learnability.title", fallback: "Learnability")
    internal enum Task {
      /// In this version of the application, withdrawal/top up errors have no description
      internal static let hint = Localization.tr("Localizable", "learnability.task.hint", fallback: "In this version of the application, withdrawal/top up errors have no description")
    }
  }
  internal enum List {
    /// Localizable.strings
    ///   LowQualityApp
    /// 
    ///   Created by Danila on 13.08.2023.
    internal static let title = Localization.tr("Localizable", "list.title", fallback: "Quality Violations")
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
    /// degree to which a system, product or component meets needs for reliability under normal operation
    internal static let description = Localization.tr("Localizable", "maturity.description", fallback: "degree to which a system, product or component meets needs for reliability under normal operation")
    /// Top up your balance three times
    internal static let task = Localization.tr("Localizable", "maturity.task", fallback: "Top up your balance three times")
    /// Maturity
    internal static let title = Localization.tr("Localizable", "maturity.title", fallback: "Maturity")
    internal enum Task {
      /// In this version of the application, a fatal error occurs during the second/third top up
      internal static let hint = Localization.tr("Localizable", "maturity.task.hint", fallback: "In this version of the application, a fatal error occurs during the second/third top up")
    }
  }
  internal enum Operability {
    /// degree to which a product or system has attributes that make it easy to operate and control
    internal static let description = Localization.tr("Localizable", "operability.description", fallback: "degree to which a product or system has attributes that make it easy to operate and control")
    /// Top up or withdraw money
    internal static let task = Localization.tr("Localizable", "operability.task", fallback: "Top up or withdraw money")
    /// Operability
    internal static let title = Localization.tr("Localizable", "operability.title", fallback: "Operability")
    internal enum Task {
      /// In this version of the application, a keyboard does not open automatically and action buttons are too low
      internal static let hint = Localization.tr("Localizable", "operability.task.hint", fallback: "In this version of the application, a keyboard does not open automatically and action buttons are too low")
    }
  }
  internal enum Recoverability {
    /// Recoverability
    internal static let title = Localization.tr("Localizable", "recoverability.title", fallback: "Recoverability")
  }
  internal enum ResourceUtilization {
    /// degree to which the amounts and types of resources used by a product or system, when performing its functions, meet requirements
    internal static let description = Localization.tr("Localizable", "resourceUtilization.description", fallback: "degree to which the amounts and types of resources used by a product or system, when performing its functions, meet requirements")
    /// Use the app for 5 minutes
    internal static let task = Localization.tr("Localizable", "resourceUtilization.task", fallback: "Use the app for 5 minutes")
    /// Resource utilization
    internal static let title = Localization.tr("Localizable", "resourceUtilization.title", fallback: "Resource utilization")
    internal enum Task {
      /// In this version of the application, information about the location will be collected. And also excessive calculations are made, which can lead to heating of the device
      internal static let hint = Localization.tr("Localizable", "resourceUtilization.task.hint", fallback: "In this version of the application, information about the location will be collected. And also excessive calculations are made, which can lead to heating of the device")
    }
  }
  internal enum SampleApp {
    internal enum CallTo {
      internal enum MoneyBox {
        /// Call
        internal static let action = Localization.tr("Localizable", "sampleApp.callTo.moneyBox.action", fallback: "Call")
        /// application for calling special services
        internal static let description = Localization.tr("Localizable", "sampleApp.callTo.moneyBox.description", fallback: "application for calling special services")
        /// 911
        internal static let phone = Localization.tr("Localizable", "sampleApp.callTo.moneyBox.phone", fallback: "911")
        /// Money Box
        internal static let title = Localization.tr("Localizable", "sampleApp.callTo.moneyBox.title", fallback: "Money Box")
        internal enum Title {
          /// MoneyBox
          internal static let short = Localization.tr("Localizable", "sampleApp.callTo.moneyBox.title.short", fallback: "MoneyBox")
        }
      }
    }
    internal enum MoneyBox {
      /// Actions
      internal static let actions = Localization.tr("Localizable", "sampleApp.moneyBox.actions", fallback: "Actions")
      /// Date
      internal static let date = Localization.tr("Localizable", "sampleApp.moneyBox.date", fallback: "Date")
      /// Savings accounting application
      internal static let description = Localization.tr("Localizable", "sampleApp.moneyBox.description", fallback: "Savings accounting application")
      /// Error
      internal static let error = Localization.tr("Localizable", "sampleApp.moneyBox.error", fallback: "Error")
      /// History
      internal static let history = Localization.tr("Localizable", "sampleApp.moneyBox.history", fallback: "History")
      /// Savings
      internal static let savings = Localization.tr("Localizable", "sampleApp.moneyBox.savings", fallback: "Savings")
      /// Amount
      internal static let sum = Localization.tr("Localizable", "sampleApp.moneyBox.sum", fallback: "Amount")
      /// MoneyBox
      internal static let title = Localization.tr("Localizable", "sampleApp.moneyBox.title", fallback: "MoneyBox")
      internal enum Error {
        /// Invalid Amount
        internal static let invalidAmount = Localization.tr("Localizable", "sampleApp.moneyBox.error.invalidAmount", fallback: "Invalid Amount")
        /// Failed to get the value
        internal static let stringToDecimal = Localization.tr("Localizable", "sampleApp.moneyBox.error.stringToDecimal", fallback: "Failed to get the value")
        /// The service is temporarily unavailable, try again later
        internal static let unavailable = Localization.tr("Localizable", "sampleApp.moneyBox.error.unavailable", fallback: "The service is temporarily unavailable, try again later")
        internal enum TopUp {
          /// The top up amount must be greater than zero
          internal static let lessOrEqualZero = Localization.tr("Localizable", "sampleApp.moneyBox.error.topUp.lessOrEqualZero", fallback: "The top up amount must be greater than zero")
        }
        internal enum Withdraw {
          /// The withdraw amount must be greater than zero
          internal static let lessOrEqualZero = Localization.tr("Localizable", "sampleApp.moneyBox.error.withdraw.lessOrEqualZero", fallback: "The withdraw amount must be greater than zero")
          /// The withdraw amount must not exceed the amount on the account
          internal static let moreThenTotalSum = Localization.tr("Localizable", "sampleApp.moneyBox.error.withdraw.moreThenTotalSum", fallback: "The withdraw amount must not exceed the amount on the account")
        }
      }
      internal enum SumForm {
        internal enum Alert {
          /// Ok
          internal static let ok = Localization.tr("Localizable", "sampleApp.moneyBox.sumForm.alert.ok", fallback: "Ok")
        }
      }
      internal enum TopUp {
        /// Top Up
        internal static let action = Localization.tr("Localizable", "sampleApp.moneyBox.topUp.action", fallback: "Top Up")
        /// Specify the amount (in USD) and the date of enrollment
        internal static let hint = Localization.tr("Localizable", "sampleApp.moneyBox.topUp.hint", fallback: "Specify the amount (in USD) and the date of enrollment")
        /// Top Up
        internal static let title = Localization.tr("Localizable", "sampleApp.moneyBox.topUp.title", fallback: "Top Up")
      }
      internal enum Withdraw {
        /// Withdraw
        internal static let action = Localization.tr("Localizable", "sampleApp.moneyBox.withdraw.action", fallback: "Withdraw")
        /// Specify the amount (in USD) and the date of withdrawal
        internal static let hint = Localization.tr("Localizable", "sampleApp.moneyBox.withdraw.hint", fallback: "Specify the amount (in USD) and the date of withdrawal")
        /// Withdraw
        internal static let title = Localization.tr("Localizable", "sampleApp.moneyBox.withdraw.title", fallback: "Withdraw")
      }
    }
  }
  internal enum TimeBehaviour {
    /// degree to which the response and processing times and throughput rates of a product or system, when performing its functions, meet requirements
    internal static let description = Localization.tr("Localizable", "timeBehaviour.description", fallback: "degree to which the response and processing times and throughput rates of a product or system, when performing its functions, meet requirements")
    /// Top up or withdraw money
    internal static let task = Localization.tr("Localizable", "timeBehaviour.task", fallback: "Top up or withdraw money")
    /// Time behaviour
    internal static let title = Localization.tr("Localizable", "timeBehaviour.title", fallback: "Time behaviour")
    internal enum Task {
      /// In this version of the application, there may be a delay in the initial screen loading time, and certain button taps may also experience a processing delay.
      internal static let hint = Localization.tr("Localizable", "timeBehaviour.task.hint", fallback: "In this version of the application, there may be a delay in the initial screen loading time, and certain button taps may also experience a processing delay.")
    }
  }
  internal enum UserErrorProtection {
    /// degree to which a system protects users against making errors
    internal static let description = Localization.tr("Localizable", "userErrorProtection.description", fallback: "degree to which a system protects users against making errors")
    /// Withdraw an amount exceeding the funds in the account
    internal static let task = Localization.tr("Localizable", "userErrorProtection.task", fallback: "Withdraw an amount exceeding the funds in the account")
    /// User error protection
    internal static let title = Localization.tr("Localizable", "userErrorProtection.title", fallback: "User error protection")
    internal enum Task {
      /// In this version of the application, you can withdraw funds exceeding the budget
      internal static let hint = Localization.tr("Localizable", "userErrorProtection.task.hint", fallback: "In this version of the application, you can withdraw funds exceeding the budget")
    }
  }
  internal enum UserInterfaceAesthetics {
    /// degree to which a user interface enables pleasing and satisfying interaction for the user
    internal static let description = Localization.tr("Localizable", "userInterfaceAesthetics.description", fallback: "degree to which a user interface enables pleasing and satisfying interaction for the user")
    /// View the history of operations
    internal static let task = Localization.tr("Localizable", "userInterfaceAesthetics.task", fallback: "View the history of operations")
    /// User interface aesthetics
    internal static let title = Localization.tr("Localizable", "userInterfaceAesthetics.title", fallback: "User interface aesthetics")
    internal enum Task {
      /// In this version of the application, operation history has problems with margins and fonts
      internal static let hint = Localization.tr("Localizable", "userInterfaceAesthetics.task.hint", fallback: "In this version of the application, operation history has problems with margins and fonts")
    }
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
