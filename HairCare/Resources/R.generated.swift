//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  /// This `R.color` struct is generated, and contains static references to 3 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")
    /// Color `AsyncImagePlaceholder`.
    static let asyncImagePlaceholder = Rswift.ColorResource(bundle: R.hostingBundle, name: "AsyncImagePlaceholder")
    /// Color `CardBackground`.
    static let cardBackground = Rswift.ColorResource(bundle: R.hostingBundle, name: "CardBackground")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AsyncImagePlaceholder", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func asyncImagePlaceholder(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.asyncImagePlaceholder, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "CardBackground", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func cardBackground(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.cardBackground, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AsyncImagePlaceholder", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func asyncImagePlaceholder(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.asyncImagePlaceholder.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "CardBackground", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func cardBackground(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.cardBackground.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 3 images.
  struct image {
    /// Image `SampleProduct2`.
    static let sampleProduct2 = Rswift.ImageResource(bundle: R.hostingBundle, name: "SampleProduct2")
    /// Image `SampleProduct`.
    static let sampleProduct = Rswift.ImageResource(bundle: R.hostingBundle, name: "SampleProduct")
    /// Image `StartPageBackground`.
    static let startPageBackground = Rswift.ImageResource(bundle: R.hostingBundle, name: "StartPageBackground")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "SampleProduct", bundle: ..., traitCollection: ...)`
    static func sampleProduct(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.sampleProduct, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "SampleProduct2", bundle: ..., traitCollection: ...)`
    static func sampleProduct2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.sampleProduct2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "StartPageBackground", bundle: ..., traitCollection: ...)`
    static func startPageBackground(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.startPageBackground, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 4 localization tables.
  struct string {
    /// This `R.string.homePage` struct is generated, and contains static references to 1 localization keys.
    struct homePage {
      /// en translation: New collection
      ///
      /// Locales: en, pt-BR
      static let new_collection = Rswift.StringResource(key: "new_collection", tableName: "HomePage", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)

      /// en translation: New collection
      ///
      /// Locales: en, pt-BR
      static func new_collection(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("new_collection", tableName: "HomePage", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "HomePage", preferredLanguages: preferredLanguages) else {
          return "new_collection"
        }

        return NSLocalizedString("new_collection", tableName: "HomePage", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    /// This `R.string.productDetail` struct is generated, and contains static references to 5 localization keys.
    struct productDetail {
      /// en translation: Add to cart
      ///
      /// Locales: en, pt-BR
      static let add_to_cart = Rswift.StringResource(key: "add_to_cart", tableName: "ProductDetail", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      /// en translation: Description
      ///
      /// Locales: en, pt-BR
      static let description = Rswift.StringResource(key: "description", tableName: "ProductDetail", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      /// en translation: Details
      ///
      /// Locales: en, pt-BR
      static let details = Rswift.StringResource(key: "details", tableName: "ProductDetail", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      /// en translation: Ingredients
      ///
      /// Locales: en, pt-BR
      static let ingredients = Rswift.StringResource(key: "ingredients", tableName: "ProductDetail", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      /// en translation: Read more
      ///
      /// Locales: en, pt-BR
      static let read_more = Rswift.StringResource(key: "read_more", tableName: "ProductDetail", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)

      /// en translation: Add to cart
      ///
      /// Locales: en, pt-BR
      static func add_to_cart(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("add_to_cart", tableName: "ProductDetail", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "ProductDetail", preferredLanguages: preferredLanguages) else {
          return "add_to_cart"
        }

        return NSLocalizedString("add_to_cart", tableName: "ProductDetail", bundle: bundle, comment: "")
      }

      /// en translation: Description
      ///
      /// Locales: en, pt-BR
      static func description(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("description", tableName: "ProductDetail", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "ProductDetail", preferredLanguages: preferredLanguages) else {
          return "description"
        }

        return NSLocalizedString("description", tableName: "ProductDetail", bundle: bundle, comment: "")
      }

      /// en translation: Details
      ///
      /// Locales: en, pt-BR
      static func details(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("details", tableName: "ProductDetail", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "ProductDetail", preferredLanguages: preferredLanguages) else {
          return "details"
        }

        return NSLocalizedString("details", tableName: "ProductDetail", bundle: bundle, comment: "")
      }

      /// en translation: Ingredients
      ///
      /// Locales: en, pt-BR
      static func ingredients(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("ingredients", tableName: "ProductDetail", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "ProductDetail", preferredLanguages: preferredLanguages) else {
          return "ingredients"
        }

        return NSLocalizedString("ingredients", tableName: "ProductDetail", bundle: bundle, comment: "")
      }

      /// en translation: Read more
      ///
      /// Locales: en, pt-BR
      static func read_more(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("read_more", tableName: "ProductDetail", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "ProductDetail", preferredLanguages: preferredLanguages) else {
          return "read_more"
        }

        return NSLocalizedString("read_more", tableName: "ProductDetail", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    /// This `R.string.startPage` struct is generated, and contains static references to 1 localization keys.
    struct startPage {
      /// en translation: Get Started
      ///
      /// Locales: pt-BR, en
      static let get_started = Rswift.StringResource(key: "get_started", tableName: "StartPage", bundle: R.hostingBundle, locales: ["pt-BR", "en"], comment: nil)

      /// en translation: Get Started
      ///
      /// Locales: pt-BR, en
      static func get_started(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("get_started", tableName: "StartPage", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "StartPage", preferredLanguages: preferredLanguages) else {
          return "get_started"
        }

        return NSLocalizedString("get_started", tableName: "StartPage", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    /// This `R.string.storeItemCategory` struct is generated, and contains static references to 5 localization keys.
    struct storeItemCategory {
      /// en translation: Conditioner
      ///
      /// Locales: en, pt-BR
      static let conditioner = Rswift.StringResource(key: "conditioner", tableName: "StoreItemCategory", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      /// en translation: Hair mask
      ///
      /// Locales: en, pt-BR
      static let hair_mask = Rswift.StringResource(key: "hair_mask", tableName: "StoreItemCategory", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      /// en translation: Packs
      ///
      /// Locales: en, pt-BR
      static let packs = Rswift.StringResource(key: "packs", tableName: "StoreItemCategory", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      /// en translation: Painting
      ///
      /// Locales: en, pt-BR
      static let painting = Rswift.StringResource(key: "painting", tableName: "StoreItemCategory", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      /// en translation: Shampoo
      ///
      /// Locales: en, pt-BR
      static let shampoo = Rswift.StringResource(key: "shampoo", tableName: "StoreItemCategory", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)

      /// en translation: Conditioner
      ///
      /// Locales: en, pt-BR
      static func conditioner(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("conditioner", tableName: "StoreItemCategory", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "StoreItemCategory", preferredLanguages: preferredLanguages) else {
          return "conditioner"
        }

        return NSLocalizedString("conditioner", tableName: "StoreItemCategory", bundle: bundle, comment: "")
      }

      /// en translation: Hair mask
      ///
      /// Locales: en, pt-BR
      static func hair_mask(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("hair_mask", tableName: "StoreItemCategory", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "StoreItemCategory", preferredLanguages: preferredLanguages) else {
          return "hair_mask"
        }

        return NSLocalizedString("hair_mask", tableName: "StoreItemCategory", bundle: bundle, comment: "")
      }

      /// en translation: Packs
      ///
      /// Locales: en, pt-BR
      static func packs(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("packs", tableName: "StoreItemCategory", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "StoreItemCategory", preferredLanguages: preferredLanguages) else {
          return "packs"
        }

        return NSLocalizedString("packs", tableName: "StoreItemCategory", bundle: bundle, comment: "")
      }

      /// en translation: Painting
      ///
      /// Locales: en, pt-BR
      static func painting(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("painting", tableName: "StoreItemCategory", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "StoreItemCategory", preferredLanguages: preferredLanguages) else {
          return "painting"
        }

        return NSLocalizedString("painting", tableName: "StoreItemCategory", bundle: bundle, comment: "")
      }

      /// en translation: Shampoo
      ///
      /// Locales: en, pt-BR
      static func shampoo(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("shampoo", tableName: "StoreItemCategory", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "StoreItemCategory", preferredLanguages: preferredLanguages) else {
          return "shampoo"
        }

        return NSLocalizedString("shampoo", tableName: "StoreItemCategory", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      // There are no resources to validate
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R {
  fileprivate init() {}
}
